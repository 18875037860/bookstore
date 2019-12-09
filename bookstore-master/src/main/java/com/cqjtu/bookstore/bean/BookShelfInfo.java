package com.cqjtu.bookstore.bean;

public class BookShelfInfo {

	private String bookshelfId;
	private Integer readLog;
	private UserInfo userInfo;
	private NovelInfo novelInfo;

	public String getBookshelfId() {
		return bookshelfId;
	}

	public void setBookshelfId(String bookshelfId) {
		this.bookshelfId = bookshelfId;
	}

	public Integer getReadLog() {
		return readLog;
	}

	public void setReadLog(Integer readLog) {
		this.readLog = readLog;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public NovelInfo getNovelInfo() {
		return novelInfo;
	}

	public void setNovelInfo(NovelInfo novelInfo) {
		this.novelInfo = novelInfo;
	}

}
