<%@page import="java.sql.SQLException"%>
<%@page import="com.semi2.db.BoardVO"%>
<%@page import="com.semi2.db.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>b_reply_ok.jsp</title>
</head>
<body>
<%
	//1.
	request.setCharacterEncoding("utf-8");
	String title= request.getParameter("title");
	String id= request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String content=request.getParameter("content");
	
	//상위글
	String groupNo=request.getParameter("groupNo");
	String step=request.getParameter("step");
	String sortNo=request.getParameter("sortNo");
	
	//2
	BoardDAO dao= new BoardDAO();
	BoardVO vo= new BoardVO();
	vo.setContent(content);
	vo.setId(id);
	vo.setPwd(pwd);
	vo.setTitle(title);
	
	vo.setGroupNo(Integer.parseInt(groupNo));
	vo.setStep(Integer.parseInt(step));
	vo.setSortNo(Integer.parseInt(sortNo));
	
	try{
		int cnt=dao.replyBoard(vo);
		
		if(cnt>0){%>
			<script type="text/javascript">
				alert("답변 등록 성공!");
				location.href="b_list.jsp";
			</script>
		<%}else{ %>
			<script type="text/javascript">
				alert("답변 등록 실패!");
				history.back();
			</script>		
		<%}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>