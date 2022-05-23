<%@page import="com.semi2.util.VisitService"%>
<%@page import="com.semi2.mem.model.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	VisitService visitService = new VisitService();
	if(session.isNew()){
		visitService.insertVisit();
	}

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
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	$('#keyword').keyup(function(e){
		if(e.key == "Enter"){
			var key = $('#keyword').val();
			location.href="<%=request.getContextPath()%>/project.do?keyword="+key;	
		}
	});	
	
	$('#openBroad').click(function(){
		alert('a');
		if(!<%=m_login%>){
			alert('로그인이 필요한 서비스 입니다.');
			location.href="<%=request.getContextPath()%>/login.do";
		}else if(<%=m_login%>){
			alert('로그인확인');
			window.open("<%=request.getContextPath()%>/broadcast.do","맛객채팅",
			"width=640,height=720,location=no,resizable=no,top=100,left=50");
		}
	});
	
	
});

</script>
<nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0">
        <a href="<%=request.getContextPath()%>/main.do" class="navbar-brand d-flex align-items-center border-end px-4 px-lg-5">
            <h2 class="m-0 text-primary">야먹자</h2>
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
                <a href="<%=request.getContextPath()%>/formanager.do" class="nav-item nav-link active">관리자 메뉴</a>
            
            <%} %>
                <a href="<%=request.getContextPath()%>/main.do" class="nav-item nav-link active">홈</a>
                <a href="#" class="nav-item nav-link" onclick="openBroad()" id="openBroad">맛객 채팅</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">맛객식판</a>
                    <div class="dropdown-menu bg-light m-0">
                        <a href="<%=request.getContextPath()%>/board/b_list.do?type=1" class="dropdown-item">공지사항</a>
                        <a href="<%=request.getContextPath()%>/board/b_list.do?type=2" class="dropdown-item">맛집추천</a>
                        <a href="<%=request.getContextPath()%>/board/b_list.do?type=3" class="dropdown-item" >자유게시판</a>
                        <a href="<%=request.getContextPath()%>/board/b_list.do?type=4" class="dropdown-item" >Q&A</a>
                    </div>
            	</div>
            <!-- 로그인 된 경우 -->
            <%if(m_login){ %>
            <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">내정보</a>
                    <div class="dropdown-menu bg-light m-0">
                        <a href="<%=request.getContextPath()%>/board/b_list.do?searchCondition=id&type=3&searchKeyword=<%=m_userid%>" class="dropdown-item">내글보기</a>
                        <a href="<%=request.getContextPath()%>/memEdit.do" class="dropdown-item">회원정보 수정</a>
                        <a href="<%=request.getContextPath()%>/memOut.do" class="dropdown-item" >회원탈퇴</a>
                    </div>
            </div>
            </div>            
            <a href="<%=request.getContextPath()%>/logout.jsp" class="btn btn-primary rounded-0 py-4 px-lg-5 d-none d-lg-block">로그아웃<i class="fa fa-arrow-right ms-3"></i></a>
            	
            <%}else{ %>
            </div>
            <a href="<%=request.getContextPath()%>/login.do" class="btn btn-primary rounded-0 py-4 px-lg-5 d-none d-lg-block">로그인 하기<i class="fa fa-arrow-right ms-3"></i></a>
  			<%} %>
  		</div>
    </nav>