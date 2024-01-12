<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="com.sh.mvc.member.model.vo.Gender"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	String id = loginMember.getMemberId();
	String name = loginMember.getName();
	Date _birthday = loginMember.getBirthday();
	String email = loginMember.getEmail();
	String phone = loginMember.getPhone();
	int point = loginMember.getPoint();
	Gender gender = loginMember.getGender();
	String hobby = loginMember.getHobby();
	
	 // null값 노출 방지용
	String birthday = _birthday != null ? _birthday.toString() : "";
	email = email != null ? email : "";
	
	// 취미 List로 처리하기
	List<String> hobbies = null;
	if(hobby != null) {
		hobbies = Arrays.asList(hobby.split(","));
		System.out.println(hobbies);
		System.out.println(hobbies.getClass()); // class java.util.Arrays$ArrayList
	}
	
%>
<section id=enroll-container>
	<h2>회원 정보</h2>
	<form 
		name="memberUpdateFrm"
		action="<%= request.getContextPath() %>/member/memberUpdate" 
		method="post">
		<table>
			<tr>
				<th>아이디<sup>*</sup></th>
				<td>
					<input type="text" name="memberId" id="memberId" value="<%= id %>" readonly>
				</td>
			</tr>
			<tr>
				<th>이름<sup>*</sup></th>
				<td>	
				<input type="text"  name="name" id="name" value="<%= name %>"  required><br>
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>	
				<input type="date" name="birthday" id="birthday" value="<%= birthday != null ? birthday : "" %>"><br>
				</td>
			</tr> 
			<tr>
				<th>이메일</th>
				<td>	
					<input type="email" placeholder="abc@xyz.com" name="email" id="email" value="<%= email %>"><br>
				</td>
			</tr>
			<tr>
				<th>휴대폰<sup>*</sup></th>
				<td>	
					<input type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" value="<%= phone %>" required><br>
				</td>
			</tr>
			<tr>
				<th>포인트</th>
				<td>	
					<input type="text" placeholder="" name="point" id="point" value="<%= point %>" readonly><br>
				</td>
			</tr>
			<tr>
				<th>성별 </th>
				<td>
			       		 <input type="radio" name="gender" id="gender0" value="M" <%= gender != null && gender == Gender.M ? "checked" : "" %>>
						 <label for="gender0">남</label>
						 <input type="radio" name="gender" id="gender1" value="F" <%= gender != null && gender == Gender.F ? "checked" : "" %>>
						 <label for="gender1">여</label>
				</td>
			</tr>
			<tr>
				<th>취미 </th>
				<td>
					<input type="checkbox" name="hobby" id="hobby0" value="운동" <%= hobbies != null && hobbies.contains("운동") ? "checked" : ""%>><label for="hobby0">운동</label>
					<input type="checkbox" name="hobby" id="hobby1" value="등산" <%= hobbies != null && hobbies.contains("등산") ? "checked" : "" %>><label for="hobby1">등산</label>
					<input type="checkbox" name="hobby" id="hobby2" value="독서" <%= hobbies != null && hobbies.contains("독서") ? "checked" : "" %>><label for="hobby2">독서</label><br />
					<input type="checkbox" name="hobby" id="hobby3" value="게임" <%= hobbies != null && hobbies.contains("게임") ? "checked" : "" %>><label for="hobby3">게임</label>
					<input type="checkbox" name="hobby" id="hobby4" value="여행" <%= hobbies != null && hobbies.contains("여행") ? "checked" : "" %>><label for="hobby4">여행</label><br />


				</td>
			</tr>
		</table>
        <input type="submit" value="정보수정"/>
        <input type="button" onclick="deleteMember();" value="탈퇴"/>
	</form>
</section>
<form name="memberDelFrm" action="<%= request.getContextPath() %>/member/memberDelete" method="post"></form>
<script>
//폼 유효성검사
document.memberUpdateFrm.onsubmit = (e) => {
	const frm = e.target;
	const name = e.target.name;
	const phone = e.target.phone;

	// 이름 검사 - 한글2글자 이상
	if (!/^[가-힣]{2,}$/.test(name.value)) {
		alert("이름은 한글2글자 이상이어야 합니다.");
		return false;
	}
	// 전화번호 검사 - 01012345678 010으로 시작하고 숫자8자리 여부 확인
	if (!/^010\d{8}$/.test(phone.value)) {
		alert("전화번호는 010으로 시작하고 숫자8자리여야 합니다.");
		return false;
	}
	
};

const deleteMember = () => {
	if(confirm("정말 탈퇴하시겠습니까?"))
		document.memberDelFrm.submit();
}
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
