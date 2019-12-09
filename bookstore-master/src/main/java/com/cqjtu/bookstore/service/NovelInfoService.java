package com.cqjtu.bookstore.service;

import java.util.List;

import com.cqjtu.bookstore.bean.NovelInfo;

public interface NovelInfoService {

	public void novelCreate(NovelInfo novelInfo);

	public void novelDelete(NovelInfo novelInfo);

	public void novelAlter(NovelInfo novelInfo);

	public List<NovelInfo> queryNovelInfo(NovelInfo novelInfo);

	public long queryNovelInfoCount(NovelInfo novelInfo);
}
