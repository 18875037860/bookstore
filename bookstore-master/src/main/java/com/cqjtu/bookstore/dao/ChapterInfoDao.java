package com.cqjtu.bookstore.dao;

import java.util.List;

import com.cqjtu.bookstore.bean.ChapterInfo;

public interface ChapterInfoDao {

	/**
	 * 添加章节信息
	 * 
	 * @param chapterInfo
	 */
	public void addChapterInfo(ChapterInfo chapterInfo);

	/**
	 * 删除章节信息
	 * 
	 * @param chapterInfo
	 */
	public void deleteChapterInfo(ChapterInfo chapterInfo);

	/**
	 * 更新章节信息
	 * 
	 * @param chapterInfo
	 */
	public void updateChapterInfo(ChapterInfo chapterInfo);

	/**
	 * 查询章节信息
	 * 
	 * @param chapterInfo
	 * @return
	 */
	public List<ChapterInfo> queryChapterInfo(ChapterInfo chapterInfo);

	/**
	 * 查询章节数量
	 * 
	 * @param chapterInfo
	 * @return
	 */
	public long queryChapterInfoCount(ChapterInfo chapterInfo);
}
