<%@page import="java.sql.SQLException"%>
<%@page import="com.semi2.db.BoardVO"%>
<%@page import="com.semi2.db.BoardDAO"%>
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
	String groupNo = request.getParameter("groupNo");
	String step = request.getParameter("step");
	
	//2
	BoardDAO dao = new BoardDAO();
	BoardVO vo= new BoardVO();
	vo.setNo(Integer.parseInt(no));
	vo.setGroupNo(Integer.parseInt(groupNo));
	vo.setStep(Integer.parseInt(step));

	try{
		if(dao.deleteBoard(vo)==false){%>	
			<script type="text/javascript">
				alert("삭제 성공");
				location.href = "b_list.jsp";
			</script>
		<%}else{%>
			<script type="text/javascript">
				alert("삭제 실패!");
				history.back();
			</script>		
		<%}
		
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>