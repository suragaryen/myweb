<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>


<!-- 본문 시작 loginProc.jsp -->

<h3>로그인 결과 🔓</h3>
<%
	String id =request.getParameter("id").trim();
	String passwd = request.getParameter("passwd").trim();
	
	//out.print(id);
	//out.print(passwd);
	
	dto.setId(id);
	dto.setPasswd(passwd);
	
	
	String mlevel = dao.loginProc(dto);
	
	
	//out.print(mlevel);
	
	if(mlevel==null){
		
		out.print("<p>아이디/비밀번호 다시 한번 확인 해 주세요</p>");
		out.print("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	
	}else{
		//out.print("<p>로그인 성공~~</p>");
		//out.print("<p>회원등급 :" + mlevel+"<p>");
		
		//다른페이지에서도 로그인 상태 정보를 공유할 수 있도록
		session.setAttribute("s_id", id);
		session.setAttribute("s_passwd", passwd);
		session.setAttribute("s_mlevel", mlevel);
		
		//쿠키시작--------------------------------------------
		
		//->웹서버가 사용자PC에 저장하는 텍스트 파일로 된 정보
		//-> 각 브라우저의 쿠키삭제의 영향을 받는다
		//-> 보안에 취약하다
		//-> 예) 아이디저장, 오늘창그만보기, 클릭한 상품목록
		//-> 예) 오늘창그만보기는 자바스크립트 쿠키. 참조)https://www.w3schools.com/js/js_cookies.asp
		
		//<input type="checkbox" value="SAVE" name="c_id"> ID저장
		String c_id = Utility.checkNull(request.getParameter("c_id"));
		Cookie cookie = null;
		if(c_id.equals("SAVE")){ //ID저장에 체크를 했다면
			
			//쿠키 변수 선언 new Cookie("변수명", 값)
			cookie = new Cookie("c_id", id);
			//쿠키의 생존기간 1개월
			cookie.setMaxAge(60*60*24*30); //각 브라우저의 쿠키 삭제의 영향을 받는다'
		
			
		}else{
			cookie = new Cookie("c_id", "");//빈값저장
			cookie.setMaxAge(0);
			
		}//if end
		
		//요청한 사용자 PC에 쿠키값을 저장
		response.addCookie(cookie);
		
		
		//쿠키 끝--------------------------------------------
		
		
		//첫페이지 이동
		//http://localhost:9090/myweb/index/index.jsp
		String root = Utility.getRoot();	// /myweb 반환
		response.sendRedirect(root + "/index.jsp");
		
		
	}//if end
%>


<!-- 본문 끝 -->
 <%@ include file="../footer.jsp" %>