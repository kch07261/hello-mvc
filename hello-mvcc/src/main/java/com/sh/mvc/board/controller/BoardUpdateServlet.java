package com.sh.mvc.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.sh.mvc.board.model.service.BoardService;
import com.sh.mvc.board.model.vo.Attachment;
import com.sh.mvc.board.model.vo.Board;
import com.sh.mvc.common.HelloMvcFileRenamePolicy;

/**
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet("/board/boardUpdate")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final BoardService boardService = new BoardService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 사용자입력값 처리
		int no = Integer.parseInt(request.getParameter("no"));
		// 2. 업무로직
		Board board = boardService.findById(no);
		request.setAttribute("board", board);
		// 3. 응답처리
		request.getRequestDispatcher("/WEB-INF/views/board/boardUpdate.jsp")
			.forward(request, response);
		
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ServletContext application = getServletContext();
		String saveDirectory = application.getRealPath("/upload/board");
		System.out.println("saveDirectory = " + saveDirectory);
		
		int maxPostSize = 1024 * 1024 * 10;
		String encoding = "utf-8";
		
		FileRenamePolicy policy = new HelloMvcFileRenamePolicy();
		
		MultipartRequest multiReq = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
		
		// 1. 사용자 입력값 처리
		int no = Integer.parseInt(multiReq.getParameter("no"));
		String title = multiReq.getParameter("title");
		String writer = multiReq.getParameter("writer");
		String content = multiReq.getParameter("content");
		// db attachment 행삭제, 저장된 파일삭제
		String[] delFiles = multiReq.getParameterValues("delFile");
		
		// update board set ? = ? where no = ?
		Board board = new Board();
		board.setNo(no);
		board.setTitle(title);
		board.setWriter(writer);
		board.setContent(content);
		System.out.println(board);
		
		// Attachment객체 생성 (Board 추가)
		Enumeration<String> filenames = multiReq.getFileNames();
		while(filenames.hasMoreElements()) {
			String name = filenames.nextElement(); // input:file[name]
			File upFile = multiReq.getFile(name);
			if(upFile != null) {
				Attachment attach = new Attachment();
				attach.setOriginalFilename(multiReq.getOriginalFileName(name));
				attach.setRenamedFilename(multiReq.getFilesystemName(name)); // renamedFilename
				attach.setBoardNo(no); // fk컬럼 boardNo 바로 설정 가능
				board.addAttachment(attach);
			}
		}
		
		// 2. 업무로직
		int result = boardService.updateBoard(board);
		
		// 첨부파일 삭제
		if(delFiles != null) {
			for(String _attachNo : delFiles) {
				int attachNo = Integer.parseInt(_attachNo);
				// a. 파일삭제
				Attachment attach = boardService.findAttachmentById(attachNo); // db 조회
				// java.io.File : 실제파일을 가리키는 자바객체
				File delFile = new File(saveDirectory, attach.getRenamedFilename());
				if(delFile.exists()) // delFile이 존재 할 경우에만
					delFile.delete();	// delFile 삭제
				System.out.println(attach.getRenamedFilename() + " : " + delFile.exists());
				
				// b. db attachment 행 삭제
				result = boardService.deleteAttachment(attachNo);
			}
		}
		
		// 3. 응답처리 (목록페이지로 redirect) - POST방식 DML처리후 url변경을 위해 redirect처리
		response.sendRedirect(request.getContextPath() + "/board/boardDetail?no=" + board.getNo());
		
	}

}
