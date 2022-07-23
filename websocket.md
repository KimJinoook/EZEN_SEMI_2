# 웹소켓 활용 실시간 접속자 채팅
![채팅](https://user-images.githubusercontent.com/99188096/180596675-c329a52d-d33a-431c-a5f5-0b677ca9dddc.PNG)   

- broadcast.jsp 페이지 접속시 BroadSocket.java의 static set에 세션 정보 저장
- 채팅 입력 시 해당 내용을 BroadSocket.java의 static set에 저장된 세션을 반복문으로 순회하며 메세지 전달
- 클라이언트 측은 전달받은 메세지를 메세지창에 append 하며 채팅내용 표시

- BroadSocket.java   

```java
package com.semi2.util;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/broadcasting")
public class Broadsocket {

	private static Set<Session> clients = Collections
			.synchronizedSet(new HashSet<Session>());

	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println(message);
		synchronized (clients) {
			for (Session client : clients) {
				if (!client.equals(session)) {
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}

	@OnOpen
	public void onOpen(Session session) {
		System.out.println(session);
		clients.add(session);
	}

	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
	}
}
```

- broadcast.jsp   

```html
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
```
