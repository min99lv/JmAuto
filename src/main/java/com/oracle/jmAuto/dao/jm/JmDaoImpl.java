package com.oracle.jmAuto.dao.jm;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.jmAuto.dto.Account;
import com.oracle.jmAuto.dto.FullUserInfo;
import com.oracle.jmAuto.dto.Business;
import com.oracle.jmAuto.dto.Certified;
import com.oracle.jmAuto.dto.User_Table;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class JmDaoImpl implements JmDao {
	private final SqlSession session;

	// TODO : 로그인 처리 
	@Override
	public User_Table login(String user_id) {
		System.out.println("JmDaoImpl.login start...");
		User_Table user_table = new User_Table();
		//Map<String, Object> user_table = new HashMap<>();
		
		try {
			System.out.println("JmDaoImpl.login() user_id" +user_id );
			user_table.setUser_id(user_id);
			//user_table.put("user_id", user_id);
			//user_table.put("user_pw", user_pw);
			
			user_table = session.selectOne("com.oracle.jmAuto.dto.Mapper.jm.loginUser", user_table);
			System.out.println(user_table);
		} catch (Exception e) {
			System.out.println("JmDaoImpl.login error" + e.getMessage());
		}
		System.out.println("JmDaoImpl.login user_Table--->" + user_table);
		return user_table;
	}

	// 회원가입
	@Override
	public int join(User_Table user) {
		System.out.println("JmDaoImpl.join start...");
		int joinResult = session.insert("com.oracle.jmAuto.dto.Mapper.jm.joinUser", user);
		return joinResult;
	}

	// 아이디 중복 체크
	@Override
	public int confirmId(String user_id) {
		System.out.println("JmDaoImpl.confirmId... start!!");
		int result = session.selectOne("com.oracle.jmAuto.dto.Mapper.jm.confirmId", user_id);
		System.out.println("JmDaoImpl.confirmId result--->" + result);

		return result;
	}

	@Override
	public int insertBuz(Business business) {

		System.out.println("JmDaoImpl.insertBuz start...");
		System.out.println("JmDaoImpl.insertBuz business -->" + business);

		int result = session.insert("insertBuz", business);

		return result;
	}

	@Override
	public int insertAccount(Account account) {
		System.out.println("JmDaoImpl.insertBuz start...");
		System.out.println("JmDaoImpl.insertBuz business -->" + account);

		int accountResult = session.insert("com.oracle.jmAuto.dto.Mapper.jm.insertAccount", account);

		return accountResult;
	}

	// 판매자 회원가입
	@Override
	public int sellerJoin(Business business, User_Table user_table, Account account) {
		System.out.println("JmDaoImpl.sellerJoin start.....");
		System.out.println("JmDaoImpl.sellerJoin business --->>>" + business);
		System.out.println("JmDaoImpl.sellerJoin user_table --->" + user_table);
		System.out.println("JmDaoImpl.sellerJoin account --->" + account);

		// seller join 결과
		int sellerJoinResult = 0;

		try {
			// business table 정보 입력
			int buzInsertResult = session.insert("insertBuz", business);
			// user table 정보 입력
			// int userInsertResult = session.insert("joinUser", user_table);
			// account Table 정보 입력
			// int accountIncertResult = session.insert("insertAccount",account);

			if (buzInsertResult > 0) {
				System.out.println("buzInsert OK --> result " + buzInsertResult);
				// user_table ---> buz num set
				user_table.setBuz_num(business.getBuz_num());
				// user table 정보 입력
				int userInsertResult = session.insert("com.oracle.jmAuto.dto.Mapper.jm.joinUser", user_table);
				if (userInsertResult > 0) {
					System.out.println("userInsert Ok --> " + userInsertResult);
					// account table ---> user id set
					account.setUser_id(user_table.getUser_id());
					// account 정보 입력
					int accountIncertResult = session.insert("com.oracle.jmAuto.dto.Mapper.jm.insertAccount", account);
					if (accountIncertResult > 0) {
						System.out.println("account Ok ---> result " + accountIncertResult);

					}
				}
				sellerJoinResult = 1;
				System.out.println("buzJoin OK !!!!!!!!!!!!!!!!!");

			} else {
				sellerJoinResult = 0;
				System.out.println("buzInsert Fail --->  result " + buzInsertResult);
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("JmDaoImpl.sellerJoin Error!!" + e.getMessage());
			throw e; // 트랜잭션 롤백을 유도
		}

		return sellerJoinResult;
	}

	@Override
	public int profJoin(Certified certified, User_Table user_table, Account account) {
		System.out.println("JmDaoImpl.profJoin start.....");
		System.out.println("JmDaoImpl.profJoin certified --->>>" + certified);
		System.out.println("JmDaoImpl.profJoin user_table --->" + user_table);
		System.out.println("JmDaoImpl.profJoin account --->" + account);

		// seller join 결과
		int certInsertResult = 0;

		try {
			// business table 정보 입력
			certInsertResult = session.insert("com.oracle.jmAuto.dto.Mapper.jm.insertProf", certified);
			// user table 정보 입력
			// int userInsertResult = session.insert("joinUser", user_table);
			// account Table 정보 입력
			// int accountIncertResult = session.insert("insertAccount",account);

			if (certInsertResult > 0) {
				System.out.println("certInsert OK --> result " + certInsertResult);
				// user_table ---> buz num set
				user_table.setCert_num(certified.getCert_num());
				// user table 정보 입력
				int userInsertResult = session.insert("com.oracle.jmAuto.dto.Mapper.jm.joinUser", user_table);
				if (userInsertResult > 0) {
					System.out.println("userInsert Ok --> " + userInsertResult);
					// account table ---> user id set
					account.setUser_id(user_table.getUser_id());
					// account 정보 입력
					int accountIncertResult = session.insert("com.oracle.jmAuto.dto.Mapper.jm.insertAccount", account);
					if (accountIncertResult > 0) {
						System.out.println("account Ok ---> result " + accountIncertResult);

					}
				}
				certInsertResult = 1;
				System.out.println("cert Join OK !!!!!!!!!!!!!!!!!");

			} else {
				certInsertResult = 0;
				System.out.println("certInsert Fail --->  result " + certInsertResult);
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("JmDaoImpl.certJoin Error!!" + e.getMessage());
			throw e; // 트랜잭션 롤백을 유도
		}

		return certInsertResult;
	}

	// 아이디 찾기
	@Override
	public String findId(User_Table user) {
		System.out.println("JmDaoImpl.findId start...");
		

		String user_id = session.selectOne("com.oracle.jmAuto.dto.Mapper.jm.findId", user);

		System.out.println("JmDaoImpl.findId user_id >>>" + user_id);

		return user_id;
	}

	// 비밀번호 찾기 - 회원 확인
	@Override
	public User_Table findPw(User_Table user) {
		System.out.println("JmDaoImpl.findPw() start...");
		User_Table user_table = new User_Table();
		user_table = session.selectOne("com.oracle.jmAuto.dto.Mapper.jm.findPw", user);
		return user_table;
	}

	// 임시 비밀번호 발급 
	@Override
	public void updateTempPw(String user_id, String hashedTempPw) {
		System.out.println("JmDaoImpl.updateTempPw start/////");

			User_Table user = new User_Table();
			
			user.setUser_id(user_id);
			user.setUser_pw(hashedTempPw);

			int updateTempPw = session.update("com.oracle.jmAuto.dto.Mapper.jm.updateTempPw", user);		

			if(updateTempPw > 0){
				System.out.println("JmDaoImpl.updateTempPw() update 성공*****");
			}else{
				System.out.println("JmDaoImpl.updateTempPw() update 실패*****");
			}

	}

	// NOTE : 사용자 이메일 정보 GET
	@Override
	public String getUserEmail(String user_id) {
		System.out.println("JmDaoImpl.getUserEmail start !!!!!!!");		

		String user_email = session.selectOne("com.oracle.jmAuto.dto.Mapper.jm.getUserEmail" , user_id);
		System.out.println("JmDaoImpl.getUserEmail [user_email] : " + user_email );
		
		return user_email;
	}
	
	
	// NOTE : 회원목록조회
	@Override
	public List<User_Table> selectUserList(int startIndex, int rowPage) {
		System.out.println("AdminDaoImpl.selectUserList() start...");
		
		// Map 객체 생성하여 파라미터 설정
	    Map<String, Integer> params = new HashMap<>();
	    params.put("startIndex", startIndex);
	    params.put("rowPage", rowPage);

	    // Mapper 호출 시 Map 전달
	    List<User_Table> userList = session.selectList("com.oracle.jmAuto.dto.Mapper.jm.selectUserList", params);

		//List<User_Table> userList = session.selectList("com.oracle.jmAuto.dto.Mapper.jm.selectUserList");

		return userList;
	}



	// NOTE : 회원 비활성화
	@Override
	public int userDeactive(String user_id) {

		int result = session.update("com.oracle.jmAuto.dto.Mapper.jm.userDeactive",user_id);
		
		return result;
	}


	// NOTE : 회원 활성화
	@Override
	public int userActive(String user_id) {
			int result = session.update("com.oracle.jmAuto.dto.Mapper.jm.userActive",user_id);
		
		return result;
	}



	// NOTE - 승인 요청 회원 목록 조회
	@Override
	public List<User_Table> selectApprovalUserList() {
		System.out.println("AdminDaoImpl.selectUserList() start...");
		List<User_Table> userList = session.selectList("com.oracle.jmAuto.dto.Mapper.jm.selectApprovalUserList");

		return userList;
	}


	// NOTE - 승인 요청 처리
	@Override
	public int userApprove(String user_id) {
		int result = session.update("com.oracle.jmAuto.dto.Mapper.jm.userApprove",user_id);
		
		
		return result;
	}



	// NOTE - 승인 요청 회원 상세 정보
	@Override
	public FullUserInfo userDetail(String user_id) {
		System.out.println("AdminDaoImpl.userDetail start...");
		
		FullUserInfo userInfo = session.selectOne("com.oracle.jmAuto.dto.Mapper.jm.userDetail",user_id);
		
		System.out.println("AdminDaoImpl.userDetail usesrInfo >>" + userInfo);


		return userInfo;
	}



	// NOTE - 관리자 추가
	@Override
	public int createManager(User_Table user) {
		System.out.println("AdminDaoImpl.createManager() start...");
		

		int result = session.insert("com.oracle.jmAuto.dto.Mapper.jm.createManager", user);

		System.out.println("AdminDaoImpl.createManager() result >>" + result);
		

		return result;
	}



	// NOTE - 회원 목록 검색
	@Override
	public List<User_Table> searchUserList(String keyword) {
		System.out.println("AdminDaoImpl.selectUserList() start...");
		List<User_Table> userList = session.selectList("com.oracle.jmAuto.dto.Mapper.jm.searchUserList",keyword);

		System.out.println("AdminDaoImpl.selectUserList() userList" + userList);

		return userList;
	}

	@Override
	public int userTotal() {
		System.out.println("AdminDaoImpl.userTotal() start...");
		
		int userTotal = session.selectOne("com.oracle.jmAuto.dto.Mapper.jm.userTotal");
		
		System.out.println("AdminDaoImpl.userTotal()  userTotal  ===>	" + userTotal);
		
		
		return userTotal;
	}

}
