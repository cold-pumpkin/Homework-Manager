package com.NtoS.myapp.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.Arrays;

public class HomeworkVO {
	private int fileId;
	private String directoryName;
	private String fileName;
	private long fileSize;
	private String fileContentType;
	private Timestamp fileUploadDate;
	private byte[] fileData;
	private String email;
	private String homeworkTitle;
	private Date submitDate; 
	public Date getSubmitDate() {
		return submitDate;
	}
	public void setSubmitDate(Date submitDate) {
		this.submitDate = submitDate;
	}
	public int getFileId() {
		return fileId;
	}
	public void setFileId(int fileId) {
		this.fileId = fileId;
	}
	public String getDirectoryName() {
		return directoryName;
	}
	public void setDirectoryName(String directoryName) {
		this.directoryName = directoryName;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	public Timestamp getFileUploadDate() {
		return fileUploadDate;
	}
	public void setFileUploadDate(Timestamp fileUploadDate) {
		this.fileUploadDate = fileUploadDate;
	}
	public byte[] getFileData() {
		return fileData;
	}
	public void setFileData(byte[] fileData) {
		this.fileData = fileData;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHomeworkTitle() {
		return homeworkTitle;
	}
	public void setHomeworkTitle(String homeworkTitle) {
		this.homeworkTitle = homeworkTitle;
	}
	@Override
	public String toString() {
		return "HomeworkVO [fileId=" + fileId + ", directoryName=" + directoryName + ", fileName=" + fileName
				+ ", fileSize=" + fileSize + ", fileContentType=" + fileContentType + ", fileUploadDate="
				+ fileUploadDate + ", fileData=" + Arrays.toString(fileData) + ", email="
				+ email + ", homeworkTitle=" + homeworkTitle +", submitDate=" + submitDate + "]";
	}
	
	
}
