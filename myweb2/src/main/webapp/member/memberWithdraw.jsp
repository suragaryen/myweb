<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="auth.jsp" %>
<%@ include file="../header.jsp" %>

<!-- 본문 시작 bbsRead.jsp -->

	<form method="post" action="memberWithdrawProc.jsp" onsubmit="return pwCheck()">
		<table class="table">
		<tr>
			<th class="active">비밀번호</th>
			<td><input type="password" name="passwd" id="passwd" required></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="삭제" class='btn btn-default'>
			</td>
		</tr>
		</table>
	</form>

<!-- 본문 끝 -->
 <%@ include file="../footer.jsp" %>