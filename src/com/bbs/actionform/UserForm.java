package com.bbs.actionform;

public class UserForm {
	private String id;
	private String userName;
	private String oldPassword;
	private String userPassword;
	private String aginPassword;
	private String userFace = "user0.gif";
	private String userSex = "男";
	private String userEmail;
	private String userFrom;
	private String userAble;
	private String userPs;

	public String getUserPs() {
		return userPs;
	}

	public void setUserPs(String userPs) {
		this.userPs = userPs;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserFrom() {
		return userFrom;
	}

	public void setUserFrom(String userFrom) {
		this.userFrom = userFrom;
	}

	public String getUserSex() {
		return userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getAginPassword() {
		return aginPassword;
	}

	public void setAginPassword(String aginPassword) {
		this.aginPassword = aginPassword;
	}

	public void setUserAble(String userAble) {
		this.userAble = userAble;
	}

	public String getUserAble() {
		return userAble;
	}

	public String getUserFace() {
		return userFace;
	}

	public void setUserFace(String userFace) {
		this.userFace = userFace;
	}

	public String getSubUserFrom(int len) {
		if (len <= 0 || len > this.userFrom.length())
			len = this.userFrom.length();
		return this.userFrom.substring(0, len) + "..";
	}
}
