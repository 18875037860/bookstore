package com.cqjtu.bookstore.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.xml.crypto.Data;

public class emailHtml {
		//  返回页面Html携带的6位随机码
		public static String html(String code) {
			Date date = new Date();
			SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd :hh:mm:ss");
			String html = "亲爱的用户：<br/>"+ 
			"您好！感谢您使用墨韵书城。<br/>"+
			"您的邮箱验证码是：<br/>"+
			"<h3 style='color:red;'>"+ code +"</h3><br/>"+"(为保障您的账号安全性，请在1小时内完成验证。)<br/>"
			//"你只将下面验证码输入提示框即可：<h3 style='color:red;'>" + code + "</h3><br/>";
			+ "<br/>"+
			"<br/>"+
			"墨韵书城团队（请勿回复）<br/>"+
			dateFormat.format(date);
			return html;
		}
}
