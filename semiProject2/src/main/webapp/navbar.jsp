<%@page import="com.semi2.db.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	boolean m_login=false;
	boolean m_manager = false;
	String m_userid=(String)session.getAttribute("userid");
	MemVO m_memVo = (MemVO)session.getAttribute("curMemVo");
	if(m_userid!=null && !m_userid.isEmpty()){
		m_login=true;
	}
	if(m_memVo!=null){
		if(m_memVo.getMem_manager()!=null && !m_memVo.getMem_manager().isEmpty()){
			m_manager=true;
		}
		
	}
	String curPage = request.getServletPath();
%>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	$('#keyword').keyup(function(e){
		if(e.key == "Enter"){
			var key = $('#keyword').val();
			location.href="project.jsp?keyword="+key;	
		}
	});	
});
</script>
<nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0">
        <a href="main.jsp" class="navbar-brand d-flex align-items-center border-end px-4 px-lg-5">
            <h2 class="m-0 text-primary">브랜드명</h2>
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
        
        	<%if(!curPage.equals("/main.jsp")){ %>
	       		<div class="position-relative mx-auto" style="max-width: 400px;">
	                <input class="form-control border-0 w-100 py-3 ps-4 pe-5" type="text" placeholder="지역, 식당 또는 음식" name="keyword" id="keyword">
	            </div>
            <%} %>
            
            <div class="navbar-nav ms-auto p-4 p-lg-0">
            <%if(m_manager){ %>
                <a href="formanager.jsp" class="nav-item nav-link active">관리자 메뉴</a>
            
            <%} %>
                <a href="main.jsp" class="nav-item nav-link active">홈</a>
                <a href="#" class="nav-item nav-link">맛집 리스트</a>
                <a href="#" class="nav-item nav-link">맛집 후기</a>
            <!-- 로그인 된 경우 -->
            <%if(m_login){ %>
                <a href="memEdit.jsp" class="nav-item nav-link">회원정보 수정</a>
            </div>
            <a href="logout.jsp" class="btn btn-primary rounded-0 py-4 px-lg-5 d-none d-lg-block">로그아웃<i class="fa fa-arrow-right ms-3"></i></a>
            	
            <%}else{ %>
                <a href="#" class="nav-item nav-link">Project</a>
            </div>
            <a href="login.jsp" class="btn btn-primary rounded-0 py-4 px-lg-5 d-none d-lg-block">로그인 하기<i class="fa fa-arrow-right ms-3"></i></a>
  			<%} %>
    </nav>