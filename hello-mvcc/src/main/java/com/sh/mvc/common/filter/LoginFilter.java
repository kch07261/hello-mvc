package com.sh.mvc.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sh.mvc.member.model.vo.Member;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter({ 
	"/member/memberDetail", 
	"/member/memberUpdate", 
	"/member/memberDelete",
	"/board/boardCreate",
	"/board/boardUpdate",
	"/board/boardDelete",
	"/board/boardCommentCreate",
	"/board/boardCommentUpdate",
	"/chat/chat"
})
public class LoginFilter extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public LoginFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		System.out.println("[Login 체크중...]");
		
		HttpServletRequest httpReq = (HttpServletRequest) request;
		HttpServletResponse httpRes = (HttpServletResponse) response;
		
		HttpSession session = httpReq.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) {	// 로그인을 안했다면
			session.setAttribute("msg", "로그인후 이용하실수 있습니다.");
			httpRes.sendRedirect(httpReq.getContextPath() + "/");
			return;	// 이후 코드 실행되지 않음
		}
		
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
