package com.cqjtu.bookstore.dao;

import java.util.List;

import com.cqjtu.bookstore.bean.BookShelfInfo;

public interface BookShelfInfoDao {

	/**
	 * 添加用户信息
	 * 
	 * @param bookShelfInfo
	 */
	public void addBookshelfInfo(BookShelfInfo bookShelfInfo);

	/**
	 * 删除用户信息
	 * 
	 * @param bookShelfInfo
	 */
	public void deleteBookshelfInfo(BookShelfInfo bookShelfInfo);

	/**
	 * 更新用户信息
	 * 
	 * @param bookShelfInfo
	 */
	public void updateBookshelfInfo(BookShelfInfo bookShelfInfo);

	/**
	 * 查询用户信息
	 * 
	 * @param bookShelfInfo
	 * @return
	 */
	public List<BookShelfInfo> queryBookShelfInfo(BookShelfInfo bookShelfInfo);

	/**
	 * 查询用户数量
	 * 
	 * @param bookShelfInfo
	 * @return
	 */
	public long queryBookShelfInfoCount(BookShelfInfo bookShelfInfo);
}
