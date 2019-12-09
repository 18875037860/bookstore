package com.cqjtu.bookstore.bean;

import java.util.Date;
import java.util.List;

public class NovelInfo extends BaseBean {

	private String novelId;
	private String novelName;
	private String novelStyle;
	private String novelStatus;
	private String novelAttribute;
	private String novelSynopsis;
	private String novelLable;
	private String novelContent;
	private String novelImage;
	private Date createDate;
	private Date updateDate;
	private double novelGrade;
	private Integer novelCount;
	private Integer pageviewCount;
	private Integer collectionCount;
	private Integer praiseCount;
	private UserInfo authorInfo;
	private List<ChapterInfo> chapterInfo;

	public String getNovelId() {
		return novelId;
	}

	public void setNovelId(String novelId) {
		this.novelId = novelId;
	}

	public String getNovelName() {
		return novelName;
	}

	public void setNovelName(String novelName) {
		this.novelName = novelName;
	}

	public String getNovelStyle() {
		return novelStyle;
	}

	public void setNovelStyle(String novelStyle) {
		this.novelStyle = novelStyle;
	}

	public String getNovelStatus() {
		return novelStatus;
	}

	public void setNovelStatus(String novelStatus) {
		this.novelStatus = novelStatus;
	}

	public String getNovelAttribute() {
		return novelAttribute;
	}

	public void setNovelAttribute(String novelAttribute) {
		this.novelAttribute = novelAttribute;
	}

	public String getNovelSynopsis() {
		return novelSynopsis;
	}

	public void setNovelSynopsis(String novelSynopsis) {
		this.novelSynopsis = novelSynopsis;
	}

	public String getNovelLable() {
		return novelLable;
	}

	public void setNovelLable(String novelLable) {
		this.novelLable = novelLable;
	}

	public String getNovelContent() {
		return novelContent;
	}

	public void setNovelContent(String novelContent) {
		this.novelContent = novelContent;
	}

	public String getNovelImage() {
		return novelImage;
	}

	public void setNovelImage(String novelImage) {
		this.novelImage = novelImage;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public double getNovelGrade() {
		return novelGrade;
	}

	public void setNovelGrade(double novelGrade) {
		this.novelGrade = novelGrade;
	}

	public Integer getNovelCount() {
		return novelCount;
	}

	public void setNovelCount(Integer novelCount) {
		this.novelCount = novelCount;
	}

	public Integer getPageviewCount() {
		return pageviewCount;
	}

	public void setPageviewCount(Integer pageviewCount) {
		this.pageviewCount = pageviewCount;
	}

	public Integer getCollectionCount() {
		return collectionCount;
	}

	public void setCollectionCount(Integer collectionCount) {
		this.collectionCount = collectionCount;
	}

	public Integer getPraiseCount() {
		return praiseCount;
	}

	public void setPraiseCount(Integer praiseCount) {
		this.praiseCount = praiseCount;
	}

	public UserInfo getAuthorInfo() {
		return authorInfo;
	}

	public void setAuthorInfo(UserInfo authorInfo) {
		this.authorInfo = authorInfo;
	}

	public List<ChapterInfo> getChapterInfo() {
		return chapterInfo;
	}

	public void setChapterInfo(List<ChapterInfo> chapterInfo) {
		this.chapterInfo = chapterInfo;
	}

}
