<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- ssi.jsp 공통 페이지 --%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>

<%@ page import="net.utility.*"%>
<%@ page import="net.bbs.*"%>

<jsp:useBean id="dao" class="net.bbs.BbsDAO"></jsp:useBean>
<jsp:useBean id="dto" class="net.bbs.BbsDTO"></jsp:useBean>

<%request.setCharacterEncoding("UTF-8");%>

<%
	//검색
	String col = request.getParameter("col");//검색칼럼
	String word = request.getParameter("word");//검색어
	
	col = Utility.checkNull(col); //문자열값이 null 이면 빈문자열로 치환
	word = Utility.checkNull(word);

%>