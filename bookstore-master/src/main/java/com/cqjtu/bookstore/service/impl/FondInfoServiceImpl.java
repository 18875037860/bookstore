package com.cqjtu.bookstore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqjtu.bookstore.bean.FondInfo;
import com.cqjtu.bookstore.dao.FondInfoDao;
import com.cqjtu.bookstore.service.FondInfoService;

@Service
public class FondInfoServiceImpl implements FondInfoService {

	@Autowired
	FondInfoDao fondInfoDao;

	@Override
	public void concernFondInfo(FondInfo fondInfo) {
		fondInfoDao.addFondInfo(fondInfo);

	}

	@Override
	public void cancelFondInfo(FondInfo fondInfo) {
		fondInfoDao.deleteFondInfo(fondInfo);

	}

	@Override
	public List<FondInfo> queryFondInfo(FondInfo fondInfo) {
		return fondInfoDao.queryFondInfo(fondInfo);
	}

	@Override
	public long queryFondInfoCount(FondInfo fondInfo) {
		return fondInfoDao.queryFondInfoCount(fondInfo);
	}

}
