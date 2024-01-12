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
 * Servlet implementation class AdminMemberFinderServlet
 */
@WebServlet("/admin/memberFinder")
public class AdminMemberFinderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final MemberService memberService = new MemberService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 입력값 처리
		String searchType = request.getParameter("searchType");
		String searchKeyword = request.getParameter("searchKeyword");
		System.out.println("searchType = " + searchType);
		System.out.println("searchKeyword = " + searchKeyword);
		
		// 2. 업무로직 (검색)
		// select * from member where member_id like '%abc%'
		// select * from member where name like '%동%'
		// select * from member where gender like '%M%' -> gender는 like가 필요없지만 한번에 처리하기 위해 사용
		// select * from member where # like ? // #은 컬럼명이 대입될 공간. String#replace 	(Jdbc에서 제공x)
		List<Member> members = memberService.searchMember(searchType, searchKeyword);
		System.out.println("members = " + members);
		
		request.setAttribute("members", members);
		
		// 3. 응답처리
		request.getRequestDispatcher("/WEB-INF/views/admin/memberList.jsp")
			.forward(request, response);
	}

}
