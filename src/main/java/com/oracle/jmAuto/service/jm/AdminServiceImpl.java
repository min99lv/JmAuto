package com.oracle.jmAuto.service.jm;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.jmAuto.dao.jm.AdminDao;
import com.oracle.jmAuto.dto.AllUser_Info;
import com.oracle.jmAuto.dto.User_Table;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService {
	
	private final AdminDao ad;

	// NOTE : 회원목록 조회
	@Override
	public List<User_Table> selectUserList() {

		System.out.println("AdminServiceImpl.selectUserList() start....");
		List <User_Table> userList = ad.selectUserList();

		return userList;
	}
	
	
	
	// NOTE : 회원 비활성화
	@Override
	public int userDeactive(String user_id) {
		System.out.println("AdminServiceImpl.userDeactive() start....");
		int result = ad.userDeactive(user_id);
		System.out.println("AdminServiceImpl.userDeactive() Result >>" + result);

		return result;
	}

	// NOTE : 회원 활성화
	@Override
	public int userActive(String user_id) {
		System.out.println("AdminServiceImpl.userActive() start....");
		int result = ad.userActive(user_id);
		System.out.println("AdminServiceImpl.userActive() Result >>" + result);

		return result;
	}

	// NOTE : 승인 요청한 회원 목록
	@Override
	public List<User_Table> selectApprovalUser() {
		System.out.println("AdminServiceImpl.selectApprovalUser start....");
		List <User_Table> userList = ad.selectApprovalUserList();

		return userList;
	}



	// NOTE : 승인 요청 처리
	@Override
	public int userApprove(String user_id) {
		System.out.println("AdminServiceImpl.userApprove start..");
		
		int result = ad.userApprove(user_id);

		
		return result;
	}



	// NOTE : 승인 요청 사용자 상세 정보 
	@Override
	public AllUser_Info userDetail(String user_id) {
		System.out.println("AdminServiceImpl.userDetail start...");
		
		AllUser_Info userInfo = ad.userDetail(user_id);

		return userInfo;
	}



	// NOTE : 관리자 추가
	@Override
	public int createManager(User_Table user) {

		System.out.println("AdminServiceImpl.createUser() start...");

		int result = ad.createManager(user);

		return result;
	}



	@Override
	public List<User_Table> searchUserList(String keyword) {
		System.out.println("AdminServiceImpl.selectUserList() start....");

		List<User_Table> userList = ad.searchUserList(keyword);

		return userList;
	}

}
