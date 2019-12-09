package com.cqjtu.bookstore.service;

import java.util.List;

import com.cqjtu.bookstore.bean.BookShelfInfo;

public interface BookShelfInfoService {

	/**
	 * 添加收藏
	 * 
	 * @param bookShelfInfo
	 */
	public void addBookShelfInfo(BookShelfInfo bookShelfInfo);

	/**
	 * 取消收藏
	 * 
	 * @param bookShelfInfo
	 */
	public void cancelBookShelfInfo(BookShelfInfo bookShelfInfo);

	/**
	 * 更改最后阅读章数
	 * 
	 * @param bookShelfInfo
	 */
	public void BookShelfInfoAlter(BookShelfInfo bookShelfInfo);

	/**
	 * 检索收藏信息
	 * 
	 * @param bookShelfInfo
	 * @return
	 */
	public List<BookShelfInfo> queryBookShelfInfo(BookShelfInfo bookShelfInfo);

	/**
	 * 检索收藏数量
	 * 
	 * @param bookShelfInfo
	 * @return
	 */
	public long queryBookShelfInfoCount(BookShelfInfo bookShelfInfo);
}
