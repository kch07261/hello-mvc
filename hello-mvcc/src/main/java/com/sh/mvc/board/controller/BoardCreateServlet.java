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
 * Servlet implementation class BoardCreateServlet
 */
@WebServlet("/board/boardCreate")
public class BoardCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final BoardService boardService = new BoardService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/board/boardCreate.jsp")
			.forward(request, response);
	}

	/**
	 * 파일업로드
	 * 1. 파일업로드 HttpServletRequest -> MultipartRequest (기존 Request객체는 사용불가)		->  서버에저장
	 * 2. 업로드파일정보를 DB attachment에 저장		->  한행한행 출력
	 * 
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// 업로드파일 저장경로 C:\\Workspaces\\web_server_workspace\\hello-mvc\\src\\main\\webapp\\upload\\board
		ServletContext application = getServletContext();
		String saveDirectory = application.getRealPath("/upload/board");
		System.out.println("saveDirectory = " + saveDirectory);
		// 파일하나당 최대크기 10MB
		int maxPostSize = 1024 * 1024 * 10;
		// 인코딩
		String encoding = "utf-8";
		
		// 파일명 재지정 정책객체
		// 한글.txt --> 20230629_160430123_999.txt
//		FileRenamePolicy policy = new DefaultFileRenamePolicy(); // a.txt, a1.txt, a2.txt, ...
		FileRenamePolicy policy = new HelloMvcFileRenamePolicy();
		
		MultipartRequest multiReq = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
		
		// 1. 사용자 입력값 처리
		String title = multiReq.getParameter("title");
		String writer = multiReq.getParameter("writer");
		String content = multiReq.getParameter("content");
		Board board = new Board();
		board.setTitle(title);
		board.setWriter(writer);
		board.setContent(content);
		System.out.println(board);

		// Attachment객체 생성 (Board 추가)
		Enumeration<String> filenames = multiReq.getFileNames(); // upFile1, upFile2
		while(filenames.hasMoreElements()) {
			String name = filenames.nextElement(); // input:file[name]
			File upFile = multiReq.getFile(name);
			if(upFile != null) {
				Attachment attach = new Attachment();
				attach.setOriginalFilename(multiReq.getOriginalFileName(name));	// setOriginalFilename()의 인자는 사용자가 업로드한 파일 경로
				attach.setRenamedFilename(multiReq.getFilesystemName(name)); // renamedFilename
				board.addAttachment(attach);
			}
		}
		
		// 2. 업무로직
		int result = boardService.insertBoard(board);
		
		// 3. 응답처리 (목록페이지로 redirect) - POST방식 DML처리후 url변경을 위해 redirect처리
		request.getSession().setAttribute("msg", "게시글이 성공적으로 등록되었습니다.");
		
		response.sendRedirect(request.getContextPath() + "/board/boardDetail?no=" + board.getNo());
	}

}
