package com.sh.mvc.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.mvc.board.model.service.BoardService;
import com.sh.mvc.board.model.vo.Board;
import com.sh.mvc.common.util.HelloMvcUtils;

/**
 * 페이징처리
 * 1. 컨텐츠 영역
 *  - cpage 현재페이지
 *  - limit 한페이지당 게시물수
 *  
 * 2. 페이지바 영역
 *  - totalContent 전체게시물수
 *  - totalPage 전체페이지수
 *  - pagebarSize 5/10개
 *  - pageStart 페이지바 시작번호
 *  - pageEnd 페이지바 끝번호
 *  - pageNo 페이지바의 숫자(반복처리)
 *  - url 요청url
 * 
 */
@WebServlet("/board/boardList")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final BoardService boardService = new BoardService();
	private final int LIMIT = 10; // 한페이지당 게시물수
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 사용자입력값 처리
		int cpage = 1; // 기본값처리
		try {
			cpage = Integer.parseInt(request.getParameter("cpage"));
		}catch (NumberFormatException e) {
			// 예외처리외에 아무것도 하지 않음.
		}
		// cpage = 1 -> start = 1, end = 10
		// cpage = 2 -> start = 11, end = 20
		// cpage = 3 -> start = 21, end = 30
		int start = (cpage - 1) * LIMIT + 1;
		int end = cpage * LIMIT;
		
		// 2. 업무로직
		List<Board> boards = boardService.findAll(start, end);
		System.out.println("boards = " + boards);
		
		// xss공격대비처리
		for(Board board : boards) {
			board.setTitle(HelloMvcUtils.escapeHtml(board.getTitle()));
		}
		
		// 페이지바영역 처리
		int totalContent = boardService.getTotalContent();	// 1행 1열은 DQL도 int나 String으로 받아올 수 있다.
		System.out.println("totalContent = " + totalContent);
		String url = request.getRequestURI(); // /mvc/board/boardList
		String pagebar = HelloMvcUtils.getPagebar(cpage, LIMIT, totalContent, url);
		System.out.println("pagebar = " + pagebar);
		
		request.setAttribute("boards", boards);
		request.setAttribute("pagebar", pagebar);
		
		// 3. 응답처리
		request.getRequestDispatcher("/WEB-INF/views/board/boardList.jsp")
			.forward(request, response);
		
		
	}

}
