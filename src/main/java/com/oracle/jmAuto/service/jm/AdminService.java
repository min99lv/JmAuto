package com.oracle.jmAuto.service.jm;

import java.util.List;

import com.oracle.jmAuto.dto.User_Table;

public interface AdminService {

    List<User_Table> selectUserList();
    

}
