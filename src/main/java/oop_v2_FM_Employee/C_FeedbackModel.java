package oop_v2_FM_Employee;

import java.sql.Date;

public class C_FeedbackModel {
	
	private int feedback_id;
	private String feedback;

	
	public C_FeedbackModel(int feedback_id,String feedback,Date feedback_date) {
		this.feedback_id=feedback_id;
		this.feedback=feedback;
	
	}

	public int getFeedback_id() {
		return feedback_id;
	}

	public void setFeedback_id(int feedback_id) {
		this.feedback_id = feedback_id;
	}

	public String getFeedback() {
		return feedback;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}


	
	

}
