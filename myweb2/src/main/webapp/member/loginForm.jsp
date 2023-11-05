<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="auth.jsp" %> <%-- 로그인 확인 공통페이지 --%>
<%@ include file="../header.jsp" %>

<!-- 본문시작 loginForm.jsp -->
<h3>로그인🔒</h3>

	

<%if (s_id.equals("guest") || s_passwd.equals("guest") || s_mlevel.equals("guest")) { 
	//ID저장 쿠키 확인 --------------------------------------------
		Cookie[] cookies = request.getCookies(); //사용자 PC에 저장된 모든 쿠키값 가져오기
		String c_id = "";
		if(cookies != null){ //쿠키값들이 존재하는지?
				for(int i=0; i<cookies.length; i++){ //모든 쿠키값을 검색
				Cookie cookie =	cookies[i]; //쿠키 하나씩 가져오기
				if(cookie.getName().equals("c_id")==true){
					c_id = cookie.getValue(); //쿠키변수값 가져오기
				}//if end
			}//for end
		}//if end
	//---------------------------------------------------------
%> 

<form name="loginfrm" id="loginfrm" method="post" action="loginProc.jsp" onsubmit="return loginCheck()">
<table class="table" style="width:30%">
		<tr>
			<td class="active">
				<input type="text" name="id" value="<%=c_id%>" id="id" placeholder="아이디" maxlength="10" required>
			</td>
			<td rowspan="2">
			    <!-- type=image는 기본속성이 submit -->
			    <input type="image" src="../images/bt_login.gif">
			</td>
		</tr>
		<tr>
			<td class="active">
			    <input type="password" name="passwd" id="passwd" placeholder="비밀번호" maxlength="10" required>
			</td>
		</tr>
<tr>
			<td colspan="2">
			    <label><input type="checkbox" value="SAVE" name="c_id" <%if(!c_id.isEmpty()) {out.print("checked");}%>> ID저장</label>
			    &nbsp;&nbsp;&nbsp;
			    <a href="agreement.jsp">회원가입</a>
			    &nbsp;&nbsp;&nbsp;
			    <a href="findID.jsp">아이디/비밀번호찾기</a>    
			</td>
		</tr>
		</table>
</form>

<%

} else{
	//로그인 성공했다면
	out.println("<strong style='color:black'>" + s_id + " 님 환영합니다🤓</strong>");
	out.println("<a href='logout.jsp'>[로그아웃]</a>");
	out.println("<br><br>");
	out.println("<a href='memberModify.jsp'>[회원정보수정]</a>");
	out.println("&nbsp;&nbsp;");
	out.println("<a href='memberWithdraw.jsp'>[회원탈퇴]</a>");
	
}//if end

%>
<!-- 본문 끝 -->
 <%@ include file="../footer.jsp" %>