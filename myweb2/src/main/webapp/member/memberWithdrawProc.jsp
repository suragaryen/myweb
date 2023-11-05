<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="ssi.jsp" %>
<%@ include file="auth.jsp" %>

<!-- 본문 시작 bbsRead.jsp -->


<h3>회원 탈퇴 </h3>
<%
	String id = s_id;
	String passwd = request.getParameter("passwd").trim();
	
	dto.setId(id);
	dto.setPasswd(passwd);
	
	int cnt = dao.memberWithdraw(dto);
	if(cnt==0){
		out.println("<p>비밀번호가 일치하지 않습니다</p>");
		out.println("<p><a href='javascript:history.back()'>다시시도</a></p>");
	}else{
		session.removeAttribute("s_id");
		out.println("<script>");
		out.println("		alert('게시글이 삭제되었습니다')");
		out.println("</script>");
		String root = Utility.getRoot();	// /myweb 반환
		response.sendRedirect(root + "/index.jsp");
		
		}
	

%>

<!-- 본문 끝 -->
 <%@ include file="../footer.jsp" %>