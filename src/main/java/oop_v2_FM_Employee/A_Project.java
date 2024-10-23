package oop_v2_FM_Employee;

public class A_Project {
	private String projectID;
	private String projectName;
	private String description;
	private String clientName;
	private String deadline;
	private String status;
	private String username;
	private String password;
	
	public A_Project(String projectID, String projectName, String description, String clientName, String deadline, String status, String username, String password) {
		this.projectID = projectID;
		this.projectName = projectName;
		this.description = description;
		this.clientName = clientName;
		this.deadline = deadline;
		this.status = status;
		this.username = username;
		this.password = password;		
	}

	// Getters and Setters
	public String getprojectID() {
        return projectID;
    }
	
	public void setProjectID(String projectID) {
		this.projectID = projectID;
	}
	
	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
