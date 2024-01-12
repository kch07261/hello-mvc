package com.sh.mvc.board.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.mvc.board.model.service.BoardService;
import com.sh.mvc.board.model.vo.Attachment;

/**
 * Servlet implementation class BoardFileDownloadServlet
 */
@WebServlet("/board/fileDownload")
public class BoardFileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final BoardService boardService = new BoardService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 사용자입력값 처리
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println("no = " + no);
		
		// 2. 업무로직
		Attachment attach = boardService.findAttachmentById(no);
		System.out.println("attach = " + attach);
		
		// 3. 응답처리 - 직접 응답메세지에 파일 이진데이터 출력
		// 헤더설정				//		이진 파일이라고 알려줌;
		String filename = URLEncoder.encode(attach.getOriginalFilename(), "utf-8");
		response.setContentType("application/octet-stream; charset=utf-8");
		response.setHeader("Content-Disposition", "attachment; filename=" + filename);
		
		// 바디 파일데이터 출력
		// 실제파일을 읽어서, 응답에 쓰기
		String saveDirectory = getServletContext().getRealPath("/upload/board");
		//						부모dir		,		실제 파일명
		File downFile = new File(saveDirectory, attach.getRenamedFilename());
		OutputStream os = response.getOutputStream(); // 응답에서 가져오기
		
		// 출력스트림
		// 입력스트림
		// 1byte 바이트기반 - 파일(이미지, 음악, 동영상....) InputStream/OutputStream
		// 2byte 문자기반 - 텍스트파일	Reader/Writer
		// 기본스트림 - 필수
		// 보조스트림 - 성능향상/부가적기능
		// 보조스트림 = new 보조스트림(new 기본스트림(대상))
		try (
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(downFile));
			BufferedOutputStream bos = new BufferedOutputStream(os);
		) {
			byte[] buf = new byte[8192]; // 8kb
			int len = 0; // buf에 읽어들인 바이트수
			while ((len = bis.read(buf)) != -1) {
				//		buf를 0번지부터 len까지
				bos.write(buf, 0, len);
			}
		}
		
		
		
	}

}
