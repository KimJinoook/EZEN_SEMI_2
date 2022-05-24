package com.semi2.util;

import java.sql.Timestamp;
import java.util.Date;

public class Utility {
	public static final String UPLOAD_PATH="pds_upload";
	public static final String TEST_PATH="C:\\lecture\\jsp-ws\\semi2\\src\\main\\webapp\\review_upload";
	
	public static String displayRe(int step) {
		String result="";
		if(step>0){ //�떟蹂�湲��씠硫�..
			for(int j=0;j<step;j++){ 
				result+="&nbsp;"; //怨듬갚癒쇱� 遺숈씠湲�
			}

			result+="<img src='../img/board/re.gif'>"; // 怨듬갚+�븘�씠肄�
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
		// getTime() : 1970.01.01 �씠�썑 寃쎄낵�맂 �떆媛꾩쓣 諛�由ъ큹濡� �굹���궡�뒗 硫붿냼�뱶
		long time = today.getTime() - regdate.getTime();
		time = time / (1000 * 60 * 60);

		if(time < 24) {
			result = "<img src='../img/board/new.gif'>";
		}

		return result;
	}



}