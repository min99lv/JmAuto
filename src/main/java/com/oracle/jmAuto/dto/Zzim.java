package com.oracle.jmAuto.dto;

import lombok.Data;

@Data
public class Zzim {
	
	private Long  	sell_num; 	//매물번호
	private String 	user_id;  	//구매자 아이디
	private int 	zzim_num; 	//구분번호


	private String 	model;		//차량모델 	
	private int 	price;		//차량가격
}

