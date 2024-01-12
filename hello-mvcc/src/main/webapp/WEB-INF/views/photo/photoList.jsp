<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	int totalPage = (int) request.getAttribute("totalPage");
%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/photo.css" />
<section id="photo-wrapper">
	<h2>사진게시판 </h2>
	<div id="photo-container">
	<!-- 
		<div class="polaroid">
			<img src="" >
			<p class="info">
				<span class="writer"></span>
				<span class="photoDate"></span>
			</p>
			<p class="caption"></p>
		</div>
 	-->
	</div>
	<hr />
	<div id='btn-more-container'>
		<button id="btn-more" value="" >더보기(<span id="cpage"></span>/<span id="totalPage"><%= totalPage %></span>)</button>
	</div>
</section>
<script>
document.querySelector("#btn-more").onclick = () => {
	const cpage = Number(document.querySelector("#cpage").innerHTML);
	const nextPage = cpage + 1;
	getPage(nextPage);
};

window.addEventListener('load', () => {
	getPage(1);
});

const getPage = (cpage) => {
	
	$.ajax({
		url : "<%= request.getContextPath() %>/photo/photoMore",
		data : {cpage},
		success(photos) {
			console.log(photos);
			const container = document.querySelector("#photo-container");
			photos.forEach((photo) => {
				const {no, writer, content, renamedFilename, regDate} = photo;
				container.innerHTML += `
					<div class="polaroid">
						<img src="<%= request.getContextPath() %>/upload/photo/\${renamedFilename}" >
						<p class="info">
							<span class="writer">\${writer}</span>
							<span class="photoDate">\${regDate}</span>
						</p>
						<p class="caption">\${content}</p>
					</div>
				`;
			});
		},
		complete() {
			document.querySelector("#cpage").innerHTML = cpage;
			
			if(cpage === <%= totalPage %>) {
				const btn = document.querySelector("#btn-more");
				btn.disabled = true;
				btn.style.cursor = "not-allowed";
			}
		}
	});
	
};
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
