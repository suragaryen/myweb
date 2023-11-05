<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>12_myweb인트로.html</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <!-- layout.css import -->
  <script src="https://kit.fontawesome.com/f057fd7a7d.js" crossorigin="anonymous"></script>
  <script src="../js/clock.js"></script>
  <script src="../js/jquery-3.7.1.min.js"></script>
  <script src="../js/moment-with-locales.min.js"></script>
  
  <script src="../js/myscript.js"></script>
  <link rel="stylesheet" href="../css/layout.css">
  
 
</head>
<body>

<!-- 메인 카테고리 시작 -->
<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="<%=request.getContextPath()%>"><i class="fa-solid fa-house fa-lg"></i></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="../bbs/bbsList.jsp"><i class="fa-regular fa-pen-to-square fa-xl"></i></a></li>
        <li><a href="../notice/noticeList.jsp"><i class="fa-solid fa-bullhorn fa-xl"></i></a></li>
        <li><a href="../member/loginForm.jsp"><i class="fa-regular fa-circle-user fa-xl"></i></a></li>
        <li><a href="../pds/pdsList.jsp"><i class="fa-regular fa-image fa-xl"></i></a></li>
        <li><a href="../mail/mailForm.jsp"><i class="fa-regular fa-envelope fa-xl"></i></i></a></li>
      </ul>
    </div>
  </div>
</nav>

<!-- logo -->
<div class="container-fluid bg-1 text-center">
  <a href=""><img src="../images/Asset 1.png"  style="display:inline" alt="logo" width="30%" ></a>
</div>
<!--메인 카테고리 끝-->

<!-- Container 시작 -->
<div class="container-fluid bg-2 text-center">
    <div class="row">
        <div class="col-xs-12">
          