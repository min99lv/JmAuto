package com.oracle.jmAuto.service.jm;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.jmAuto.dao.jm.AdminDao;
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

}
