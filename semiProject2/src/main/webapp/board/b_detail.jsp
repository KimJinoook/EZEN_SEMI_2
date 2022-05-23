<%@page import="com.semi2.comment.model.CommentVO"%>
<%@page import="com.semi2.comment.model.CommentService"%>
<%@page import="com.semi2.board.model.BoardVO"%>
<%@page import="com.semi2.board.model.BoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="java.util.List"%>

<%@page import="java.sql.SQLException"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1
	String no=(String)request.getAttribute("no");
	String type = (String)request.getAttribute("type");
	BoardVO vo = (BoardVO)request.getAttribute("vo");
	List<CommentVO> list = (List<CommentVO>)request.getAttribute("list");
	System.out.println(no);
	System.out.println(type);
	System.out.println(vo);
	
	//3
	String content=vo.getContent();
	if(content!=null && !content.isEmpty()){
		content=content.replace("\r\n", "<br>");
	}else{
		content="";
	}
	
	
	//comment
	
	//1
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String content2=request.getParameter("content2");
	
	//2
	
	
	SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="../img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="../lib/animate/animate.min.css" rel="stylesheet">
    <link href="../lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="../lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    
<link rel="stylesheet" type="text/css" href="../css/board/mainstyle.css" />
<link rel="stylesheet" type="text/css" href="../css/board/clear.css" />
<link rel="stylesheet" type="text/css" href="../css/board/formLayout4.css" />
<link rel="stylesheet" type="text/css" href="../css/board/mystyle.css" />
<!-- Customized Bootstrap Stylesheet -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
    <link href="../css/style.css" rel="stylesheet">
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">	
	$(function(){
		//목록
		$('#bt_list').click(function(){
			location.href= 'b_list.do?type=<%=type%>';
		});
		
		//답변
		$('#bt_reply').click(function(){
			if($('#id').val() =="null" && $('#pwd').val() =="null"){
				alert('로그인이 필요합니다.');
				location.href= '../login.do';
			
			}else{
				if(<%=type%>==1){
					alert('답변 불가 게시판입니다');
					return false;
				}
				location.href= 'b_write.do?no='+<%=no%>+"&type=<%=type%>";
			}
		});
		
		//글수정
		$('#bt_edit').click(function(){
			if($('#id').val() =="null" && $('#pwd').val() =="null"){
				alert('로그인이 필요합니다.');
				event.preventDefault();
			}else if($('#id').val() == $('#chkId').val()  //로그인정보=작성자정보 일치성공!
						&&  $('#pwd').val() == $('#chkPwd').val()){ 
				alert('a');
				location.href= 'b_edit.do?no=<%=no%>&type=<%=type%>';
			}else{
				alert('수정 권한이 없습니다.');
				event.preventDefault();
			}
		});
		
		//글삭제
		$('#bt_del').click(function(){
			if($('#id').val() =="null" && $('#pwd').val() =="null"){
				alert('로그인이 필요합니다.');
				event.preventDefault();
			}else if($('#id').val() == $('#chkId').val() //로그인정보=작성자정보 일치성공!
					&&  $('#pwd').val() == $('#chkPwd').val()){ 
				
				if(confirm('삭제하시겠습니까?')){
					location.href= 'b_delete.do?no='+<%=no%>+'&type=<%=type%>'
					+'&groupNo='+<%=vo.getGroupNo()%>
					+'&step='+<%=vo.getStep()%>;
				}
			
			}else{
				alert('삭제 권한이 없습니다.');
				event.preventDefault();
			}
			
		});
		
		//댓글
		 $('#bt_comment').click(function(){	
			if($('#id').val() =="null" && $('#pwd').val() =="null"){
				alert('로그인이 필요합니다.');
				event.preventDefault(); 
			}else{
				$('form[name=Commentfrm]').submit();
			}
		}); 
		
		//댓글삭제
		 $('td > input[type="button"]').click(function(){
		 		if($('#id').val() =="null" && $('#pwd').val() =="null"){
		 			alert('로그인이 필요합니다.');
		 			event.preventDefault();
		 		}else if($('#id').val() == $('#c_id').val() //로그인정보=작성자정보 일치성공!
		 				&&  $('#pwd').val() == $('#c_pwd').val()){ 
		 			if(confirm('삭제하시겠습니까?')){
		 				location.href='b_comment_del.do?no='+$('#c_no').val()
		 						+'&bdNo='+<%=no%>+'&type='+<%=type%>;	
		 			}
		 		
		 		}else{
		 			alert('삭제 권한이 없습니다.');
		 			event.preventDefault();
		 		}
		 		
		 	});

	});
</script>

</head>
<body>
<!-- Navbar Start -->
	<%@include file="../navbar.jsp"%>
	<!-- Navbar End -->

    <!-- 상단 배너 -->
    <div class="container-fluid page-header py-5 mb-5">
        <div class="container py-5">
            <h1 class="display-3 text-white mb-3 animated slideInDown">이젠 먹으러 갑니다</h1>
        </div>
    </div>
    <!-- 상단 배너 끝 -->
	<div class="divForm">
	<h2 class="m-0 text-primary">글 상세보기</h2>
		<!-- 상세보기 -->
		<div class="firstDiv">
			<span class="sp1">제목</span> <span><%=vo.getTitle() %></span>
		</div>
		<div>
			<span class="sp1">작성자</span> <span><%=vo.getId() %></span>
		</div>
		<div>
			<span class="sp1">등록일</span> <span><%=vo.getRegdate() %></span>
		</div>
		<div>
			<span class="sp1">조회수</span> <span><%=vo.getReadcount() %></span>
		</div>
		<div class="lastDiv">			
			<p class="content"><%=content %></p>
		</div>
		
		<!-- 댓글 테이블-->
		<div class="divComment">
			<div class="ctb">
				<table id="comentTb" border="1px soild black">
					<tbody>

					<!-- 댓글 내용 반복문 시작 -->
						<%for(int i=0; i<list.size(); i++) {
							CommentVO commentVo = null;
							commentVo= list.get(i);
							%>
							<div>
							<input type="hidden" id="c_pwd" value="<%=commentVo.getPwd() %>">
							<input type="hidden" id="c_id" value="<%=commentVo.getId() %>">
							<input type="hidden" id="c_no" value="<%=commentVo.getNo() %>">
							</div>					
							<tr style="line-height: 0.2">
							<td class="writer"><%=commentVo.getId() %></td>
							<td class="content"><%=commentVo.getContent() %></td>
							<td class="date"><%=sdf.format(commentVo.getRegdate())%></td>
							<td class="btnX"><input type="button" value="x"></td>
							</tr>
						<%}//for %>
					<!-- 반복 끝 -->
				
				</tbody>
			</table>
		</div>
		
		<!-- 댓글 입력폼-->
		<form name="Commentfrm" method="post" action="b_comment_ok.do?type=<%=type%>">
			<div class="cfrm">
				<fieldset>
					<input type="hidden" id="bdNo" name="bdNo" value="<%=no %>" >
					
					<!-- 로그인된 아이디/비번 정보 -->
		    		<input type="hidden" id="id" name="id" 
	        		 value="<%=session.getAttribute("userid") %>"/>       
	        		<input type="hidden" id="pwd" name="pwd"
	       			value="<%=session.getAttribute("pwd") %>"/>
	       			
					<textarea id="content2" name="content2" rows="7" cols="40"></textarea>
					
					<div>
						<input type="submit" id="bt_comment" value="확인" >
					</div>
				</fieldset>
			</div>
		</form>
			
	</div>
		
		<!-- 버튼 -->
		<div class="center">
			<!-- 글 작성자의 아이디/비번 정보-->
			<input type="hidden" id="chkId" name="chkId" value="<%=vo.getId() %>"/>
			<input type="hidden" id="chkPwd" name="chkPwd" value="<%=vo.getPwd() %>"/>

			<input type="button" id="bt_edit" name="bt_edit" value="수정">
			<input type="button" id="bt_del" name="bt_del" value="삭제">
			<input type="button" id="bt_reply" name="bt_reply" value="답변">
			<input type="button" id="bt_list" name="bt_list" value="목록">
			
		</div>
	</div>

</body>
</html>