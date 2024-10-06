package com.oracle.jmAuto.dao.jm;

import java.util.List;

import com.oracle.jmAuto.dto.User_Table;

public interface AdminDao {

    List<User_Table> selectUserList();

}
