<%@page import="com.semi2.menu.model.MenuVO"%>
<%@page import="com.semi2.menu.model.MenuService"%>
<%@page import="com.semi2.store.model.StoreService"%>
<%@page import="com.semi2.list.model.ListService"%>
<%@page import="com.semi2.list.model.ListVO"%>
<%@page import="com.semi2.store.model.StoreVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String st_no = request.getParameter("st_no");
	MenuService menuService = new MenuService();
	List<MenuVO> menuVoList = menuService.selectAll(Integer.parseInt(st_no));
	
	StoreService storeService = new StoreService();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="css/jquery-ui.min.css" type="text/css" rel="stylesheet">
<script src = "js/jquery-3.6.0.min.js"></script>
<script src = "js/jquery-ui.min.js"></script>
<script>
	$(function(){
		$('#accordion').accordion();
		
		$('[id^=addMenu]').on('click',function(){
				window.open('menu_add.jsp?st_no=<%=st_no%>','메뉴등록','width=400px, height=800px,scrollbars=yes'); 
		});
	});
</script>
<style>
	#del{
		float : right;
	}
</style>
</head>
<body>
	<p><a href="#" id="addMenu"><input type="hidden" value="<%=st_no%>">메뉴 추가</a><br><br></p>
	<div id="accordion">
	  <%
	  for(int i=0; i<menuVoList.size();i++){
		  MenuVO menuVo = menuVoList.get(i);%>
		  
		  <h3><%=menuVo.getMenu_name() %> / <%=menuVo.getMenu_price() %></h3>
		  <div>
		  		<a href="menu_delete.jsp?menu_name=<%=menuVo.getMenu_name()%>&st_no=<%=st_no%>" id = "del"">삭제</a>
		  		<img src = "<%=menuVo.getMenu_pic()%>" height = "200px" width = "200px">
		  </div>
	  <%}%>
	</div>

</body>
</html>