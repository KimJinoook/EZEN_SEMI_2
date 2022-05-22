<%@page import="java.sql.SQLException"%>
<%@page import="com.semi2.db.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>countUpdate.jsp</title>
</head>
<body>
<%
	String no=request.getParameter("no");
	if(no==null || no.isEmpty()){%>
		<script type="text/javascript">
			alert('잘못된 url');
			location.href="b_list.jsp";
		</script>
	<% return;
	}//if
	
	//2
	BoardDAO dao= new BoardDAO(); 
	
	try{
		int cnt=dao.updateCount(Integer.parseInt(no));
		
		if(cnt>0){
			response.sendRedirect("b_detail.jsp?no="+no);
		}else{%>
			<script type="text/javascript">
			alert("조회수 증가 실패!");
			history.back();
			</script>
		<% }
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>