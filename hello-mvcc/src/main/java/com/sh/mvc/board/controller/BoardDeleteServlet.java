package com.sh.mvc.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.mvc.board.model.service.BoardService;

/**
 * Servlet implementation class BoardDeleteServlet
 */
@WebServlet("/board/boardDelete")
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final BoardService boardService = new BoardService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 사용자 입력값 처리
		int no = Integer.parseInt(request.getParameter("no"));
		
		// 2. 업무로직
		// 서버컴퓨터에 저장된 첨부파일 삭제
		// Attachment#renamedFilename
		
		
		// board행 삭제 - attachment행 삭제 (fk on delete cascade)
		int result = boardService.deleteBoard(no);

		
		// 3. 응답처리
		request.getSession().setAttribute("msg", "게시글을 성공적으로 삭제했습니다.");
		response.sendRedirect(request.getContextPath() + "/board/boardList");
	}

}
