package com.cqjtu.bookstore.service;

import java.util.List;

import com.cqjtu.bookstore.bean.FondInfo;

public interface FondInfoService {

	/**
	 * 关注作者
	 * 
	 * @param fondInfo
	 */
	public void concernFondInfo(FondInfo fondInfo);

	/**
	 * 取消关注
	 * 
	 * @param fondInfo
	 */
	public void cancelFondInfo(FondInfo fondInfo);

	/**
	 * 检索关注信息
	 * 
	 * @param fondInfo
	 * @return
	 */
	public List<FondInfo> queryFondInfo(FondInfo fondInfo);

	/**
	 * 检索关注数量
	 * 
	 * @param fondInfo
	 * @return
	 */
	public long queryFondInfoCount(FondInfo fondInfo);
}
