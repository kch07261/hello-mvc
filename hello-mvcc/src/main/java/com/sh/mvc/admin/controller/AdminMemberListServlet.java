package com.sh.mvc.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.mvc.member.model.service.MemberService;
import com.sh.mvc.member.model.vo.Member;

/**
 * Servlet implementation class AdminMemberListServlet
 */
@WebServlet("/admin/memberList")
public class AdminMemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final MemberService memberService = new MemberService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 입력값 처리
		
		// 2. 업무로직
		List<Member> members = memberService.findAll();
		System.out.println("members = " + members);
		request.setAttribute("members", members);
		
		// 3. 응답처리 forward jsp
		request.getRequestDispatcher("/WEB-INF/views/admin/memberList.jsp")
			.forward(request, response);
	}

}
