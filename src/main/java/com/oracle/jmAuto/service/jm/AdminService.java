package com.oracle.jmAuto.service.jm;

import java.util.List;

import com.oracle.jmAuto.dto.AllUser_Info;
import com.oracle.jmAuto.dto.User_Table;

public interface AdminService {

    List<User_Table> selectUserList();

    int userDeactive(String user_id);

	int userActive(String user_id);

	List<User_Table> selectApprovalUser();

	int userApprove(String user_id);

	AllUser_Info userDetail(String user_id);

    int createManager(User_Table user);

    List<User_Table> searchUserList(String keyword);
    

}
