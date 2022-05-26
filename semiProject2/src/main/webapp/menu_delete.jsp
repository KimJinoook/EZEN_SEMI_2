<%@page import="com.semi2.menu.model.MenuDAO"%>
<%@page import="com.semi2.menu.model.MenuService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    String menu_name = request.getParameter("menu_name");
    String st_no = request.getParameter("st_no");
    
    MenuDAO menuDao = new MenuDAO();
    int cnt = menuDao.deleteMenu(Integer.parseInt(st_no), menu_name);
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
location.href="menu_edit.jsp?st_no=<%=st_no%>";
</script>
</body>
</html>