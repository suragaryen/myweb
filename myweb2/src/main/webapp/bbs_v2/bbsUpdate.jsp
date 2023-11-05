<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="ssi.jsp" %>


<!-- 본문 시작 bbsUpdate.jsp -->
<!-- 글번호가 일치하는 행을 가져와서, 수정폼에 출력하기-->
<h3> 게시판 수정</h3>
<p>
	<a href="bbsForm.jsp">글쓰기📝</a>
	&nbsp;&nbsp;
	<a href="bbsList.jsp">글목록📃</a>
</p>
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	dto=dao.read(bbsno); //글번호가 일치하는 행을 가져오기
	if(dto==null){
		out.println("해당 글 없음!!");
	}else{
		
		%>
		<form name="bbsfrm" id="bbsfrm" method="post" action="bbsUpdateProc.jsp" onsubmit="return bbsCheck()">
		<input type="hidden" name="bbsno" value="<%=bbsno%>"> <!-- 글번호 -->
		<!--현재 페이지의 상태를 유지하기 위한 값  -->
		<input type="hidden" name="col" value="<%=col%>">
		<input type="hidden" name="word" value="<%=word%>">
		
		<table class="table">
		<tr>
			<th class="active">작성자</th>
			<td><input type="text" name="wname" id="wname" class="form-control" maxlength="20" value="<%=dto.getWname()%>" required></td>
		</tr>
		<tr>
			<th class="active">제목</th>
			 <td><input type="text" name="subject" id="subject" class="form-control" value="<%=dto.getSubject()%>" maxlength="100" required></td>
		</tr>
		<tr>
			<th class="active">내용</th>
			<td><textarea rows="5"  class="form-control" name="content" id="content"><%=dto.getContent()%></textarea></td>
		</tr>	
		<tr>
			<th class="active">비밀번호</th>
			<td><input type="password" name="passwd" id="passwd" class="form-control" maxlength="10" required></td>
		</tr>		
			
		 <td colspan="2" align="center">
	       <input type="submit" value="수정" class="btn btn-default">
	       <input type="reset"  value="취소" class="btn btn-default">
	    </td>
		
		</table>
		</form>
		
<% 	
	}//if end

%>

<!-- 본문 끝 -->
 <%@ include file="../footer.jsp" %>