<%@page import="com.sh.mvc.member.model.vo.MemberRole"%>
<%@page import="com.sh.mvc.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String) session.getAttribute("msg");
	if(msg != null) session.removeAttribute("msg"); // 1회용
	// System.out.println("msg = " + msg);
	
	Member loginMember = (Member) session.getAttribute("loginMember");
	// System.out.println("loginMember = " + loginMember);
	
	Cookie[] cookies = request.getCookies();
	String saveId = null;
	if(cookies != null) {
		for(Cookie cookie : cookies) {
			String name = cookie.getName();
			String value = cookie.getValue();
			//System.out.println("[Cookie] " + name + " = " + value);
			if ("saveId".equals(name))
				saveId = value;
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello MVC</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css" />
<script src="<%= request.getContextPath() %>/js/jquery-3.7.0.js"></script>
<% if(loginMember != null) { %>
	<script src="<%= request.getContextPath() %>/js/ws.js"></script>
<% } %>
<script>
window.onload = () => {
	
<% if(msg != null) { %>
	alert('<%= msg %>');
<%	} %>
	
<% 	if(loginMember == null) { %>	
	document.loginFrm.onsubmit = (e) => {
		// 아이디
		const memberId = e.target.memberId;
		if(!/^\w{4,}$/.test(memberId.value)) {
			alert("아이디는 4글자 이상 입력하세요.");
			e.preventDefault();
			return;
		}
		
		// 비밀번호
		const password = e.target.password;
		if(!/^.{4,}$/.test(password.value)) {
			alert("비밀번호는 4글자 이상 입력하세요.");
			e.preventDefault();
			return;
		}
	}
<%	} %>
};
</script>
</head>
<body>

	<div id="container">
		<header>
			<h1>Hello MVC</h1>
			<div class="login-container">
<%				if(loginMember == null) { %>
                <!-- 로그인폼 시작 -->
                <form id="loginFrm" name="loginFrm" action="<%= request.getContextPath() %>/member/login" method="post">
                    <table>
                        <tr>
                            <td>
                            <input 
	                            type="text" name="memberId" id="memberId" placeholder="아이디" 
	                            tabindex="1"
	                            value="<%= saveId != null ? saveId : "" %>">
                            </td>
                            
                            <td><input type="submit" value="로그인" tabindex="3"></td>
                        </tr>
                        <tr>
                            <td>
                            <input 
                            type="password"
                            tabindex="2" 
                            name="password" 
                            id="password" 
                            placeholder="비밀번호"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="checkbox" name="saveId" id="saveId" <%= saveId != null ? "checked" : "" %>/>
                                <label for="saveId">아이디저장</label>&nbsp;&nbsp;
                                <input 
                                	type="button" value="회원가입"
                                	onclick="location.href='<%= request.getContextPath() %>/member/memberEnroll'">
                            </td>
                        </tr>
                    </table>
                </form>
                <!-- 로그인폼 끝-->
                <% } else { %>
                <!-- 로그인사용자정보 시작 -->
                <table id="login">
		            <tr>
		                <td>
			                <%= loginMember.getName() %>님, 안녕하세요.
			                <span id="notification"></span><!-- class="fa-solid fa-bell" -->
		                </td>
		            </tr>
		            <tr>
		                <td>
		                    <input type="button" 
		                    value="내정보보기" 
		                    onclick="location.href = '<%= request.getContextPath() %>/member/memberDetail';">
		                    <input type="button" value="로그아웃" onclick="location.href='<%= request.getContextPath() %>/member/logout';">
		                </td>
		            </tr>
		        </table>
		        <!-- 로그인사용자정보 끝 -->
		        <% } %>
            </div>
            <script>
            
            </script>
        

            <!-- 메인메뉴 시작 -->
            <nav>
                <ul class="main-nav">
                    <li class="home"><a href="<%= request.getContextPath() %>">Home</a></li>
                    <li class="notice"><a href="#">공지사항</a></li>
                    <li class="board"><a href="<%= request.getContextPath() %>/board/boardList">게시판</a></li>
                    <li class="photo"><a href="<%= request.getContextPath() %>/photo/photoList">사진게시판</a></li>
                    <% if(loginMember != null) { %>
                   	<li class="chat"><a href="<%= request.getContextPath() %>/chat/chat">채팅</a></li>
                    <% } %>
                    <%-- 관리자로 로그인한 경우만 노출하기 --%>
                    <% if (loginMember != null && loginMember.getMemberRole() == MemberRole.A) {%>
                    <li class="admin"><a href="<%= request.getContextPath() %>/admin/memberList">회원목록</a></li>
                    <% } %>
                </ul>
            </nav>
            <!-- 메인메뉴 끝-->
		</header>
		
		<section id="content">
