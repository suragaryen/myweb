<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<%

	String id = request.getParameter("id").trim();
	String passwd = request.getParameter("passwd").trim();
	String mname = request.getParameter("mname").trim();
	String tel = request.getParameter("tel").trim();
	String email = request.getParameter("email").trim();
	String zipcode = request.getParameter("zipcode").trim();
	String address1 = request.getParameter("address1").trim();
	String address2 = request.getParameter("address2").trim();
	String job = request.getParameter("job").trim();
	
	dto.setId(id);
	dto.setPasswd(passwd);
	dto.setMname(mname);
	dto.setEmail(email);
	dto.setTel(tel);
	dto.setZipcode(zipcode);
	dto.setAddress1(address1);
	dto.setAddress2(address2);
	dto.setJob(job);


	
	int cnt = dao.create(dto);
	if(cnt==0){
		out.println("<p>회원가입에 실패했습니다</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
		
	}else{
		out.println("<script>");
		out.println(" alert('회원가입 성공');");
		out.println(" location.href='../index.jsp';");//목록페이지 이동
		out.println("</script>");
}//if end
	

%>


<!-- 본문 끝 -->
 
<%@ include file="../footer.jsp" %>