package com.sh.mvc.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sh.mvc.common.util.HelloMvcUtils;
import com.sh.mvc.member.model.service.MemberService;
import com.sh.mvc.member.model.vo.Member;

/**
 * 컨텍스트객체
 * - pageContext : PageContext
 * - request : HttpServletRequest
 * - session : HttpSession
 * - application : ServletContext
 * 
 * 위 객체는 모두 setAttribute(String, Object), getAttribute(String): Object를 지원한다.
 * 
 * 
 * Session | Cookie
 * - http통신의 상태관리 메커니즘
 * - 기본적으로 http통신은 stateless하다. (browser에서 server로 한번 요청후, 응답을 받으면 연결을 끊는다.)
 * - 이전에 요청했던 사용자가 다음 요청시 동일한 사용자인것을 구분할 수 없다. (로그인했다가 페이지이동시 로그인 풀림.)
 * 
 * - Session : 사용자정보를 서버쪽에 보관하는 기술
 * - Cookie : 사용자정보를 클라이언트(브라우져)에 보관하는 기술
 * 
 * - 발급 및 사용과정
 * 1. 클라이언트 최초요청(요청에 JSESSIONID 없음)시 서버는 세션객체 생성
 * 2. 발급된 세션아이디를 응답에 전송(Set-Cookie: 세션ID)
 * 3. 클라이언트는 JSESSIONID:세션ID로 쿠키 저장
 * 4. 클라이언트는 다음 요청부터 매번 요청헤더에 Cookie항목으로 JSESSIONID를 함께 전송.
 * 5. 서버에서는 JSESSIONID 검증후 해당 session객체 사용하도록 해줌.
 * 
 * - Session객체는 클라이언트별로 생성해 관리한다.
 * - 기본적으로 세션객체 유효시간은 30분(마지막 요청시간으로부터)이다.
 * 
 * request.getSession(create: boolean)
 * - 세션이 유효하지 않은 경우 생성여부
 * - true(기본값) : 세션id가 유효하지 않거나 없는 경우 세션객체를 새로 생성해서 반환
 * - false : 세션id가 유효하지 않거나 없는 경우 null을 반환
 * 
 */
@WebServlet("/member/login")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private final MemberService memberService = new MemberService();
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 0. 인코딩처리
		request.setCharacterEncoding("utf-8");
		// 1. 사용자 입력값 (memberId, password)
		String memberId = request.getParameter("memberId");
		String password = HelloMvcUtils.getEncrytedPassword(request.getParameter("password"), memberId);
		System.out.println(password);
		String saveId = request.getParameter("saveId");
		System.out.println("memberId = " + memberId);
		System.out.println("password = " + password);
		System.out.println("saveId = " + saveId);		// checkbox : on / null
		
		// 2. 업무로직(매번달라짐) - 로그인확인
		// 아이디로 db에서 조회 select * from member where member_id = ?
		// member객체가 null이 아니면서 비밀번호가 일치하면 로그인성공
		// member객체가 null이거나 비밀번호가 일치하지 않으면 로그인실패
		Member member = memberService.findById(memberId);
//		System.out.println("member@servlet = " + member);
		
		HttpSession session = request.getSession();	// request.getSession(true)와 동일.(기본값 true)
//		System.out.println(session.getId());
		
		if(member != null && password.equals(member.getPassword())) {
			// 로그인 성공
			session.setAttribute("loginMember", member);		// request에 담지 않고 session에 담음	cause : request는 생명주기가 짧음
//			session.setAttribute("msg", "로그인에 성공했습니다");	// request에 담지 않고 session에 담음	cause : request는 생명주기가 짧음
			
			// 아이디저장 쿠키처리
			// - Path : 쿠키를 사용할 url. 서버전송시 부모경로만 지정. 
			//		- /(슬래쉬) 설정시 모든 요청에 사용. 
			//		- /mvc설정시 /mvc로 시작하는 모든 요청에 사용
			// - Session Cookie : setMaxAge설정하지 않은 경우. 접속한 동안만 클라이언트에 보관
			// - Persistent Cookie : setMaxAge설정한 경우. 지정한 시각까지만 클라이언트에 보관
			
			if(saveId != null) {	// 아이디 저장 체크 되어있을 시
				Cookie cookie = new Cookie("saveId", memberId);	// 로그인한 아이디를 name, value 저장
				cookie.setPath(request.getContextPath()); // 쿠키를 사용할 url
				cookie.setMaxAge(60 * 60 * 24 * 7); // 쿠키 유효기간 7일
				response.addCookie(cookie); // 응답 헤더 Set-Cookie : saveId=honggd
			}
			else {
				// 기존의 쿠키 삭제
				Cookie cookie = new Cookie("saveId", memberId);
				cookie.setPath(request.getContextPath()); // 쿠키를 사용할 url
				cookie.setMaxAge(0); // 클라이언트에 있던 쿠키의 만료기간을 0으로 변경함과 동시에 삭제
				response.addCookie(cookie); // 응답 헤더 Set-Cookie : saveId=honggd
			}
			
		}
		else {
			// 로그인 실패
			session.setAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
		}
		
		// 3. 응답처리
//		response.sendRedirect(request.getContextPath() + "/"); // redirect를 통한 url변경
//		RequestDispatcher reqDispatcher = request.getRequestDispatcher("/index.jsp");
//		reqDispatcher.forward(request, response);		// forwarding을 사용하면 URL에 계속 남아있는다.
		String referer = request.getHeader("Referer");
		System.out.println("referer = " + referer);
		response.sendRedirect(referer);
	}

}
