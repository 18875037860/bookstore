package com.cqjtu.bookstore.service;

import java.util.List;

import com.cqjtu.bookstore.bean.UserInfo;

public interface UserInfoService {

	/**
	 * 注册用户
	 * 
	 * @param userInfo
	 */
	public void userInfoEnroll(UserInfo userInfo);

	/**
	 * 注销用户
	 * 
	 * @param userInfo
	 */
	public void userInfoLogout(UserInfo userInfo);

	/**
	 * 修改密码、昵称、手机号、邮箱等用户信息
	 * 
	 * @param userInfo
	 */
	public void userInfoAlter(UserInfo userInfo);

	/**
	 * 检索用户信息
	 * 
	 * @param userInfo
	 * @return
	 */
	public List<UserInfo> queryuserInfo(UserInfo userInfo);

	/**
	 * 检索用户数量
	 * 
	 * @param userInfo
	 * @return
	 */
	public long queryuserInfoCount(UserInfo userInfo);

	public List<UserInfo> queryuser(UserInfo userInfo);
}
