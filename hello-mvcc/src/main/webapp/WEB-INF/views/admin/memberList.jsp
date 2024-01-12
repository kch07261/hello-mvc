<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<% 
	List<Member> members = (List<Member>)request.getAttribute("members");

	// 검색타입
	String searchType = request.getParameter("searchType");
	String searchKeyword = request.getParameter("searchKeyword");
	
%>
<!-- 관리자용 admin.css link -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css" />
<style>
    div#search-container 	{width: 100%; margin:0 0 10px 0; padding:3px; background-color: rgba(0, 188, 212, 0.3);}
    div#search-memberId 	{display: <%= searchType == null || "member_id".equals(searchType) ? "inline-block" : "none" %>;} <%-- 하나는 기본적을 노출 시키기 위해서 --%>
    div#search-name			{display: <%= "name".equals(searchType) ? "inline-block" : "none" %>;}
    div#search-gender		{display: <%= "gender".equals(searchType) ? "inline-block" : "none" %>;}
</style>
<section id="memberList-container">
	<h2>회원관리</h2>
	
	<div id="search-container">
        <label for="searchType">검색타입 :</label> 
        <select id="searchType">
            <option value="memberId" <%= "member_id".equals(searchType) ? "selected" : "" %>>아이디</option>        
            <option value="name" <%= "name".equals(searchType) ? "selected" : "" %>>회원명</option>
            <option value="gender" <%= "gender".equals(searchType) ? "selected" : "" %>>성별</option>
        </select>
        <div id="search-memberId" class="search-type">
            <form action="<%=request.getContextPath()%>/admin/memberFinder">
                <input type="hidden" name="searchType" value="member_id"/>
                <input type="text" name="searchKeyword"  size="25" placeholder="검색할 아이디를 입력하세요."
                		value="<%= "member_id".equals(searchType) ? searchKeyword : "" %>"/>
                <button type="submit">검색</button>            
            </form>    
        </div>
        <div id="search-name" class="search-type">
            <form action="<%=request.getContextPath()%>/admin/memberFinder">
                <input type="hidden" name="searchType" value="name"/>
                <input 
                	type="text" 
                	name="searchKeyword" 
                	size="25" 
                	placeholder="검색할 이름을 입력하세요."
                	value="<%= "name".equals(searchType) ? searchKeyword : "" %>"/>
                <button type="submit">검색</button>            
            </form>    
        </div>
        <div id="search-gender" class="search-type">
            <form action="<%=request.getContextPath()%>/admin/memberFinder">
                <input type="hidden" name="searchType" value="gender"/>
                <input type="radio" name="searchKeyword" value="M" value="<%= "gender".equals(searchType) && "M".equals(searchKeyword) ? "checked" : "" %>"> 남
                <input type="radio" name="searchKeyword" value="F" value="<%= "gender".equals(searchType) && "F".equals(searchKeyword) ? "checked" : "" %>"> 여
                <button type="submit">검색</button>
            </form>
        </div>
    </div>
	
	<table id="tbl-member">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>회원권한</th>
				<th>성별</th>
				<th>생년월일</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>포인트</th>
				<th>취미</th>
				<th>가입일</th>
			</tr>
		</thead>
		<tbody>
		<% if(members == null || members.isEmpty()) { %>
			<tr>
				<td colspan="10">조회 결과가 없습니다.</td>
			</tr>
			<% 
				} else { 
					for(Member member : members) {
			%>
				<tr>
					<td><%= member.getMemberId() %></td>
					<td><%= member.getName() %></td>
					<td>
						<select class="member-role" data-member-id="<%= member.getMemberId() %>"> <%-- 데이터 속성 : 작성시(형식은 data-xxxxx) / 검색시(camel로) --%>
							<option value="U" <%= member.getMemberRole() == MemberRole.U ? "selected" : "" %>>일반</option>
							<option value="A" <%= member.getMemberRole() == MemberRole.A ? "selected" : "" %>>관리자</option>
						</select>
					</td>
					<td><%= member.getGender() != null ? member.getGender() : "" %></td>
					<td><%= member.getBirthday() != null ? member.getBirthday() : "" %></td>
					<td><%= member.getEmail() != null ? member.getEmail() : "" %></td>
					<td><%= member.getPhone() %></td>
					<td><%= member.getPoint() %></td>
					<td><%= member.getHobby() != null ? member.getHobby() : "" %></td>
					<td><%= member.getEnrollDate() %></td>
				</tr>
			<%
					}
				}
			%>
		</tbody>
	</table>
</section>
<form 
	name = "memberRoleUpdateFrm" 
	action="<%= request.getContextPath() %>/admin/memberRoleUpdate"
	method="post">
	<input type="hidden" name="memberRole"/>
	<input type="hidden" name="memberId"/>
</form>
<script>
document.querySelector("select#searchType").onchange = (e) => {
	console.log(e.target.value);
	document.querySelectorAll(".search-type").forEach((elem) => {
		elem.style.display = "none";
	});
							//		$ escaping	-> \
	document.querySelector(`#search-\${e.target.value}`).style.display = "inline-block";
};

document.querySelectorAll(".member-role").forEach((elem) => {
	elem.addEventListener("change", (e) => {
		// console.log(e.target.dataset); // 작성한 data태그를 보관하는 맵(key-value)
		
		if(confirm("회원권한을 정말 수정하시겠습니까?")) {
			const memberRoleVal = e.target.value;
			const memberIdVal = e.target.dataset.memberId;
			
			const frm = document.memberRoleUpdateFrm;
			frm.memberRole.value = memberRoleVal;
			frm.memberId.value = memberIdVal;
			frm.submit();
		}
		else {
			// 취소 눌렀을 때 사용자변경을 원래값으로 변경
			// option태그 selected속성(inline에 작성된)이 있는 태그를 찾아서 selected속성을 true로 지정
			e.target.querySelector("[selected]").selected = true;		// -> e.target.querySelector("option[selected]").selected = true;
			//			원래 작성되있던 selected의 selected를 true;
			console.dir(e.target.querySelector("[selected]"));
		}
		
	});
});
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
