package oop_v2_FM_Employee;

import java.sql.Date;

public class C_EmployeeModel {
	private int leave_id;
	private String employee_id;
	private String leave_type;
	private Date start_date;
	private Date end_date;
	private String reason;
	private String approval_status;
	
	public C_EmployeeModel(int leave_id, String employee_id, String leave_type, Date start_date, Date end_date,
			String reason, String approval_status) {
		super();
		this.leave_id = leave_id;
		this.employee_id = employee_id;
		this.leave_type = leave_type;
		this.start_date = start_date;
		this.end_date = end_date;
		this.reason = reason;
		this.approval_status = approval_status;
	}

	public int getLeave_id() {
		return leave_id;
	}

	public void setLeave_id(int leave_id) {
		this.leave_id = leave_id;
	}

	public String getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}

	public String getLeave_type() {
		return leave_type;
	}

	public void setLeave_type(String leave_type) {
		this.leave_type = leave_type;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getApproval_status() {
		return approval_status;
	}

	public void setApproval_status(String approval_status) {
		this.approval_status = approval_status;
	}
	
	
	}

