package com.semi2.db;

import java.sql.SQLException;

public class MemService {
	//아이디 중복확인에서 사용하는 상수
	public static final int USABLE_ID=1; //사용가능한 아이디
	public static final int UNUSABLE_ID=2;	//이미 존재해서 사용불가능한 아이디
	
	private MemDAO memdao;
	
	public MemService(){
		memdao=new MemDAO();
	}
	
	public int insertMember(MemVO vo) throws SQLException {
		System.out.println(vo.getMem_name());
		System.out.println(vo.getMem_id());
		System.out.println(vo.getMem_pw());
		System.out.println(vo.getMem_tel());
		
		return memdao.insertMember(vo);
	}
	
	public int duplicateId(String userid) throws SQLException {
		return memdao.duplicateId(userid);
	}
}
