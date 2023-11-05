<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="ssi.jsp" %>
<%@ include file="auth.jsp" %>
<%@ include file="../header.jsp" %>

<!-- 본문 시작 memberModify.jsp -->

<!--guest이면 원래 자리로 돌려보내기  -->

<%
String id = s_id;
dto = dao.read(id);
if(dto==null){
	out.println("회원 정보가 없습니다");
}else{


%>

<h3> 회원 정보 수정</h3>

<form name="memberModify" id="memberModify" method="post" action="memberMdfProc.jsp" onsubmit="return mbModCheck()">
<table class="table">
<tr>
    <th>아이디</th>
    <td style="text-align: left"><%=s_id%></td>
</tr>
<tr>
    <th>*새비밀번호</th>
    <td style="text-align: left">
    	<input type="password" name="passwd" id="passwd" size="10" maxlength="10" required>
    </td>
</tr>
<tr>
    <th>*새비밀번호 확인</th>
    <td style="text-align: left">
    	<input type="password" name="repasswd" id="repasswd" size="10" maxlength="10" required>
    </td>
</tr>
<tr>
    <th>*이름</th>
    <td style="text-align: left">
    	<input type="text" name="mname" id="mname" size="20" maxlength="20" required value="<%=dto.getMname()%>">
    </td>
</tr>
 <tr>
    <th>*이메일</th>
    <td style="text-align: left">
    	<input type="text" name="email" id="email" size="30" maxlength="50" readonly value="<%=dto.getEmail()%>">
    	<input type="button" value="Email중복확인" onclick="emailCheck()">
    </td>
</tr>
<tr>
    <th>전화번호</th>
    <td style="text-align: left"><input type="text" name="tel" id="tel" size="15" maxlength="14" value="<%=dto.getTel()%>"></td>
</tr>
<tr>  
  <th>직업</th>
  <td style="text-align: left">
        <select name="job"  id="job">
          <option value="0" selected>선택하세요.</option>
          <option value="A01">회사원</option>
          <option value="A02">IT관련직</option>
          <option value="A03">학생</option>
          <option value="A04">주부</option>
          <option value="A05">기타</option>
        </select>
  </td>
</tr>
<tr>
    <td colspan="2">
        <input type="submit" value="회원정보수정"  class="btn btn-primary"/>
        <input type="reset"  value="취소"     class="btn btn-primary"/>
    </td>
</tr>
</table>
</form>

<% 	
	}//if end

%>


<!-- 본문 끝 -->
 <%@ include file="../footer.jsp" %>