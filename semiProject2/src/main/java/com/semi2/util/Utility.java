package com.semi2.util;

import java.sql.Timestamp;
import java.util.Date;

public class Utility {
	
	public static String displayRe(int step) {
		String result="";
		if(step>0){ //답변글이면..
			for(int j=0;j<step;j++){ 
				result+="&nbsp;"; //공백먼저 붙이기
			}

			result+="<img src='../img/board/re.gif'>"; // 공백+아이콘
		}

		return result;
	}

	public static String cutString(String title, int len) {
		String result="";
		if(title.length()>len){
			result=title.substring(0, len) +"...";
		}else{
			result=title;
		}
		return result;
	}

	public static String displayNew(Timestamp regdate) {
		String result = "";
		Date today = new Date();
		// getTime() : 1970.01.01 이후 경과된 시간을 밀리초로 나타내는 메소드
		long time = today.getTime() - regdate.getTime();
		time = time / (1000 * 60 * 60);

		if(time < 24) {
			result = "<img src='../img/board/new.gif'>";
		}

		return result;
	}



}