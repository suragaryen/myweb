/**
 * myscript.js
 */

 function bbsCheck(){ //게시판 유효성 검사

    //1)작성자 2글자 이상 입력
    let wname=document.getElementById("wname").value; //작성자 가져오기
    wname=wname.trim();
    if(wname.length<2){
        alert();
        document.getElementById("wname").focus(); //작성자칸에 커서 생성
        return false; //전송하지 않음
    }//if end

    //2)제목 2글자 이상 입력
	let subject=document.getElementById("subject").value;
	subject=subject.trim();                               
	if(subject.length<2){
	    alert("제목 2글자 이상 입력해 주세요");
    	document.getElementById("subject").focus();     
    	return false;                                 
	}//if end 

    //3)내용 2글자 이상 입력
	let content=document.getElementById("content").value;
	content=content.trim();                               
	if(content.length<2){
	    alert("내용 2글자 이상 입력해 주세요");
    	document.getElementById("content").focus();    
    	return false;                                 
	}//if end    

    //4)비밀번호는 4글자이상이면서, 숫자형 기호만 입력
    let passwd=document.getElementById("passwd").value; 
    passwd=passwd.trim();
    if(passwd.length<4 || isNaN(passwd)){
        alert("비밀번호 4글자 이상 숫자로 입력해 주세요");
        document.getElementById("passwd").focus();
        return false;
    }//if end

	return true; //onsubmit이벤트에서 서버로 전송
    
 }//bbsCheck() end
 
 function pwCheck(){
	let passwd=document.getElementById("passwd").value; 
    passwd=passwd.trim();
    if(passwd.length<4 || isNaN(passwd)){
        alert("비밀번호 4글자 이상 숫자로 입력해 주세요");
        document.getElementById("passwd").focus();
        return false;
    }//if end
    
    let message="진행된 내용은 복구되지 않습니다 \n 계속 진행 할까요?";
    	if(confirm(message)){//확인 ture, 취소 false
    		return ture;
			
		}else{
			return false;
		}//if end
	 
 }//pwCheck()
 
 function searchCheck(){//검색어를 입력하면 서버로 전송
	 let word = document.getElementById("word").value;
	 word=word.trim();
	 if(word.length==0){
		 alert("검색어를 입력해 주세요");
		 return false;
	 }//if end
	 return true;
 }//searchCheck() end
 
 function loginCheck() { //로그인 유효성 검사 (아이디, 비번)
 
 
 	//1) 아이디 5~10글자 이내인지 검사

	let id=document.getElementById("id").value;
	id=id.trim();
	if(!(id.length>=5 && id.length<=10)){
		alert("아이디 5~10글자 이내 입력해 주세요");
		document.getElementById("id").focus();
		return false;
	}//if end
 	
 	//2) 비밀번호 5~10글자 이내인지 검사
		let passwd=document.getElementById("passwd").value;
		passwd=passwd.trim();
		if(!(passwd.length>=5 && passwd.length<=10)){
			alert("비밀번호 5~10글자 이내 입력해 주세요");
			document.getElementById("passwd").focus();
			return false;
		}//if end

		return true; //서버로 전송
		
	
		
 }//loginCheck()end
 
 
 	function idCheck(){ //아이디 중복확인
	
		//모달창
		//->부모창과 자식창이 한몸으로 구성되어 있음
		//-> 참조 https://www.w3schools.com/bootstrap/bootstrap_modal.asp
		
		
		
		//새창 만들기
		//->부모창과 자식창이 별개로 구성되어 있음
		//->모바일에 기반을 둔 frontend단(SPA)에서는 사용하지 말 것!!
		//->참조 https://www.w3schools.com/jsref/met_win_open.asp
		//window.open("파일명", "새창이름", "다양한옵션들")
		window.open("idCheckForm.jsp", "idwin", "width=400, height=350");
		
		
	}//idCheck() end
	
	function emailCheck(){ //아이디 중복확인
	
		//모달창
		//->부모창과 자식창이 한몸으로 구성되어 있음
		//-> 참조 https://www.w3schools.com/bootstrap/bootstrap_modal.asp
		
		
		
		//새창 만들기
		//->부모창과 자식창이 별개로 구성되어 있음
		//->모바일에 기반을 둔 frontend단(SPA)에서는 사용하지 말 것!!
		//->참조 https://www.w3schools.com/jsref/met_win_open.asp
		//window.open("파일명", "새창이름", "다양한옵션들")
		window.open("emailCheckForm.jsp", "idwin", "width=400, height=350");
		
		
	}//emailCheck() end
	
	function memberCheck() { //회원가입 유효성 검사
		let id = document.getElementById("id").value;
		let passwd=document.getElementById("passwd").value; 
		let repasswd=document.getElementById("repasswd").value;
		let mname=document.getElementById("mname").value;
		let job=document.getElementById("job").value;
	
		id = id.trim();
		passwd=passwd.trim();
		repasswd=repasswd.trim();
		mname=mname.trim();
	
	
	//1)아이디 5~10글자 인지?
	
	if(id.length<5 || id.length>=11){
		alert("아이디를 5~10 글자로 입력해주세요");
		document.getElementById("id").focus;
		return false;
	}//if end


	
    //2)비밀번호 5~10글자 인지?

	/*
	let passwd = document.getElementById("passwd").value;
	passwd = passwd.trim();
	alert(id.length);
	alert(passwd.length);

	if(id.length<5 || id.length>=11){
		alert("아이디를 5~10 글자로 입력해주세요");
		document.getElementById("passwd").focus;
		return false;
	}//if end
	*/
	if(passwd.length<4 || passwd.length>10){
		alert("비밀번호 5~10글자 로 입력해주세요");
		document.getElementById("passwd").focus();
		return false;
	}//if end
	
    //3)비밀번호와 비밀번호확인이 서로 일치하는지?
		

	if(passwd!==repasswd){
		alert("비밀번호가 일치하지 않습니다");
		document.getElementById("passwd").focus();
		return false;
	}//if end

    //4)이름 두글자 이상 인지?


		if(mname.length<2){
			alert("이름을 두글자 이상 입력해주세요");
			document.getElementById("mname").focus();
			return false;
		}//if end

    //5)이메일 5글자 인지?

    //6)직업을 선택했는지?
	var selectElement = document.getElementById("job");

	// 선택된 옵션의 값(value)을 가져오기
	var selectedValue = selectElement.value;
		 if(selectedValue == "0"){
		 	alert("직업을 선택해주세요");
		 	return false;
		 }


	return true; //onsubmit이벤트에서 서버로 전송
		
	}//memberCheck() end
	
	function findIDCheck(){
		let mname=document.getElementById("mname").value;
		mname=mname.trim();
		
		if(mname.length<2){
			alert("이름을 두글자 이상 입력해주세요");
			document.getElementById("mname").focus();
			return false;
		}//if end
		
	var emailPattern = /^\w+@[a-zA-Z_]+\.[a-zA-Z]{2,3}$/;
	
	
		let email = document.getElementById("email").value;
		email=email.trim();
		if(!emailPattern.test(email)){
			alert("올바른 이메일 형식이 아닙니다")
			return false;
		}//if end

		
	}//findIDCheck()
	
	function pdsCheck(){ //포토 갤러리 유효성 검사
	
	//1) 이름
	
	//2) 제목
	
	//3) 비밀번호 4~15글자 이내인지?
		
	//4) 첨부파일
	//-> 파일의 확장명이 이미지 파일 (png, jpg, gif) 인지 확인하시오
	 let filename = document.getElementById("filename").value; //예)sky.png
	 filename = filename.trim();
	 if(filename.length==0){
	 	alert("첨부 파일 선택하세요");
	 	return false;
	}else{
		let dot = filename.lastIndexOf(".");//filename변수값에서 마지막 .의 순서값
		let ext = filename.substr(dot+1);	//확장명 : 마지막 . 이후 문자열 자르기
		ext = ext.toLowerCase();

		if(ext=="png" || ext=="jpg" || ext=="gif"){
			return ture ;
		}else {
			alert("이미지 파일만 업로드 가능합니다")
			return false;
		}//if end

	}//if end
	

	}//pdsCHeck() end
	
	function pwCheck2(){
		let passwd = document.getElementById("passwd").value;
		passwd = passwd.trim();
		if(passwd.length<4){
			alert("비밀번호 4~15글자 이내 입력해주세요");
			document.getElementById("passwd").focus();
			return false;
		}//if end
	let message = "첩부 파일도 삭제됩니다 \n 계속 진행할까요?";
	if(confirm(message)){
		return true; //서버로 전송
	}else{
		return false;
	}//if end
	}//pwCheck2() end
	
	
	function mbModCheck() { //회원가입 유효성 검사

		let passwd=document.getElementById("passwd").value; 
		let repasswd=document.getElementById("repasswd").value;
		let mname=document.getElementById("mname").value;
		let job=document.getElementById("job").value;
	
	
		passwd=passwd.trim();
		repasswd=repasswd.trim();
		mname=mname.trim();
	


	if(passwd.length<4 || passwd.length>10){
		alert("비밀번호 5~10글자 로 입력해주세요");
		document.getElementById("passwd").focus();
		return false;
	}//if end
	
    //3)비밀번호와 비밀번호확인이 서로 일치하는지?
		

	if(passwd!==repasswd){
		alert("비밀번호가 일치하지 않습니다");
		document.getElementById("passwd").focus();
		return false;
	}//if end

    //4)이름 두글자 이상 인지?


		if(mname.length<2){
			alert("이름을 두글자 이상 입력해주세요");
			document.getElementById("mname").focus();
			return false;
		}//if end

    //5)이메일 5글자 인지?

    //6)직업을 선택했는지?
	var selectElement = document.getElementById("job");

	// 선택된 옵션의 값(value)을 가져오기
	var selectedValue = selectElement.value;
		 if(selectedValue == "0"){
		 	alert("직업을 선택해주세요");
		 	return false;
		 }


	return true; //onsubmit이벤트에서 서버로 전송
		
	}//memberCheck() end
	
	
 