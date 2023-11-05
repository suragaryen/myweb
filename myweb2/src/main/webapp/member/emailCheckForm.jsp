<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="text-align: center">
		<h3>이메일 중복확인 </h3>
		<form action="emailCheckProc.jsp" onsubmit="return blankCheck()">
		 	이메일 : <input type="text" name="email" id="email" maxlength="30" autofocus >
		 		   <input type="submit" value="중복확인">
		</form>
	</div>
	
	<script>
	var emailPattern = /^\w+@[a-zA-Z_]+\.[a-zA-Z]{2,3}$/;
	
	function blankCheck(){
		let email = document.getElementById("email").value;
		email=email.trim();
		if(!emailPattern.test(email)){
			alert("올바른 이메일 형식이 아닙니다")
			return false;
		}//if end
		return true;
	}//blankCheck() end

</script>

</body>
</html>