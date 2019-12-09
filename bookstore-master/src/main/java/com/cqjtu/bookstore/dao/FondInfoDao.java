package com.cqjtu.bookstore.dao;

import java.util.List;

import com.cqjtu.bookstore.bean.FondInfo;

public interface FondInfoDao {

	/**
	 * 添加关注信息
	 * 
	 * @param fondInfoDao
	 */
	public void addFondInfo(FondInfo fondInfo);

	/**
	 * 删除关注信息
	 * 
	 * @param fondInfoDao
	 */
	public void deleteFondInfo(FondInfo fondInfo);

	/**
	 * 查询关注信息
	 * 
	 * @param fondInfoDao
	 * @return
	 */
	public List<FondInfo> queryFondInfo(FondInfo fondInfo);

	/**
	 * 查询关注数量
	 * 
	 * @param fondInfoDao
	 * @return
	 */
	public long queryFondInfoCount(FondInfo fondInfo);
}
