package com.oracle.jmAuto.service.ms;

import java.util.List;
import java.util.Map;

import com.oracle.jmAuto.dto.Car_General_Info;
import com.oracle.jmAuto.dto.Expert_Review;
import com.oracle.jmAuto.dto.Note;
import com.oracle.jmAuto.dto.Payment;
import com.oracle.jmAuto.dto.Qna;
import com.oracle.jmAuto.dto.Review;
import com.oracle.jmAuto.dto.User_Table;
import com.oracle.jmAuto.dto.Zzim;

import jakarta.servlet.http.HttpSession;

public interface MsService {
	List<Zzim> 				findZzim(String user_id);
	int 					PaymentUser();
	List<Payment> 			buyList(String user_id);
	String 					findByPw(String id);
	void 					userUpdate(User_Table user_table);
	List<Expert_Review> 	expertReviews(String user_id);
	List<Qna> 				QnaList(String user_id);
	int 					deleteQna(String user_id, List<Long> qnanum);
	Qna 					myQnaDetail(long qna_num, HttpSession session);
	Payment 				buyListDetail(String approval_num, String user_id);
	Expert_Review 			reviewDetail(String expert_num, String user_id);
	int 					deleteZzim(String user_id, List<Long> sell_num);
	long 					paymentselect(String user_id);
	int 					hoogiwrite(Map<String, Object> params);
	List<Review> 			myhoogi(String user_id);
	int 					hoogiDelete(String user_id, List<String> approval_num);
	List<Expert_Review> 	myExpertReview(String user_id);
	List<Expert_Review> 	myExpertReviewDetail(String user_id, long expert_review_num);
	List<Car_General_Info> 	sellCar(String user_id);
	List<Car_General_Info> 	sellWan(String user_id);
	List<Note> 				myNote(String user_id);
	Note 					myNoteDetail(String user_id, int note_num);
	int 					deleteNote(int note_num);
	int 					noteDabjang(Map<String, Object> params);
	
	

	
	

}

