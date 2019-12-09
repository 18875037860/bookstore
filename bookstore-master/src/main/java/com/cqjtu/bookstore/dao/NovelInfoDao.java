package com.cqjtu.bookstore.dao;

import java.util.List;

import com.cqjtu.bookstore.bean.NovelInfo;

public interface NovelInfoDao {

	/**
	 * 添加小说信息
	 * 
	 * @param novelInfo
	 */
	public void addNovelInfo(NovelInfo novelInfo);

	/**
	 * 删除小说信息
	 * 
	 * @param novelInfo
	 */
	public void deleteNovelInfo(NovelInfo novelInfo);

	/**
	 * 更新小说信息
	 * 
	 * @param novelInfo
	 */
	public void updateNovelInfo(NovelInfo novelInfo);

	/**
	 * 查询小说信息
	 * 
	 * @param novelInfo
	 * @return
	 */
	public List<NovelInfo> queryNovelInfo(NovelInfo novelInfo);

	/**
	 * 查询小说数量
	 * 
	 * @param novelInfo
	 * @return
	 */
	public long queryNovelInfoCount(NovelInfo novelInfo);
}
