<%@page import="com.sh.mvc.board.model.vo.Attachment"%>
<%@page import="java.util.List"%>
<%@page import="com.sh.mvc.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>    
<%
	Board b = (Board) request.getAttribute("board");
	List<Attachment> attachments = b.getAttachments();
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css" />

<section id="board-container">
<h2>게시판 수정</h2>
<form name="boardUpdateFrm" action="<%=request.getContextPath() %>/board/boardUpdate" method="post" enctype="multipart/form-data">
	<input type="hidden" name="no" value="<%= b.getNo() %>" />
	<table id="tbl-board-view">
	<tr>
		<th>제 목</th>
		<td><input type="text" name="title" value="<%= b.getTitle() %>" required></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>
			<input type="text" name="writer" value="<%= b.getWriter() %>" readonly/>
		</td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td >
			<%
				if(attachments != null && !attachments.isEmpty()) {
					for (int i = 0; i<attachments.size(); i++) {
						Attachment attach = attachments.get(i);
			%>
				<div style="padding: 0;">
					<img src="<%= request.getContextPath() %>/images/file.png" width="16px" />
					<label for="delFile<%= i %>"><%= attach.getOriginalFilename() %> 삭제</label>
					<input type="checkbox" name="delFile" id="delFile<%= i %>" value="<%= attach.getNo() %>" />
				</div>
			<%
					}
				}
			%>
		
			<input type="file" name="upFile1" />
			<input type="file" name="upFile2" />
		</td>
	</tr>
	<tr>
		<th>내 용</th>
		<td><textarea rows="5" cols="40" name="content"><%= b.getContent() %></textarea></td>
	</tr>
	<tr>
		<th colspan="2">
			<input type="submit" value="수정하기"/>
			<input type="button" value="취소" onclick="history.go(-1);"/>
		</th>
	</tr>
</table>
</form>
</section>
<script>
document.boardUpdateFrm.onsubmit = (e) => {
	const frm = e.target;
	//제목을 작성하지 않은 경우 폼제출할 수 없음.
	const titleVal = frm.title.value.trim(); // 좌우공백
	if(!/^.+$/.test(titleVal)){
		alert("제목을 작성해주세요.");
		frm.title.select();
		return false;
	}		
					   
	//내용을 작성하지 않은 경우 폼제출할 수 없음.
	const contentVal = frm.content.value.trim();
	if(!/^(.|\n)+$/.test(contentVal)){
		alert("내용을 작성해주세요.");
		frm.content.select();
		return false;
	}
}
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
