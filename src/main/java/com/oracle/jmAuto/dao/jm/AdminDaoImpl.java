package com.oracle.jmAuto.dao.jm;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.jmAuto.dto.AllUser_Info;
import com.oracle.jmAuto.dto.User_Table;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class AdminDaoImpl implements AdminDao {
	
	private final SqlSession session;
	

	
	// NOTE : 회원목록조회
	@Override
	public List<User_Table> selectUserList() {
		System.out.println("AdminDaoImpl.selectUserList() start...");
		List<User_Table> userList = session.selectList("com.oracle.jmAuto.dto.Mapper.admin.selectUserList");

		return userList;
	}



	// NOTE : 회원 비활성화
	@Override
	public int userDeactive(String user_id) {

		int result = session.update("com.oracle.jmAuto.dto.Mapper.admin.userDeactive",user_id);
		
		return result;
	}


	// NOTE : 회원 활성화
	@Override
	public int userActive(String user_id) {
			int result = session.update("com.oracle.jmAuto.dto.Mapper.admin.userActive",user_id);
		
		return result;
	}



	// NOTE : 승인 요청 회원 목록 조회
	@Override
	public List<User_Table> selectApprovalUserList() {
		System.out.println("AdminDaoImpl.selectUserList() start...");
		List<User_Table> userList = session.selectList("com.oracle.jmAuto.dto.Mapper.admin.selectApprovalUserList");

		return userList;
	}


	// NOTE : 승인 요청 처리
	@Override
	public int userApprove(String user_id) {
		int result = session.update("com.oracle.jmAuto.dto.Mapper.admin.userApprove",user_id);
		
		
		return result;
	}



	// NOTE : 승인 요청 회원 상세 정보
	@Override
	public AllUser_Info userDetail(String user_id) {
		System.out.println("AdminDaoImpl.userDetail start...");
		
		AllUser_Info userInfo = session.selectOne("com.oracle.jmAuto.dto.Mapper.admin.userDetail",user_id);
		
		System.out.println("AdminDaoImpl.userDetail usesrInfo >>" + userInfo);


		return userInfo;
	}



	// NOTE : 관리자 추가
	@Override
	public int createManager(User_Table user) {
		System.out.println("AdminDaoImpl.createManager() start...");
		

		int result = session.insert("com.oracle.jmAuto.dto.Mapper.admin.createManager", user);

		System.out.println("AdminDaoImpl.createManager() result >>" + result);
		

		return result;
	}



	// NOTE - 회원 목록 검색
	@Override
	public List<User_Table> searchUserList(String keyword) {
		System.out.println("AdminDaoImpl.selectUserList() start...");
		List<User_Table> userList = session.selectList("com.oracle.jmAuto.dto.Mapper.admin.searchUserList",keyword);

		System.out.println("AdminDaoImpl.selectUserList() userList" + userList);

		return userList;
	}

}
