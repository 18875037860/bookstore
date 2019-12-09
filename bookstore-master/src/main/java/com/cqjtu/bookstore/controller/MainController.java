package com.cqjtu.bookstore.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cqjtu.bookstore.bean.NovelInfo;
import com.cqjtu.bookstore.service.NovelInfoService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/home")
public class MainController {

	@Autowired
	NovelInfoService novelInfoService;

	@RequestMapping("/moyun")
	public String EnterMoyun(HttpServletRequest request, String status, String novelId) {

		if (status != null) {
			if (status.equals("logout")) {
				Enumeration em = request.getSession().getAttributeNames();
				while (em.hasMoreElements()) {
					request.getSession().removeAttribute(em.nextElement().toString());
				}
			}
			if (status.equals("novel")) {
				status = "synopsis";
			}
		}
		request.setAttribute("status", status);
		request.setAttribute("novelid", novelId);
		request.setAttribute("kindNu", getKindNuSum("count"));
		return "moyun";
	}

	@RequestMapping("/loadframe")
	public String LoadFrame(HttpServletRequest request) {

		NovelInfo novelInfo = new NovelInfo();
		JSONArray stylenovel = (JSONArray) getKindNuSum("style");
		List<NovelInfo> welcomeNovel = novelInfoService.queryNovelInfo(novelInfo);
		List<NovelInfo> ggNovel = new ArrayList<>();
		ggNovel.add(welcomeNovel.get(0));// 最新创建
		ggNovel.add(welcomeNovel.get(0));// 最近更新
		ggNovel.add(welcomeNovel.get(0));// 最高赞数
		ggNovel.add(welcomeNovel.get(0));// 最多观看
		ggNovel.add(welcomeNovel.get(0));// 最多收藏
		ggNovel.add(welcomeNovel.get(0));// 最多评分
		for (NovelInfo ni : welcomeNovel) {
			if (ni.getCreateDate() != null) {
				if (ni.getCreateDate().after(ggNovel.get(0).getCreateDate())) {
					ggNovel.get(0).setCreateDate(ni.getCreateDate());
				}
			}
			if (ni.getUpdateDate() != null) {
				if (ni.getUpdateDate().after(ggNovel.get(1).getUpdateDate())) {
					ggNovel.get(1).setUpdateDate(ni.getUpdateDate());
				}
			}
			if (ni.getPraiseCount() != null) {
				if (ni.getPraiseCount() > ggNovel.get(2).getPraiseCount()) {
					ggNovel.get(2).setPraiseCount(ni.getPraiseCount());
				}
			}
			if (ni.getPageviewCount() != null) {
				if (ni.getPageviewCount() > ggNovel.get(3).getPageviewCount()) {
					ggNovel.get(3).setPageviewCount(ni.getPageviewCount());
				}
			}
			if (ni.getCollectionCount() != null) {
				if (ni.getCollectionCount() > ggNovel.get(4).getCollectionCount()) {
					ggNovel.get(4).setCollectionCount(ni.getCollectionCount());
				}
			}
			if (ni.getNovelGrade() != 0) {
				if (ni.getNovelGrade() > ggNovel.get(5).getNovelGrade()) {
					ggNovel.get(5).setNovelGrade(ni.getNovelGrade());
				}
			}
		}

		request.setAttribute("welcomeNovel", welcomeNovel);
		request.setAttribute("styleNovel", stylenovel);
		request.setAttribute("ggNovelInfo", ggNovel);

		return "mainview";
	}

	@RequestMapping("/search")
	public String searchNovel(HttpServletRequest request, NovelInfo novel) {
		List<NovelInfo> novels = novelInfoService.queryNovelInfo(novel);
		request.setAttribute("novels", novels);
		return "search";
	}

	public Object getKindNuSum(String flag) {
		List<String> kind = new ArrayList<>();
		List<Long> kindNu = new ArrayList<>();
		List<NovelInfo> kindBk = new ArrayList<>();
		JSONArray ja = new JSONArray();
		NovelInfo ni = new NovelInfo();
		Object object = new Object();
		kind.add("都市");
		kind.add("科幻");
		kind.add("历史");
		kind.add("现实");
		kind.add("青春");
		kind.add("武侠");
		kind.add("仙侠");
		kind.add("玄幻");
		kind.add("悬疑");
		kind.add("游戏");
		kind.add("言情");
		kind.add("轻小说");
		if (flag == "count") {
			for (int i = 0; i < kind.size(); i++) {
				ni.setNovelStyle(kind.get(i));
				kindNu.add((novelInfoService.queryNovelInfoCount(ni)));
				object = kindNu;
			}
		} else {
			for (int i = 0; i < kind.size(); i++) {
				ni.setNovelStyle(kind.get(i));
				try {
					kindBk = novelInfoService.queryNovelInfo(ni);
					if (kindBk.size() != 0) {
						ja.add(kindBk);
					}
				} catch (Exception e) {
				}
				object = ja;
			}
		}
		return object;
	}
}
