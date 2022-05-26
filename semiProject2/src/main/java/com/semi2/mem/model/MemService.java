package com.semi2.mem.model;

import java.sql.SQLException;
import java.util.List;

public class MemService {
	//아이디 중복확인에서 사용하는 상수
	public static final int USABLE_ID=1; //사용가능한 아이디
	public static final int UNUSABLE_ID=2;	//이미 존재해서 사용불가능한 아이디
	
	//로그인 체크에서 사용하는 상수
	public static final int LOGIN_OK=1; //로그인 성공
	public static final int DISAGREE_PWD=2; //비번 불일치
	public static final int NONE_USERID=3; //해당 아이디 없음
		
	private MemDAO memdao;
	
	public MemService(){
		memdao=new MemDAO();
	}
	
	public int totalMem() throws SQLException {
		return memdao.totalMem();
	}
	
	public List<MemVO> selectAll() throws SQLException{
		return memdao.selectAll();
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
	
	public int checkLogin(String userid, String pwd) throws SQLException {
		return memdao.checkLogin(userid, pwd);
	}
	
	public MemVO selectByUserid(String userid) throws SQLException {
		return memdao.selectByUserid(userid);
	}
	
	public int updateMember(MemVO vo) throws SQLException {
		return memdao.updateMember(vo);
	}
	
	public List<MemVO> selectMem(String keyword) throws SQLException {
		return memdao.selectMem(keyword);
	}
	
	public int deleteMember(String userid) throws SQLException {
		return memdao.deleteMember(userid);
	}
}