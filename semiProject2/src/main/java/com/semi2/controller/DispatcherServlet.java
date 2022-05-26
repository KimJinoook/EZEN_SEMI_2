package com.semi2.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/DispatcherServlet")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private Properties props;
	
	//해당 서블릿이 요청될때 최초로 한번만 호출되는 메서드
	@Override
	public void init(ServletConfig config) throws ServletException {
		//매핑 파일을 읽어서 Properties 컬렉션에 담아 놓는다
		//web.xml에서 <init-param>의 값 읽기-CommandPro.properties 파일
		String configFile
=config.getInitParameter("configFile"); //=>/config/CommandPro.properties
		System.out.println("configFile="+configFile);
		
		//매핑 파일의 실제 경로 구하기
		String realPath
		=config.getServletContext().getRealPath(configFile);
		System.out.println("realPath="+realPath+"\n");
		
		props=new Properties();
		FileInputStream fis=null;
		try {
			fis=new FileInputStream(realPath);
			props.load(fis);
			//=> CommandPro.properties파일의 정보를 Properties객체에 저장
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				if(fis!=null) fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) 
					throws ServletException, IOException {
		requestPro(request, response);	
	}

	private void requestPro(HttpServletRequest request, 
			HttpServletResponse response) 
					throws ServletException, IOException{
		//매핑파일을 참고해서 직원을 구해서 일시킨다
		
		//매핑파일이 들어있는 Properties 컬렉션에서 사용자의 URI(/tips/book.do)에 해당하는
		//직원 Controller(BookController)를 구해서, 직원 Controller에게 일시킨다
		//(직원 Controller의 메서드 호출) 
		//=> 그리고 나서, 결과를 리턴 받아서 해당 뷰 페이지로 포워딩시킨다
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		//1. 요청 URI 에서 명령어 추출
		//URI 읽어오기
		String uri=request.getRequestURI(); //=> /mymvc/tips/travel.do
		System.out.println("uri="+uri);
		
		//명령어 => contextpath 제거 : /tips/travel.do
		String ctxPath=request.getContextPath(); //=> /mymvc		
		if(uri.indexOf(ctxPath)==0) {
			uri=uri.substring(ctxPath.length()); //=> /tips/travel.do
		}
		
		System.out.println("ctxPath="+ctxPath+", 명령어:"+ uri);
		
		//매핑파일
		//=>/tips/travel.do=com.tips.controller.TravelController2
		//key: /tips/travel.do,  value : TravelController2
		String val = props.getProperty(uri);
		System.out.println("명령어 처리 클래스:"+ val);
		if(val==null || val.isEmpty()) {
			response.sendRedirect(ctxPath+"/404.do");
		}
		
		try {
			Class commandClass= Class.forName(val); //String=>Class
			//=> 해당 문자열을 클래스로 만든다.
			
			Controller controller = (Controller) commandClass.newInstance();
			//=> 해당클래스의 객체를 생성
			
			//명령어 처리 클래스의 메서드 호출
			String viewPage=controller.requestProcess(request, response);
			System.out.println("viewPage="+viewPage);
			
			if(controller.isRedirect()) {  //redirect
				System.out.println("redirct!\n");
				response.sendRedirect(ctxPath+viewPage); //=>/mymvc + /abc.jsp
			}else {  //forward
				//뷰페이지로 포워드
				System.out.println("forward!\n");
				
				RequestDispatcher dispatcher
				=request.getRequestDispatcher(viewPage);
				dispatcher.forward(request, response);				
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (Throwable e) {
			e.printStackTrace();
		} 

	}

}
