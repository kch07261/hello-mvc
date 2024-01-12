<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.sh.mvc.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	List<Board> boards = (List<Board>) request.getAttribute("boards");
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css" />
<section id="board-container">
	<h2>게시판 </h2>
	<% if(loginMember != null) { %>
		<input 
			type="button" id="btn-add" value="글쓰기" 
			onclick="location.href = '<%= request.getContextPath() %>/board/boardCreate';" />
	<% } %>
	<table id="tbl-board">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>첨부파일</th><%--첨부파일이 있는 경우 /images/file.png 표시 width:16px --%>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<% 
				if(boards != null && !boards.isEmpty()){ 
					for(Board board : boards){					
			%>
						<tr>
							<td><%= board.getNo() %></td>
							<td>
								<a href="<%= request.getContextPath() %>/board/boardDetail?no=<%= board.getNo() %>"><%= board.getTitle() %></a>
								<% if(board.getCommentCnt() > 0) { %>
								[<%= board.getCommentCnt() %>]
								<% } %>
							</td>
							<td><%= board.getWriter() %></td>
							<td><%= board.getRegDate() %></td>
							<td>
								<%	if (board.getAttachCnt() > 0) { %>
									<img src="<%= request.getContextPath() %>/images/file.png" alt="" style="width:16px;" />
								<% 	} %>
							</td>
							<td><%= board.getReadCount() %></td>
						</tr>
			<%
					}
				} 
				else { 
			%>
				<tr>
					<td colspan="6">조회된 게시글이 없습니다.</td>
				</tr>
			<% } %>
		</tbody>
	</table>

	<div id='pagebar'>
		<%= request.getAttribute("pagebar") %>
	</div>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
