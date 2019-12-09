package com.cqjtu.bookstore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqjtu.bookstore.bean.ChapterInfo;
import com.cqjtu.bookstore.dao.ChapterInfoDao;
import com.cqjtu.bookstore.service.ChapterInfoService;

@Service
public class ChapterInfoServiceImpl implements ChapterInfoService {

	@Autowired
	ChapterInfoDao chapterInfoDao;

	@Override
	public void chapterCreate(ChapterInfo chapterInfo) {
		chapterInfoDao.addChapterInfo(chapterInfo);
	}

	@Override
	public void chapterDelete(ChapterInfo chapterInfo) {
		chapterInfoDao.deleteChapterInfo(chapterInfo);
	}

	@Override
	public void chapterAlter(ChapterInfo chapterInfo) {
		chapterInfoDao.updateChapterInfo(chapterInfo);
	}

	@Override
	public List<ChapterInfo> queryChapterInfo(ChapterInfo chapterInfo) {
		return chapterInfoDao.queryChapterInfo(chapterInfo);
	}

	@Override
	public long queryChapterInfoCount(ChapterInfo chapterInfo) {
		return chapterInfoDao.queryChapterInfoCount(chapterInfo);
	}

}
