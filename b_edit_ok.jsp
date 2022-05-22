<%@page import="java.sql.SQLException"%>
<%@page import="com.semi2.db.BoardVO"%>
<%@page import="com.semi2.db.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>b_edit_ok.jsp</title>
</head>
<body>
<%
	//1
	request.setCharacterEncoding("utf-8");
	String no=request.getParameter("no");
	String title=request.getParameter("title");
	String content=request.getParameter("content");

	
	//2
	BoardDAO dao=new BoardDAO();
	BoardVO vo= new BoardVO();
	vo.setContent(content);
	vo.setTitle(title);
	vo.setNo(Integer.parseInt(no));
	
	try{
		//3
		int cnt=dao.updateBoard(vo);
		if(cnt>0){%>
			<script type="text/javascript">
				alert('글 수정 성공!');
				location.href="b_detail.jsp?no=<%=no%>";
			</script>
		<%}else{ %>
			<script type="text/javascript">
				alert('글 수정 실패!');
				history.go(-1);
			</script>	
		<%}		
	}catch(SQLException e){
		e.printStackTrace();
	}
	
%>
</body>
</html>