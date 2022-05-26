<%@page import="com.semi2.store.model.StoreService"%>
<%@page import="com.semi2.list.model.ListService"%>
<%@page import="com.semi2.list.model.ListVO"%>
<%@page import="com.semi2.store.model.StoreVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String group_no = request.getParameter("group_no");
	ListService listService = new ListService();
	List<ListVO> listVoList = listService.selectByGroup(Integer.parseInt(group_no));
	
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
		
		$('[id^=addStore]').on('click',function(){
				var list_no = $(this).find('input').val();
				var st_name = prompt('가게 이름을 입력하세요');
				window.open('list_storeadd.do?st_name='+st_name+'&list_no='+list_no+'&group_no=<%=group_no%>','가게검색','width=400px, height=800px,scrollbars=yes'); 
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
	<div id="accordion">
	  <%
	  for(int i=0; i<listVoList.size();i++){
		  ListVO listVo = listVoList.get(i);
		  List<StoreVO> storeList = storeService.selectStore(listVo.getList_no());%>
		  
		  <h3><%=listVo.getList_name() %></h3>
		  <div>
		  	<p><a href="#" id="addStore"><input type="hidden" value="<%=listVo.getList_no()%>">맛집 추가</a><br><br></p>
		  	<%for(int j=0; j<storeList.size();j++){
		  		StoreVO storeVo = storeList.get(j);%>
		  		<a href="liststore_delete.do?list_no=<%=listVo.getList_no()%>&store_no=<%=storeVo.getNo()%>&group_no=<%=group_no%>" id = "del"">삭제</a>
		  		<p><%=storeVo.getName() %></p>
		  	<%}%>
		  </div>
	  <%}%>
	</div>

</body>
</html>