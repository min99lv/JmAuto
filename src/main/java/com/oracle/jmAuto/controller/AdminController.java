package com.oracle.jmAuto.controller;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.jmAuto.dto.AllUser_Info;
import com.oracle.jmAuto.dto.User_Table;
import com.oracle.jmAuto.service.jm.AdminService;
import com.oracle.jmAuto.service.jm.EmailService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/view_ad")
public class AdminController {

	private final AdminService as;
	private final EmailService es;
	
	
	// NOTE : 회원 목록 조회
	@GetMapping(value = "/adminPage")
	public String adminPage(HttpSession session, Model model) {

		System.out.println("AdminController.adminPage() start...");

		User_Table user = (User_Table) session.getAttribute("user");

		// user가 null인지 확인하고, user_type이 'A'인지 확인
		if (user != null && "A".equals(user.getUser_type())) {

			List<User_Table> userList = as.selectUserList();

			System.out.println("AdminController.adminPage()  --> userList" + userList);

			model.addAttribute("userList", userList);
			// user_type이 'A'인 경우 관리자 페이지로 이동
			return "view_ad/adminPage";
		} else {
			// user가 없거나 user_type이 'A'가 아닌 경우 로그인 페이지로 리다이렉트
			return "view_jm/login";
		}
	}

	// NOTE : 사용자 계정 비활성화
	@GetMapping("/userDeactive")
	@ResponseBody
	public int userDeactive(@RequestParam("user_id") String user_id){
		System.out.println("AdminController.userDel() start...");
		System.out.println("AdminController.userDel() user_id ....>>"+ user_id);

		int result = as.userDeactive(user_id);
		
		return result;
	}
	@GetMapping("/userActive")
	@ResponseBody
	public int userActive(@RequestParam("user_id") String user_id){
		System.out.println("AdminController.userDel() start...");
		System.out.println("AdminController.userDel() user_id ....>>"+ user_id);
		
		int result = as.userActive(user_id);
		
		return result;
	}
	
	// NOTE : 사용자 계정 활성화
	@GetMapping("/userApprovalManagement")
	public String userApproval(Model model) {
		System.out.println("AdminController.userApproval start...");
		
		List<User_Table> userList = as.selectApprovalUser();
		System.out.println("AdminController.adminPage()  --> userList" + userList);

		model.addAttribute("userList", userList);
		
		return "view_ad/userApprovalMangement";

	}
	
	// NOTE : 판매자, 전문가 승인 요청 처리
	@GetMapping("/userApprove")
	@ResponseBody
	public int userApprove(@RequestParam("user_id") String user_id) {
		System.out.println("AdminController.userApprove start....");
		System.out.println("AdminController.userApprove user_id >>>"+ user_id);

		int result = as.userApprove(user_id);
		
		// 승인 처리 성공
		if(result > 0) {
			// 이메일 전송
		int sendResult = es.sendApproveMail(user_id);
			System.out.println("AdminController.userApprove 이메일 발송 결과 >>>" + sendResult);
			
		}
		
		System.out.println("AdminController.userApprove result >>>" + result);

		return result;
	}
	
	// NOTE : 승인 요청 유저 정보 상세 페이지
	@GetMapping(value = "/userDetail")
	public String userDetail(Model model, @RequestParam("user_id") String user_id ) {
		System.out.println("AdminController.userDetail start....");
		System.out.println("AdminController.userDetail user_id >>>>" + user_id);
		
		
		AllUser_Info userInfo = as.userDetail(user_id);

		System.out.println("AdminController.userDetail userInfo" + userInfo);
		
		model.addAttribute("userInfo",userInfo);
		
		return "view_ad/userDetail";
	}







}
