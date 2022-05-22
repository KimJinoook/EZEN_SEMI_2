<%@page import="java.sql.SQLException"%>
<%@page import="com.semi2.db.BoardVO"%>
<%@page import="com.semi2.db.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>b_write_ok.jsp</title>
</head>
<body>
<%
	//b_write.jsp에서 post방식으로 서브밋됨
	//1
	request.setCharacterEncoding("utf-8");
	String title= request.getParameter("title");
	String id= request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String content=request.getParameter("content");
	
	
	//ip 읽어오기
	String ip=request.getRemoteAddr();
	System.out.println("ip="+ip);
	
	ip=request.getRemoteHost();
	System.out.println("ip="+ip);
	
	//2
	BoardDAO dao= new BoardDAO();
	BoardVO vo = new BoardVO();
	vo.setContent(content);
	vo.setId(id);
	vo.setPwd(pwd);
	vo.setTitle(title);
	
	try{
		int cnt=dao.insertBoard(vo);
		//3
		if(cnt>0){ %>
			<script type="text/javascript">
				alert("글쓰기 성공");
				location.href="b_list.jsp";
			</script>
		<%}else {%>
			<script type="text/javascript">
				alert("글쓰기 실패");
				history.back();
			</script>
		<%}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>