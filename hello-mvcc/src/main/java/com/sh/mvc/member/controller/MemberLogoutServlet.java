package com.sh.mvc.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MemberLogoutServlet
 */
@WebServlet("/member/logout")
public class MemberLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 세션ID등이 유효하지 않은경우 null을 반환
		HttpSession session = request.getSession(false);
		if(session != null)
			session.invalidate();
		
		// forward(html) | redirect(url변경)
		response.sendRedirect(request.getContextPath() + "/");
		
//		request.getRequestDispatcher("/index.jsp").forward(request, response);
		
	}

}
