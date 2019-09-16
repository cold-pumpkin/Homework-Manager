
package com.NtoS.myapp.model;

//import java.sql.Date;

public class MemberVO {
	
	private String email;
	private String memberName;
	private String memberDepart;
	private String password;
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	/*
	private String homeworkTitle;
	private Date fileUploadDate;
	private String writingTitle;
	private Date writingUploadDate;
	*/
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberDepart() {
		return memberDepart;
	}
	public void setMemberDepart(String memberDepart) {
		this.memberDepart = memberDepart;
	}
	/*
	public String getWritingTitle() {
		return writingTitle;
	}
	public void setWritingTitle(String writingTitle) {
		this.writingTitle = writingTitle;
	}
	public String getHomeworkTitle() {
		return homeworkTitle;
	}
	public void setHomeworkTitle(String homeworkTitle) {
		this.homeworkTitle = homeworkTitle;
	}
	public Date getFileUploadDate() {
		return fileUploadDate;
	}
	public void setFileUploadDate(Date fileUploadDate) {
		this.fileUploadDate = fileUploadDate;
	}
	public Date getWritingUploadDate() {
		return writingUploadDate;
	}
	public void setWritingUploadDate(Date writingUploadDate) {
		this.writingUploadDate = writingUploadDate;
	}
	*/
	/*
	@Override
	public String toString() {
		return "MemberVO [email=" + email + ", memberName=" + memberName + ", memberDepart=" + memberDepart
				+ ", writingTitle=" + writingTitle + ", homworkTitle=" + homeworkTitle + ", fileUploadDate="
				+ fileUploadDate + ", writingUploadDate=" + writingUploadDate + "]";
	}*/
	
	@Override
	public String toString() {
		return "MemberVO [email=" + email + ", memberName=" + memberName + ", memberDepart=" + memberDepart +", password=" + password+ "]";
	}
	
}
