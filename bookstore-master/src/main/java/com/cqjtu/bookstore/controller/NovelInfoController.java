package com.cqjtu.bookstore.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cqjtu.bookstore.bean.NovelInfo;
import com.cqjtu.bookstore.service.NovelInfoService;

@Controller
@RequestMapping("/novel")
public class NovelInfoController {

	@Autowired
	NovelInfoService novelInfoService;

	@RequestMapping("/all")
	public String login(String style, String status, String attribute, HttpServletRequest request) {
		NovelInfo novelInfo = new NovelInfo();
		if (style == null || style.equals("null") || style.equals("全部")) {
			novelInfo.setNovelStyle(null);
			style = "全部";
		} else {
			novelInfo.setNovelStyle(style);
		}
		if (status == null || status.equals("null") || status.equals("全部")) {
			novelInfo.setNovelStatus(null);
			status = "全部";
		} else {
			novelInfo.setNovelStatus(status);
		}
		if (attribute == null || attribute.equals("null") || attribute.equals("全部")) {
			novelInfo.setNovelAttribute(null);
			attribute = "全部";
		} else {
			novelInfo.setNovelAttribute(attribute);
		}
		List<NovelInfo> data1 = novelInfoService.queryNovelInfo(novelInfo);

		request.setAttribute("novel", data1);
		request.setAttribute("novelstyle", style);
		request.setAttribute("novelstatus", status);
		request.setAttribute("novelattribute", attribute);
		return "all";
	}

	@RequestMapping("/kind")
	public String xuanhuan(HttpServletRequest request, String style) {
		NovelInfo novelInfo = new NovelInfo();
		novelInfo.setNovelStyle(style);
		List<NovelInfo> data1 = novelInfoService.queryNovelInfo(novelInfo);
		request.setAttribute("novel", data1);
		request.setAttribute("novelstyle", style);
		request.setAttribute("novelstatus", "全部");
		request.setAttribute("novelattribute", "全部");
		return "all";
	}

	@RequestMapping("/order")
	public String paih(HttpServletRequest request) {
		NovelInfo novelInfo = new NovelInfo();
		NovelInfo novelInfotemp = new NovelInfo();
		List<NovelInfo> datasc = novelInfoService.queryNovelInfo(novelInfo);
		List<NovelInfo> datatj = novelInfoService.queryNovelInfo(novelInfo);
		List<NovelInfo> datadz = novelInfoService.queryNovelInfo(novelInfo);
		for (int i = 0; i < datatj.size() - 1; i++) {
			for (int j = datatj.size() - 1; j > i; j--) {
				if (datatj.get(j).getPageviewCount().intValue() > datatj.get(j - 1).getPageviewCount().intValue()) {
					novelInfotemp = datatj.get(j);
					Object set = datatj.set(j, datatj.get(j - 1));
					Object set1 = datatj.set(j - 1, novelInfotemp);
				}
			}
		}
		request.setAttribute("novelInfotj", datatj);
		for (int i = 0; i < datasc.size() - 1; i++) {
			for (int j = datasc.size() - 1; j > i; j--) {
				if (datasc.get(j).getCollectionCount().intValue() > datasc.get(j - 1).getCollectionCount().intValue()) {
					novelInfotemp = datasc.get(j);
					Object set = datasc.set(j, datasc.get(j - 1));
					Object set1 = datasc.set(j - 1, novelInfotemp);
				}
			}
		}
		request.setAttribute("novelInfosc", datasc);

		for (int i = 0; i < datadz.size() - 1; i++) {
			for (int j = datadz.size() - 1; j > i; j--) {
				if (datadz.get(j).getPraiseCount().intValue() > datadz.get(j - 1).getPraiseCount().intValue()) {
					novelInfotemp = datadz.get(j);
					Object set = datadz.set(j, datadz.get(j - 1));
					Object set1 = datadz.set(j - 1, novelInfotemp);
				}
			}
		}
		request.setAttribute("novelInfodz", datadz);
		return "order";
	}

	@RequestMapping("/hot")
	public String renqib(String style, HttpServletRequest request) {
		NovelInfo novelInfo = new NovelInfo();
		NovelInfo novelInfotemp = new NovelInfo();
		if (style == null || style.equals("全部")) {
			style = "";
		}
		novelInfo.setNovelStyle(style);
		List<NovelInfo> datatj = novelInfoService.queryNovelInfo(novelInfo);
		for (int i = 0; i < datatj.size() - 1; i++) {
			for (int j = datatj.size() - 1; j > i; j--) {
				if (datatj.get(j).getPageviewCount().intValue() > datatj.get(j - 1).getPageviewCount().intValue()) {
					novelInfotemp = datatj.get(j);
					Object set = datatj.set(j, datatj.get(j - 1));
					Object set1 = datatj.set(j - 1, novelInfotemp);
				}
			}
		}
		request.setAttribute("novelInfodz", datatj);
		return "hot";

	}

	@RequestMapping("/recommend")
	public String tuijianb(String style, HttpServletRequest request) {

		NovelInfo novelInfo = new NovelInfo();
		NovelInfo novelInfotemp = new NovelInfo();
		if (style == null || style.equals("全部")) {
			style = "";
		}
		novelInfo.setNovelStyle(style);
		List<NovelInfo> datadz = novelInfoService.queryNovelInfo(novelInfo);
		for (int i = 0; i < datadz.size() - 1; i++) {
			for (int j = datadz.size() - 1; j > i; j--) {
				if (datadz.get(j).getPraiseCount().intValue() > datadz.get(j - 1).getPraiseCount().intValue()) {
					novelInfotemp = datadz.get(j);
					Object set = datadz.set(j, datadz.get(j - 1));
					Object set1 = datadz.set(j - 1, novelInfotemp);
				}
			}
		}
		request.setAttribute("novelInfotj", datadz);

		return "recommend";
	}

	@RequestMapping("/collection")
	public String soucangb(String style, HttpServletRequest request) {

		NovelInfo novelInfo = new NovelInfo();
		NovelInfo novelInfotemp = new NovelInfo();
		if (style == null || style.equals("全部")) {
			style = "";
		}
		novelInfo.setNovelStyle(style);
		List<NovelInfo> datasc = novelInfoService.queryNovelInfo(novelInfo);
		for (int i = 0; i < datasc.size() - 1; i++) {
			for (int j = datasc.size() - 1; j > i; j--) {
				if (datasc.get(j).getCollectionCount().intValue() > datasc.get(j - 1).getCollectionCount().intValue()) {
					novelInfotemp = datasc.get(j);
					Object set = datasc.set(j, datasc.get(j - 1));
					Object set1 = datasc.set(j - 1, novelInfotemp);
				}
			}
		}
		request.setAttribute("novelInfosc", datasc);
		return "collection";
	}

	@RequestMapping("/free")
	public String mianfei(String style, String status, HttpServletRequest request) {
		NovelInfo novelInfo = new NovelInfo();
		novelInfo.setNovelAttribute("免费");
		if (style == null || style.equals("null") || style.equals("全部")) {
			novelInfo.setNovelStyle(null);
			style = "全部";
		} else {
			novelInfo.setNovelStyle(style);
		}
		if (status == null || status.equals("null") || status.equals("全部")) {
			novelInfo.setNovelStatus(null);
			status = "全部";
		} else {
			novelInfo.setNovelStatus(status);
		}
		List<NovelInfo> data1 = novelInfoService.queryNovelInfo(novelInfo);
		request.setAttribute("novelInfo", data1);
		request.setAttribute("novelstyle", style);
		request.setAttribute("novelstatus", status);
		return "free";
	}

	@RequestMapping("/vip")
	public String vip(HttpServletRequest request) {
		NovelInfo novelInfo = new NovelInfo();
		novelInfo.setNovelAttribute("vip");
		List<NovelInfo> data1 = novelInfoService.queryNovelInfo(novelInfo);
		request.setAttribute("novelInfo", data1);
		return "vip";
	}

	@RequestMapping("/finish")
	public String wanben(String style, String attribute, HttpServletRequest request) {
		NovelInfo novelInfo = new NovelInfo();
		novelInfo.setNovelStatus("完本");
		if (style == null || style.equals("null") || style.equals("全部")) {
			novelInfo.setNovelStyle(null);
			style = "全部";
		} else {
			novelInfo.setNovelStyle(style);
		}
		if (attribute == null || attribute.equals("null") || attribute.equals("全部")) {
			novelInfo.setNovelAttribute(null);
			attribute = "全部";
		} else {
			novelInfo.setNovelAttribute(attribute);
		}
		List<NovelInfo> data1 = novelInfoService.queryNovelInfo(novelInfo);
		request.setAttribute("novelInfo", data1);
		request.setAttribute("novelstyle", style);
		request.setAttribute("novelattribute", attribute);
		return "finish";
	}

}
