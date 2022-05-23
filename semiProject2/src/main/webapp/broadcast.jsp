<%@page import="com.semi2.mem.model.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	MemVO vo=new MemVO();
	String mem_id = (String)session.getAttribute("userid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test</title>
<link rel="stylesheet" href="css/broadcast.css">
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div id="main-container">
        <div id="chat-container">
            
        </div>
        <div id="bottom-container">
            <input id="inputMessage" type="text">
            <input id="btn-submit" type="submit" value="전송" >
        </div>
    </div>
</body>
<script type="text/javascript">
    var textarea = document.getElementById("messageWindow");
    var webSocket = new WebSocket('ws://localhost:9090/semiProject2/broadcasting');
    
    var inputMessage = document.getElementById('inputMessage');
    var userid = '<%=mem_id%>';
    
    webSocket.onerror = function(e){
        onError(e);
    };
    webSocket.onopen = function(e){
        onOpen(e);
    };
    webSocket.onmessage = function(e){
        onMessage(e);
    };
    
    
    function onMessage(e){
        var chatMsg = event.data;
        var date = new Date();
        var dateInfo = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
        
        var $chat = $("<div class='chat-box'><div class='chat'> " + chatMsg + "</div><div class='chat-info chat-box'>"+ dateInfo +"</div></div>");
        $('#chat-container').append($chat);
        
        
        $('#chat-container').scrollTop($('#chat-container')[0].scrollHeight+20);
    }
    
    function onOpen(e){
        
    }
    
    function onError(e){
        alert(e.data);
    }
    
    function send(){
        var chatMsg = inputMessage.value;
        if(chatMsg == ''){
            return;
        }
        var date = new Date();
        var dateInfo = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
        
        var $chat = $("<div class='my-chat-box'><div class='chat my-chat'>" + chatMsg + "</div><div class='chat-info'>"+ dateInfo +"</div></div>");
        $('#chat-container').append($chat);
        webSocket.send(userid+" : " +chatMsg);
        inputMessage.value = "";
        $('#chat-container').scrollTop($('#chat-container')[0].scrollHeight+20);
    }
    
</script>
 
<script type="text/javascript">
    $(function(){
        $('#inputMessage').keydown(function(key){
            if(key.keyCode == 13){
                $('#inputMessage').focus();
                send();
            }
        });
        $('#btn-submit').click(function(){
            send();
        });
        
    })
</script>
</html>