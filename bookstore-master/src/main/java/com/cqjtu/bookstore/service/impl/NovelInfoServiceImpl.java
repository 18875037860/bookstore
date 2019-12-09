package com.cqjtu.bookstore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqjtu.bookstore.bean.NovelInfo;
import com.cqjtu.bookstore.dao.NovelInfoDao;
import com.cqjtu.bookstore.service.NovelInfoService;

@Service
public class NovelInfoServiceImpl implements NovelInfoService {

	@Autowired
	NovelInfoDao novelInfoDao;

	@Override
	public void novelCreate(NovelInfo novelInfo) {
		novelInfoDao.addNovelInfo(novelInfo);
	}

	@Override
	public void novelDelete(NovelInfo novelInfo) {
		novelInfoDao.deleteNovelInfo(novelInfo);
	}

	@Override
	public void novelAlter(NovelInfo novelInfo) {
		novelInfoDao.updateNovelInfo(novelInfo);
	}

	@Override
	public List<NovelInfo> queryNovelInfo(NovelInfo novelInfo) {
		return novelInfoDao.queryNovelInfo(novelInfo);
	}

	@Override
	public long queryNovelInfoCount(NovelInfo novelInfo) {
		return novelInfoDao.queryNovelInfoCount(novelInfo);
	}

}
