package com.oracle.jmAuto.controller;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.jmAuto.dto.User_Table;
import com.oracle.jmAuto.service.jm.AdminService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/view_ad")
public class AdminController {
	
	private final AdminService as;
	
	
	@GetMapping(value="/adminPage")
	public String adminPage(HttpSession session, Model model) {

		System.out.println("AdminController.adminPage() start...");
		
		User_Table user = (User_Table)session.getAttribute("user");
		
		// user가 null인지 확인하고, user_type이 'A'인지 확인
		if (user != null && "A".equals(user.getUser_type())) {
			
			List <User_Table> userList = as.selectUserList();

			System.out.println("AdminController.adminPage()  --> userList" + userList);

			model.addAttribute("userList", userList);
			// user_type이 'A'인 경우 관리자 페이지로 이동
			return "view_ad/adminPage";
		} else {
			// user가 없거나 user_type이 'A'가 아닌 경우 로그인 페이지로 리다이렉트
			return "view_jm/login";
		}
	}


}
