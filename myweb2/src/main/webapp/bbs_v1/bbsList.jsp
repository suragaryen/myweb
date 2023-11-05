<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>


<!-- 본문 시작 template.jsp -->
<h3>글목록📃</h3>
<p><a href="bbsForm.jsp">글쓰기📝</a></p>

<table class="table">
	<thead>
		<tr>
			<th class="active">제목</th>
			<th class="active">조회수</th>
			<th class="active">작성자</th>
			<th class="active">작성일</th>
			<th class="active">삭제</th>
		</tr>	
	</thead>
<tbody>
<%
	ArrayList<BbsDTO> list = dao.list();
	if(list==null){
		out.print("<tr>");
		out.print(" <td colspan='4'>");
		out.print("  <strong>게시글이 존재하지 않습니다</strong>");
		out.print(" </td>");
		out.print("</tr>");
	}else{

		
		//오늘 날짜를 문자열 "2023-10-16" 만들기
		String today = Utility.getDate();
		
		
		for(int i=0; i<list.size(); i++){
			dto = list.get(i);
%>
		<tr>
			<td style="text:align:left">
<%
		//답변 이미지 출력
		for (int n=1; n<=dto.getIndent(); n++){
			out.println("<img src='../images/reply.gif'>");
		}//for end

%>
			<a href="bbsRead.jsp?bbsno=<%=dto.getBbsno()%>"><%=dto.getSubject()%></a>

			<%
			
			//오늘 작성한 글제목 뒤에 new 이미지 출력
			// 작성일(redgt)에서 "년월일" 자르기
			String regdt = dto.getRegdt().substring(0,10);
			if(regdt.equals(today)){
				out.println("<img src='../images/new.gif'>");
			}//if end
			
			//조회수가 10이상이면 hot이미지 출력
			if(dto.getReadcnt()>=10){
				out.println("<img src='../images/hot.gif'>");
			}//if end
			
			%>	
			</td>
			<td><%=dto.getReadcnt()%></td>
			<td><%=dto.getWname()%></td>
			<td><%=dto.getRegdt().substring(0,10)%></td>
			<td><input type="checkbox" value="delckecked" name="<%= %>" id="wname" class="form-control" ></td>

		</tr>
<% 
		}//for end
		//글갯수
		int totalRecord = dao.count();
		out.print("<tr>");
		out.print(" <td colspan='4' style='text-align:left;'>");
		out.print("  	글갯수: "+ totalRecord);
		out.print(" </td>");
		out.print(" <td> <input type='button' value='삭제'   class='btn btn-default' > </td> ");
		out.print("</tr>");
	}//if end
	
%>
	
	</tbody>
	</table>

<!-- 본문 끝 -->
 
 <%@ include file="../footer.jsp" %>