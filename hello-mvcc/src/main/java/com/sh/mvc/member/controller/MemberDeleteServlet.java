package com.sh.mvc.member.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sh.mvc.member.model.service.MemberService;
import com.sh.mvc.member.model.vo.Member;

/**
 * Servlet implementation class MemberDeleteServlet
 */
@WebServlet("/member/memberDelete")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final MemberService memberService = new MemberService();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 사용자 입력값 처리
		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		String memberId = loginMember.getMemberId();
		
		//2. 서비스로직호출
		int result = memberService.deleteMember(memberId);
		
		// 세션 속성 삭제
		Enumeration<String> names = session.getAttributeNames(); // 저장된 모든 속성명을 열람가능한 타입으로 반환
		while(names.hasMoreElements()) {	// session에 남아있는게 없을때까지
			String name = names.nextElement();
			session.removeAttribute(name);
		}
		
		// 쿠키 삭제
		Cookie cookie = new Cookie("saveId", memberId);
		cookie.setPath(request.getContextPath());
		cookie.setMaxAge(0);
		response.addCookie(cookie); // Set-Cookie 응답헤더에 전송

		//3. 리다이렉트 처리
		session.setAttribute("msg", "이용해 주셔서 감사합니다.");
		response.sendRedirect(request.getContextPath() + "/");
	}

}
