<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String l_userid= (String)session.getAttribute("userid");

	if(l_userid==null || l_userid.isEmpty()){
		String ctxPath=request.getContextPath();
		String url = ctxPath+"/login.do";
	%>
		<script type="text/javascript">
			alert('다시 로그인 해주세요.');
			location.href="<%=url%>";
		</script>
	
	<%	return;
	}
%>