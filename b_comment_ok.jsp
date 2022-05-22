
<%@page import="java.sql.SQLException"%>
<%@page import="com.semi2.db.CommentVO"%>
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
	request.setCharacterEncoding("utf-8");
	String bdNo=request.getParameter("bdNo"); //부모키
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String content=request.getParameter("content2");
	
	//2
	CommentService commentService = new CommentService();
	CommentVO vo= new CommentVO();

	vo.setBdNo(Integer.parseInt(bdNo));
	vo.setId(id);
	vo.setPwd(pwd);
	vo.setContent(content);
	
	
	try{
		int cnt=commentService.insertComment(vo);
		
		if(cnt>0){%>
			<script type="text/javascript">
				alert("댓글 쓰기 성공");
				location.href="b_detail.jsp?no="+<%=bdNo%>
			</script>
		<% }else{ %>
			<script type="text/javascript">
				alert("댓글 쓰기 실패");
				location.href="b_detail.jsp?no="+<%=bdNo%>
			</script>
		<%}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>