package com.cqjtu.bookstore.service;

import java.util.List;

import com.cqjtu.bookstore.bean.ChapterInfo;

public interface ChapterInfoService {

	public void chapterCreate(ChapterInfo chapterInfo);

	public void chapterDelete(ChapterInfo chapterInfo);

	public void chapterAlter(ChapterInfo chapterInfo);

	public List<ChapterInfo> queryChapterInfo(ChapterInfo chapterInfo);

	public long queryChapterInfoCount(ChapterInfo chapterInfo);
}
