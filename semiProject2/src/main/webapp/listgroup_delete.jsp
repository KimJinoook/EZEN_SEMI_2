<%@page import="com.semi2.listGroup.model.ListGroupService"%>
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
	request.setCharacterEncoding("utf-8");
	String no = (String)request.getAttribute("no");
	ListGroupService listGroupService = new ListGroupService();
	
%>
<script>
var con = confirm('하위 리스트도 모두 삭제됩니다. 삭제하시겠습니까?');
if(con){
	<%int cnt = listGroupService.deleteGroup(Integer.parseInt(no));%> 
	location.href="formanager.do";
}else{
	history.back();
}
</script>

</body>
</html>