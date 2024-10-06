package com.oracle.jmAuto.dao.jm;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
		List<User_Table> userList = session.selectList("com.oracle.jmAuto.Stats_Mapper.admin.selectUserList");

		return userList;
	}

}
