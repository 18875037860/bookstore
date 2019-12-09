package com.cqjtu.bookstore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqjtu.bookstore.bean.BookShelfInfo;
import com.cqjtu.bookstore.dao.BookShelfInfoDao;
import com.cqjtu.bookstore.service.BookShelfInfoService;

@Service
public class BookShelfInfoServiceImpl implements BookShelfInfoService {

	@Autowired
	BookShelfInfoDao bookShelfInfoDao;

	@Override
	public void addBookShelfInfo(BookShelfInfo bookShelfInfo) {
		bookShelfInfoDao.addBookshelfInfo(bookShelfInfo);

	}

	@Override
	public void cancelBookShelfInfo(BookShelfInfo bookShelfInfo) {
		bookShelfInfoDao.deleteBookshelfInfo(bookShelfInfo);

	}

	@Override
	public void BookShelfInfoAlter(BookShelfInfo bookShelfInfo) {
		bookShelfInfoDao.updateBookshelfInfo(bookShelfInfo);
	}

	@Override
	public List<BookShelfInfo> queryBookShelfInfo(BookShelfInfo bookShelfInfo) {
		return bookShelfInfoDao.queryBookShelfInfo(bookShelfInfo);
	}

	@Override
	public long queryBookShelfInfoCount(BookShelfInfo bookShelfInfo) {
		return bookShelfInfoDao.queryBookShelfInfoCount(bookShelfInfo);
	}

}
