<%@page import="com.semi2.store.model.StoreService"%>
<%@page import="com.semi2.store.model.StoreVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String st_name = request.getParameter("st_name");
	String list_no = request.getParameter("list_no");
	String group_no = request.getParameter("group_no");

	List<StoreVO> storeVoList =  (List<StoreVO>)request.getAttribute("storeVoList");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2><%=st_name %> 검색 결과</h2><br>
<%for(int i=0; i<storeVoList.size();i++){
	StoreVO storeVo = storeVoList.get(i);
	%><p><a href="list_storeadd_ok.do?st_no=<%=storeVo.getNo()%>&list_no=<%=list_no%>&group_no=<%=group_no %>" id="store"><%=storeVo.getName() %></a></p>
<%}%>
</body>
</html>