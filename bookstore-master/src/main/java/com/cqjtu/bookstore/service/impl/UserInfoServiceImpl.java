package com.cqjtu.bookstore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqjtu.bookstore.bean.UserInfo;
import com.cqjtu.bookstore.dao.UserInfoDao;
import com.cqjtu.bookstore.service.UserInfoService;

@Service
public class UserInfoServiceImpl implements UserInfoService {

	@Autowired
	UserInfoDao userInfoDao;

	@Override
	public void userInfoEnroll(UserInfo userInfo) {
		userInfoDao.addUserInfo(userInfo);

	}

	@Override
	public void userInfoLogout(UserInfo userInfo) {
		userInfoDao.deleteUserInfo(userInfo);

	}

	@Override
	public void userInfoAlter(UserInfo userInfo) {
		userInfoDao.updateUserInfo(userInfo);

	}

	@Override
	public List<UserInfo> queryuserInfo(UserInfo userInfo) {
		return userInfoDao.queryUserInfo(userInfo);
	}

	@Override
	public long queryuserInfoCount(UserInfo userInfo) {
		return userInfoDao.queryUserInfoCount(userInfo);
	}

	@Override
	public List<UserInfo> queryuser(UserInfo userInfo) {
		return userInfoDao.queryUser(userInfo);
	}

}
