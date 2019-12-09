package com.cqjtu.bookstore.bean;

import java.util.Date;
import java.util.List;

public class UserInfo extends BaseBean {

	private String userId;
	private String userName;
	private String userTele;
	private String userEmail;
	private String userPassword;
	private String userAvatar;
	private String userVip;
	private Date enrollDate;
	private Date vipDate;
	private List<NovelInfo> novelInfo;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserTele() {
		return userTele;
	}

	public void setUserTele(String userTele) {
		this.userTele = userTele;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserAvatar() {
		return userAvatar;
	}

	public void setUserAvatar(String userAvatar) {
		this.userAvatar = userAvatar;
	}

	public String getUserVip() {
		return userVip;
	}

	public void setUserVip(String userVip) {
		this.userVip = userVip;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getVipDate() {
		return vipDate;
	}

	public void setVipDate(Date vipDate) {
		this.vipDate = vipDate;
	}

	public List<NovelInfo> getNovelInfo() {
		return novelInfo;
	}

	public void setNovelInfo(List<NovelInfo> novelInfo) {
		this.novelInfo = novelInfo;
	}

}
