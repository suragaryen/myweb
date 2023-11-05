<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="auth.jsp" %>
<%@ include file="../header.jsp" %>

<!-- 본문 시작 bbsRead.jsp -->

<%
	
String passwd = request.getParameter("passwd");
String mname = request.getParameter("mname");
String email = request.getParameter("email");
String tel  = request.getParameter("tel");
String job = request.getParameter("job");

dto.setId(s_id);
dto.setPasswd(passwd);
dto.setMname(mname);
dto.setEmail(email);
dto.setTel(tel);
dto.setJob(job);

int cnt = dao.memberModify(dto);


if(cnt==0){
	out.println("<p>비밀번호가 일치하지 않습니다</p>");
	out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
}else{
		out.println("<script>");
		out.println(" alert('회원정보가 수정되었습니다~');");
		out.println("</script>");
		String root = Utility.getRoot();	// /myweb 반환
		response.sendRedirect(root + "/index.jsp");
}//if end
%>




<!-- 본문 끝 -->
 <%@ include file="../footer.jsp" %>