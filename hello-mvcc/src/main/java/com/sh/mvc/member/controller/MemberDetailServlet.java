package com.sh.mvc.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sh.mvc.member.model.vo.Member;

/**
 * Servlet implementation class MemberDetailServlet
 */
@WebServlet("/member/memberDetail")
public class MemberDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// 0. 로그인 여부 확인
//		HttpSession session = request.getSession();
//		Member loginMember = (Member)session.getAttribute("loginMember");
//		if(loginMember == null) {	// 로그인을 안했다면
//			session.setAttribute("msg", "로그인후 이용하실수 있습니다.");
//			response.sendRedirect(request.getContextPath() + "/");
//			return;
//		}
		
		// 1. 입력값처리
		// 2. 업무로직 (로그인 한 상태라 session에 정보 있음)
		// 3. 응답처리
		request.getRequestDispatcher("/WEB-INF/views/member/memberDetail.jsp")
			.forward(request, response);
	}

}
