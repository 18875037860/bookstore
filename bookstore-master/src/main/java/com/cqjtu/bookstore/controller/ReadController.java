package com.cqjtu.bookstore.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cqjtu.bookstore.bean.BookShelfInfo;
import com.cqjtu.bookstore.bean.ChapterInfo;
import com.cqjtu.bookstore.bean.NovelInfo;
import com.cqjtu.bookstore.bean.UserInfo;
import com.cqjtu.bookstore.service.BookShelfInfoService;
import com.cqjtu.bookstore.service.ChapterInfoService;
import com.cqjtu.bookstore.service.NovelInfoService;
import com.cqjtu.bookstore.service.UserInfoService;

@Controller
@RequestMapping("/home")
public class ReadController {

	@Autowired
	UserInfoService userInfoService;

	@Autowired
	NovelInfoService novelInfoService;

	@Autowired
	ChapterInfoService chapterInfoService;

	@Autowired
	BookShelfInfoService bookShelfInfoService;

	@RequestMapping("/read")
	public String readBook(HttpServletRequest request, ChapterInfo ci) throws IOException {
		ChapterInfo chapterInfo = new ChapterInfo();

		UserInfo userInfo = (UserInfo) request.getSession().getAttribute("user");
		NovelInfo novelInfo = new NovelInfo();
		novelInfo.setNovelId(ci.getNovelInfo().getNovelId());
		novelInfo = novelInfoService.queryNovelInfo(novelInfo).get(0);
		BookShelfInfo bookShelfInfo = new BookShelfInfo();
		bookShelfInfo.setUserInfo(userInfo);
		bookShelfInfo.setNovelInfo(novelInfo);
		if (bookShelfInfoService.queryBookShelfInfoCount(bookShelfInfo) > 0) {
			bookShelfInfo = bookShelfInfoService.queryBookShelfInfo(bookShelfInfo).get(0);
			bookShelfInfo.setReadLog(ci.getChapterIndex());
			bookShelfInfoService.BookShelfInfoAlter(bookShelfInfo);
		}

		int chapter_index = ci.getChapterIndex();
		if (chapter_index == 0) {
			chapter_index = 1;
		} else if (chapter_index == (novelInfo.getChapterInfo().size() + 1)) {
			chapter_index = chapter_index - 1;
		}
		chapterInfo = novelInfo.getChapterInfo().get(chapter_index - 1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		request.setAttribute("novel", novelInfo);
		request.setAttribute("chapter", chapterInfo);
		request.setAttribute("date", sdf.format(chapterInfo.getCreateDate()));

		File file = new File(chapterInfo.getChapterContent());
//		File file = new File("E:/chaptercontent/6456456456/1.txt");
		StringBuilder localStrBulider = new StringBuilder();
		if (file.isFile() && file.exists()) {
			try {
				InputStreamReader inputStreamReader0 = new InputStreamReader(new FileInputStream(file), "gbk");
				InputStreamReader inputStreamReader1 = new InputStreamReader(new FileInputStream(file), "utf8");
				BufferedReader bufferReader0 = new BufferedReader(inputStreamReader0);
				BufferedReader bufferReader1 = new BufferedReader(inputStreamReader1);
				BufferedReader bufferReader = null;
				if (isMessyCode(bufferReader0.readLine())) {
					bufferReader = bufferReader1;
				} else {
					bufferReader = bufferReader0;
				}
				String lineStr = null;
				try {
					while ((lineStr = bufferReader.readLine()) != null) {
						localStrBulider.append(lineStr);
					}
					bufferReader.close();
					bufferReader0.close();
					bufferReader1.close();
					inputStreamReader0.close();
					inputStreamReader1.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
		} else {
		}
		request.setAttribute("text", localStrBulider.toString());

		/*
		 * String encoding = "UTF-8"; File file1 = new
		 * File(chapterInfo.getChapterContent()); Long filelength = file1.length();
		 * byte[] filecontent = new byte[filelength.intValue()]; try { FileInputStream
		 * in = new FileInputStream(file); in.read(filecontent); in.close(); } catch
		 * (FileNotFoundException e) { e.printStackTrace(); } catch (IOException e) {
		 * e.printStackTrace(); } try { System.out.println(new String(filecontent,
		 * encoding)); } catch (UnsupportedEncodingException e) {
		 * System.err.println("The OS does not support " + encoding);
		 * e.printStackTrace(); }
		 */

		return "read";
	}

	@RequestMapping("/synopsis")
	public String bookView(HttpServletRequest request, NovelInfo no) {
		no.setNovelId(no.getNovelId());
		UserInfo us = (UserInfo) request.getSession().getAttribute("user");
		int readLog = 1;
		BookShelfInfo bookShelfInfo = new BookShelfInfo();
		if (us == null) {
			us = new UserInfo();
			us.setUserId("000000000");
		}
		bookShelfInfo.setUserInfo(us);
		bookShelfInfo.setNovelInfo(no);
		List<BookShelfInfo> bs = bookShelfInfoService.queryBookShelfInfo(bookShelfInfo);
		if (bs.size() > 0) {
			readLog = bs.get(0).getReadLog();
		}
		request.setAttribute("readlog", readLog);
		if (bs.size() > 0) {
			String str = "取消收藏";
			request.setAttribute("bkslf", str);
		} else {
			String str1 = "添加收藏";
			request.setAttribute("bkslf", str1);
		}

		no = novelInfoService.queryNovelInfo(no).get(0);
		request.setAttribute("novel", no);
		List<ChapterInfo> chapterInfos = no.getChapterInfo();
		request.setAttribute("chapter", chapterInfos);
		ChapterInfo chapterInfo = new ChapterInfo();
		chapterInfo.setNovelInfo(no);
		long a = chapterInfoService.queryChapterInfoCount(chapterInfo);
		request.setAttribute("sumChapter", a);
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
		request.setAttribute("date1", sdf.format(no.getCreateDate()));

		int sumNovel = userInfoService.queryuserInfo(no.getAuthorInfo()).get(0).getNovelInfo().size();
		request.setAttribute("sumnovel", sumNovel);

		int sumCharacter = 0;
		for (int i = 0; i < sumNovel; i++) {
			sumCharacter = sumCharacter
					+ userInfoService.queryuserInfo(no.getAuthorInfo()).get(0).getNovelInfo().get(i).getNovelCount();
		}
		request.setAttribute("sumcharacter", sumCharacter);

		return "synopsis";
	}

	@RequestMapping("/vote")
	public String bookVote(HttpServletRequest request, NovelInfo no) {
		UserInfo us = (UserInfo) request.getSession().getAttribute("user");
		int readLog = 1;
		BookShelfInfo bookShelfInfo = new BookShelfInfo();
		if (us == null) {
			us = new UserInfo();
			us.setUserId("000000000");
		}
		bookShelfInfo.setUserInfo(us);
		bookShelfInfo.setNovelInfo(no);
		List<BookShelfInfo> bk = bookShelfInfoService.queryBookShelfInfo(bookShelfInfo);
		if (bk.size() > 0) {
			readLog = bk.get(0).getReadLog();
		}
		request.setAttribute("readlog", readLog);
		if (bk.size() > 0) {
			String str = "取消收藏";
			request.setAttribute("bkslf", str);
		} else {
			String str1 = "添加收藏";
			request.setAttribute("bkslf", str1);
		}

		no = novelInfoService.queryNovelInfo(no).get(0);
		no.setPraiseCount(no.getPraiseCount() + 1);
		novelInfoService.novelAlter(no);
		no = novelInfoService.queryNovelInfo(no).get(0);
		request.setAttribute("novel", no);
		List<ChapterInfo> chapterInfos = no.getChapterInfo();
		request.setAttribute("chapter", chapterInfos);
		ChapterInfo chapterInfo = new ChapterInfo();
		chapterInfo.setNovelInfo(no);
		long a = chapterInfoService.queryChapterInfoCount(chapterInfo);
		request.setAttribute("sumChapter", a);

		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
		request.setAttribute("date1", sdf.format(no.getCreateDate()));
		int sumNovel = userInfoService.queryuserInfo(no.getAuthorInfo()).get(0).getNovelInfo().size();
		request.setAttribute("sumnovel", sumNovel);
		int sumCharacter = 0;
		for (int i = 0; i < sumNovel; i++) {
			sumCharacter = sumCharacter
					+ userInfoService.queryuserInfo(no.getAuthorInfo()).get(0).getNovelInfo().get(i).getNovelCount();
		}
		request.setAttribute("sumcharacter", sumCharacter);

		return "synopsis";
	}

	@RequestMapping("/collect")
	public String bookCollect(HttpServletRequest request, NovelInfo no) {

		UserInfo us = (UserInfo) request.getSession().getAttribute("user");
		BookShelfInfo bookShelfInfo = new BookShelfInfo();
		if (us == null) {
			us = new UserInfo();
			us.setUserId("000000000");
		}
		bookShelfInfo.setUserInfo(us);
		bookShelfInfo.setNovelInfo(no);
		List<BookShelfInfo> bk = bookShelfInfoService.queryBookShelfInfo(bookShelfInfo);
		if (bk.size() > 0) {
			String str = "添加收藏";
			request.setAttribute("bkslf", str);
			bookShelfInfoService.cancelBookShelfInfo(bk.get(0));

		} else {
			String str1 = "取消收藏";
			request.setAttribute("bkslf", str1);
			bookShelfInfo.setBookshelfId(String.valueOf(Math.abs((us.getUserId() + no.getNovelId()).hashCode())));
			bookShelfInfo.setReadLog(1);
			bookShelfInfoService.addBookShelfInfo(bookShelfInfo);
		}
		no = novelInfoService.queryNovelInfo(no).get(0);
		request.setAttribute("novel", no);
		request.setAttribute("readlog", 1);
		List<ChapterInfo> chapterInfos = no.getChapterInfo();
		request.setAttribute("chapter", chapterInfos);
		ChapterInfo chapterInfo = new ChapterInfo();
		chapterInfo.setNovelInfo(no);
		long a = chapterInfoService.queryChapterInfoCount(chapterInfo);
		request.setAttribute("sumChapter", a);
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
		request.setAttribute("date1", sdf.format(no.getCreateDate()));
		int sumNovel = userInfoService.queryuserInfo(no.getAuthorInfo()).get(0).getNovelInfo().size();
		request.setAttribute("sumnovel", sumNovel);
		int sumCharacter = 0;
		for (int i = 0; i < sumNovel; i++) {
			sumCharacter = sumCharacter
					+ userInfoService.queryuserInfo(no.getAuthorInfo()).get(0).getNovelInfo().get(i).getNovelCount();
		}
		request.setAttribute("sumcharacter", sumCharacter);

		return "synopsis";
	}

	public static boolean judge(char c) {
		if ((c >= '0' && c <= '9') || (c >= 'a' && c <= 'z' || c >= 'A' && c <= 'Z')) {
			return true;
		}
		return false;
	}

	private static boolean isChinese(char c) {
		Character.UnicodeBlock ub = Character.UnicodeBlock.of(c);
		if (ub == Character.UnicodeBlock.CJK_UNIFIED_IDEOGRAPHS
				|| ub == Character.UnicodeBlock.CJK_COMPATIBILITY_IDEOGRAPHS
				|| ub == Character.UnicodeBlock.CJK_UNIFIED_IDEOGRAPHS_EXTENSION_A
				|| ub == Character.UnicodeBlock.GENERAL_PUNCTUATION
				|| ub == Character.UnicodeBlock.CJK_SYMBOLS_AND_PUNCTUATION
				|| ub == Character.UnicodeBlock.HALFWIDTH_AND_FULLWIDTH_FORMS) {
			return true;
		}
		return false;
	}

	public static boolean isMessyCode(String strName) {
		// 去除字符串中的空格 制表符 换行 回车
		Pattern p = Pattern.compile("\\s*|\t*|\r*|\n*");
		Matcher m = p.matcher(strName);
		String after = m.replaceAll("");
		// 去除字符串中的标点符号
		String temp = after.replaceAll("\\p{P}", "");
		// 处理之后转换成字符数组
		char[] ch = temp.trim().toCharArray();
		for (int i = 0; i < ch.length; i++) {
			char c = ch[i];
			// 判断是否是数字或者英文字符
			if (!judge(c)) {
				// 判断是否是中日韩文
				if (!isChinese(c)) {
					// 如果不是数字或者英文字符也不是中日韩文则表示是乱码返回true
					return true;
				}
			}
		}
		// 表示不是乱码 返回false
		return false;
	}
}
