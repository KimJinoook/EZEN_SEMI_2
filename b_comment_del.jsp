<%@page import="java.sql.SQLException"%>
<%@page import="com.semi2.db.CommentService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//1
	String no=request.getParameter("no");
	String bdNo=request.getParameter("bdNo");

	//2
	CommentService commentService= new CommentService();
	
	try{
		int cnt=commentService.deleteComment(Integer.parseInt(no));
		
		if(cnt>0){%>
			<script type="text/javascript">
				alert("댓글 삭제 성공");
				location.href = "b_detail.jsp?no="+<%=bdNo%>;
			</script>
		<%}else{%>
			<script type="text/javascript">
				alert("삭제 실패!");
				location.href = "b_detail.jsp?no="+<%=bdNo%>;
			</script>			
		<%}
	}catch(SQLException e){
		e.printStackTrace();
	}

%>
</body>
</html>