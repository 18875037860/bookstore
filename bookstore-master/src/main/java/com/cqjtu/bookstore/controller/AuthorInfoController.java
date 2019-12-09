package com.cqjtu.bookstore.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.cqjtu.bookstore.bean.ChapterInfo;
import com.cqjtu.bookstore.bean.NovelInfo;
import com.cqjtu.bookstore.bean.UserInfo;
import com.cqjtu.bookstore.service.ChapterInfoService;
import com.cqjtu.bookstore.service.NovelInfoService;
import com.cqjtu.bookstore.service.UserInfoService;

@Controller
@RequestMapping("/author")
public class AuthorInfoController {

	@Autowired
	UserInfoService userInfoService;
	@Autowired
	NovelInfoService novelInfoService;
	@Autowired
	ChapterInfoService chapterInfoService;

	@RequestMapping("/moyun")
	public String mynoveltable(HttpServletRequest request) {

		UserInfo userInfo = (UserInfo) request.getSession().getAttribute("user");
		List<NovelInfo> allNovels = userInfoService.queryuserInfo(userInfo).get(0).getNovelInfo();
		request.setAttribute("novels", allNovels);
		return "novellist";
	}

	@RequestMapping("/newchapter")
	public String MyNovelList(HttpServletRequest request) {

		UserInfo userInfo = (UserInfo) request.getSession().getAttribute("user");
		List<NovelInfo> allNovels = userInfoService.queryuserInfo(userInfo).get(0).getNovelInfo();
		request.setAttribute("novels", allNovels);
		return "newchapter";
	}

	@RequestMapping("/noveldetails")
	public String MynovelDetails(String novelId, HttpServletRequest request) {
		NovelInfo novelInfo = new NovelInfo();
		novelInfo.setNovelId(novelId);
		NovelInfo novel = novelInfoService.queryNovelInfo(novelInfo).get(0);
		request.setAttribute("noveldetails", novel);
		return "bookinfo";
	}

	@RequestMapping("/updatenovel")
	public String Update_novel(HttpServletRequest request, NovelInfo novel,
			MultipartFile file) {/* HttpServletRequest request, NovelInfo novel, MultipartFile file */
		try {
			/*
			 * String newpic = "pic" + file.getOriginalFilename(); File newpicfile = new
			 * File("E://novelimsge", newpic); newpicfile.getParentFile().mkdirs();
			 * file.transferTo(newpicfile); novel.setNovelImage("E://novelimage" + newpic);
			 */
			NovelInfo novelInfo = new NovelInfo();
			novelInfo.setNovelId(novel.getNovelId());
			novelInfo = novelInfoService.queryNovelInfo(novelInfo).get(0);
			novelInfo.setNovelName(novel.getNovelName());
			novelInfo.setNovelStyle(novel.getNovelStyle());
			novelInfo.setNovelStatus(novel.getNovelStatus());
			novelInfo.setNovelAttribute(novel.getNovelAttribute());
			novelInfo.setNovelSynopsis(novel.getNovelSynopsis());
			novelInfoService.novelAlter(novelInfo);
			UserInfo userInfo = (UserInfo) request.getSession().getAttribute("user");
			List<NovelInfo> allNovels = userInfoService.queryuserInfo(userInfo).get(0).getNovelInfo();
			request.setAttribute("novels", allNovels);
			return "novellist";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}

	}

	@RequestMapping("/newnovel")
	public String create_novel(NovelInfo novelInfo, HttpServletRequest request) {
		NovelInfo Findname = new NovelInfo();
		Findname.setNovelName(novelInfo.getNovelName());
		long count = novelInfoService.queryNovelInfoCount(Findname);
		if (count == 0) {
			Date date = new Date();
			novelInfo.setCreateDate(date);

			String SetNovelId = String
					.valueOf(Math.abs((novelInfo.getNovelName() + novelInfo.getCreateDate().toString()).hashCode()))
					+ Math.round(Math.random() * 100);
			String filePath = "E://chaptercontent//" + SetNovelId;
			novelInfo.setNovelId(SetNovelId);

			File FilePath = null;
			FilePath = new File(filePath);
			try {
				if (!FilePath.exists())
					FilePath.mkdir();
			} catch (Exception e) {
				e.printStackTrace();
			}

			novelInfo.setNovelContent(filePath);
			novelInfo.setNovelGrade(0);
			novelInfo.setNovelCount(0);
			novelInfo.setCollectionCount(0);
			novelInfo.setPraiseCount(0);
			novelInfo.setPageviewCount(0);
			novelInfo.setNovelStatus("连载");

			UserInfo userInfo = (UserInfo) request.getSession().getAttribute("user");
			novelInfo.setAuthorInfo(userInfo);
			novelInfoService.novelCreate(novelInfo);

			List<NovelInfo> allNovels = new ArrayList<>();
			allNovels = userInfoService.queryuserInfo(userInfo).get(0).getNovelInfo();
			request.setAttribute("novels", allNovels);

			return "novellist";
		} else {

			return "error";
		}
	}

	@RequestMapping("/uploadchapter")
	public String saveAsNewChapter(ChapterInfo chapter, HttpServletRequest request) {
		try {

			NovelInfo novelInfo = new NovelInfo();
			novelInfo.setNovelName(chapter.getNovelInfo().getNovelName());
			novelInfo = novelInfoService.queryNovelInfo(novelInfo).get(0);
			int count = chapter.getChapterContent().length();
			int newchapindex = 0;
			if (novelInfo.getChapterInfo().get(0).getChapterId() == null) {
				newchapindex = 1;
			} else {
				newchapindex = novelInfo.getChapterInfo().size() + 1;
			}
			String filePath = novelInfo.getNovelContent() + "//" + newchapindex + ".txt";
			File f = null;
			f = new File(filePath);
			try {
				if (!f.exists())
					f.createNewFile();
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				BufferedWriter output = new BufferedWriter(new FileWriter(f));
				output.write(chapter.getChapterContent());
				output.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			Date date = new Date();

			chapter.setChapterIndex(newchapindex);
			chapter.setCreateDate(date);
			chapter.setChapterId(String.valueOf(Math.abs((chapter.getChapterName() + date.toString()).hashCode()))
					+ Math.round(Math.random() * 100));
			chapter.setChapterContent(filePath);

			chapter.setChapterCount(count);
			novelInfo.setNovelCount(novelInfo.getNovelCount() + count);
			novelInfo.setUpdateDate(date);
			novelInfoService.novelAlter(novelInfo);
			chapter.setNovelInfo(novelInfo);
			chapterInfoService.chapterCreate(chapter);

			List<NovelInfo> allNovels = new ArrayList<>();
			UserInfo userInfo = (UserInfo) request.getSession().getAttribute("user");
			allNovels = userInfoService.queryuserInfo(userInfo).get(0).getNovelInfo();
			request.setAttribute("novels", allNovels);

			return "newchapter";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
}
