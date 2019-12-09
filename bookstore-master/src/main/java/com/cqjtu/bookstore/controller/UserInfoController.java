package com.cqjtu.bookstore.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.imageio.ImageIO;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cqjtu.bookstore.bean.BookShelfInfo;
import com.cqjtu.bookstore.bean.FondInfo;
import com.cqjtu.bookstore.bean.NovelInfo;
import com.cqjtu.bookstore.bean.UserInfo;
import com.cqjtu.bookstore.service.BookShelfInfoService;
import com.cqjtu.bookstore.service.ChapterInfoService;
import com.cqjtu.bookstore.service.FondInfoService;
import com.cqjtu.bookstore.service.NovelInfoService;
import com.cqjtu.bookstore.service.UserInfoService;
import com.cqjtu.bookstore.util.JavaMailUtil;
import com.cqjtu.bookstore.util.RandomUtil;
import com.cqjtu.bookstore.util.emailHtml;

@Controller
@RequestMapping("/user")
public class UserInfoController {

	@Autowired
	UserInfoService userInfoService;
	@Autowired
	FondInfoService fondInfoService;
	@Autowired
	NovelInfoService novelInfoService;
	@Autowired
	ChapterInfoService chapterInfoService;
	@Autowired
	BookShelfInfoService bookShelfInfoService;

	private static final long serialVersionUID = 1L;

	@RequestMapping("/signin")
	public String First() {
		return "login/login";
	}

	@RequestMapping("/login")
	public @ResponseBody String login(String userName, String email, String userPassword, HttpSession session,
			HttpServletRequest request, HttpServletResponse repsonse) {
		String verifycode = request.getParameter("verifyCode");
		String piccode = (String) request.getSession().getAttribute("verifycode");
		UserInfo u = new UserInfo();
		if (isEmail(userName)) {
			u.setUserEmail(userName);
		} else {
			u.setUserName(userName);
		}
		List<UserInfo> users = new ArrayList<UserInfo>();
		users = userInfoService.queryuserInfo(u);
		if (users != null && !users.isEmpty()) {
			if (users.get(0).getUserPassword().equals(userPassword)) {
				if (verifycode != null && !verifycode.equals("") && verifycode.equals(piccode)) {
					session.removeAttribute("piccode");
					session.setAttribute("user", users.get(0));
					return "success";
				} else {
					session.removeAttribute("piccode");
					return "error";
				}
			} else {
				session.removeAttribute("piccode");
				return "error2";
			}
		} else {
			return "error1";
		}
	}

	@RequestMapping("/regist")
	public @ResponseBody String userReg(String email, String userName1, String userPassword1, String inputCode,
			HttpSession session, HttpServletRequest request, HttpServletResponse repsonse)
			throws Throwable, IOException {
		UserInfo u = new UserInfo();
		Date date = new Date();
		u.setUserEmail(email);
		u.setUserName(userName1);
		u.setUserPassword(userPassword1);
		u.setUserVip("false");
		u.setUserId(
				String.valueOf(Math.abs((userName1 + date.toString()).hashCode())) + Math.round(Math.random() * 100));
		u.setEnrollDate(date);
		if (searchUserName(userName1).equals("error")) {
			return "error1";
		} else if (searchUserEmal(email)) {
			return "error2";
		} else {
			String sessionCode = (String) request.getSession().getAttribute("code");
			System.out.println(sessionCode);
			// 获取session中的验证码
			if (sessionCode != null) {
				// 获取页面提交的验证码
				// String inputCode = request.getParameter("code");
				System.out.println("页面提交的验证码:" + inputCode);
				if (sessionCode.toLowerCase().equals(inputCode.toLowerCase())) {
					userInfoService.userInfoEnroll(u);
					request.getSession().removeAttribute("code");
					request.getSession().setAttribute("user", u);
					return "success";
				} else {
					return "error";
					// 验证失败
				}
			} else {
				// 验证失败
				return "error";
			}
		}

	}

	private boolean searchUserEmal(String email) {
		UserInfo u = new UserInfo();
		u.setUserEmail(email);
		if (userInfoService.queryuserInfoCount(u) > 0) {
			// 存在
			return true;
		} else {
			// 不存在
			return false;
		}
	}

	@RequestMapping("/sendUserName")
	public @ResponseBody String searchUserName(String username) {
		// 查找username是否存在
		UserInfo u = new UserInfo();
		u.setUserName(username);
		if (userInfoService.queryuserInfoCount(u) >= 1) {
			// 存在
			return "error";
		} else {
			// 不存在
			return "success";
		}

	}

	/**
	 * 描述：是否是邮箱.
	 *
	 * @param str 指定的字符串
	 * @return 是否是邮箱:是为true，否则false
	 */
	public static Boolean isEmail(String str) {
		Boolean isEmail = false;
		String expr = "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})$";

		if (str.matches(expr)) {
			isEmail = true;
		}
		return isEmail;
	}

	/**
	 * 判断是否是手机号
	 *
	 * @param phone
	 * @return
	 */
	public static boolean checkPhone(String phone) {
		Pattern pattern = Pattern.compile("^(13[0-9]|15[0-9]|153|15[6-9]|180|18[23]|18[5-9])\\d{8}$");
		Matcher matcher = pattern.matcher(phone);

		if (matcher.matches()) {
			return true;
		}
		return false;
	}

	@RequestMapping("/sendIdCode")
	public void sendEmail(UserInfo a, HttpSession session, HttpServletRequest req, HttpServletResponse repsonse)
			throws Throwable, IOException {
		try {
			String email = req.getParameter("email");
			JavaMailUtil.receiveMailAccount = email; // 给用户输入的邮箱发送邮件
			// 1、创建参数配置，用于连接邮箱服务器的参数配置
			Properties props = new Properties();
			// 开启debug调试
			props.setProperty("mail.debug", "true");
			// 发送服务器需要身份验证
			props.setProperty("mail.smtp.auth", "true");
			// 设置右键服务器的主机名
			props.setProperty("mail.host", JavaMailUtil.emailSMTPHost);
			// 发送邮件协议名称
			props.setProperty("mail.transport.protocol", "smtp");

			// 2、根据配置创建会话对象，用于和邮件服务器交互
			Session sessions = Session.getInstance(props);
			// HttpSession session = req.getSession();
			// 设置debug，可以查看详细的发送log
			sessions.setDebug(false);
			// 3、创建一封邮件
			String code = RandomUtil.getRandom();
			String html = emailHtml.html(code);
			MimeMessage message = JavaMailUtil.creatMimeMessage(sessions, JavaMailUtil.emailAccount,
					JavaMailUtil.receiveMailAccount, html);
			// 4、根据session获取邮件传输对象
			Transport transport = sessions.getTransport();
			// 5、使用邮箱账号和密码连接邮箱服务器emailAccount必须与message中的发件人邮箱一致，否则报错
			transport.connect(JavaMailUtil.emailAccount, JavaMailUtil.emailPassword);
			// 6、发送邮件,发送所有收件人地址
			transport.sendMessage(message, message.getAllRecipients());
			// 7、关闭连接
			transport.close();
			// 写入session
			req.getSession().setAttribute("code", code);
		} catch (Exception e) {
			e.printStackTrace();
			req.getSession().setAttribute("error", "邮件发送失败");
		}
	}

	@RequestMapping(value = "/getVerifyCodeImage")
	public void getVerifyCodeImage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 设置验证码字符的字体和字号。
		Font mFont = new Font("Arial Black", Font.PLAIN, 22);

		// 清除缓存，每次访问该页面时都从服务器端读取
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpeg");

		// 设置验证码图片的长度和高度。
		int width = 86, height = 40;
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		// 画图画板
		Graphics g = image.getGraphics();
		// 定义一个随机数
		Random random = new Random();
		// 设置画板背景颜色
//          g.setColor(getRandColor(200, 250));
		g.setColor(new Color(160, 177, 185));
		// 设置画板的填充范围
		g.fillRect(1, 1, width - 1, height - 1);
//          g.setColor(new Color(102, 102, 102));
		g.drawRect(0, 0, width - 1, height - 1);
		// 设置字体
		g.setFont(mFont);

		// 显示字符串，4位长度。
		String sRand = "";
		for (int i = 0; i < 4; i++) {
			String tmp = getRandomChar();
			sRand += tmp;
			// 设置每个数字的颜色
			g.setColor(new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110)));
			// 在画板上写数字，起始位置
			g.drawString(tmp, 20 * i + 5, 27);
		}

		HttpSession session = request.getSession();
		// System.out.println(session);
		// 把验证码防到session中，用来前台对比。
		session.setAttribute("verifycode", sRand.toLowerCase());
		// System.out.println(sRand.toLowerCase()+"--------------------------》");
		// 显示图片
		g.dispose();
		// 转换成一张图片，格式为JPEG
		ImageIO.write(image, "JPEG", response.getOutputStream());
	}

	/**
	 * 随机获得颜色，RGB格式
	 *
	 * @param fc
	 * @param bc
	 * @return
	 */
	Color getRandColor(int fc, int bc) {
		Random random = new Random();
		if (fc > 255)
			fc = 255;
		if (bc > 255)
			bc = 255;
		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);
		return new Color(r, g, b);
	}

	private String getRandomChar() {
		int rand = (int) Math.round(Math.random() * 2);
		long itmp = 0;
		char ctmp = '\u0000';
		switch (rand) {
		case 1:
			itmp = Math.round(Math.random() * 25 + 65);
			ctmp = (char) itmp;
			return String.valueOf(ctmp);
		case 2:
			itmp = Math.round(Math.random() * 25 + 97);
			ctmp = (char) itmp;
			return String.valueOf(ctmp);
		default:
			itmp = Math.round(Math.random() * 9);
			return String.valueOf(itmp);
		}
	}

	@RequestMapping("/find")
	public String findP() {
		return "login/findPassword";
	}

	@RequestMapping("/findpassword")
	public @ResponseBody String findPasswords(String email, String newPassword, String verifyCode,
			HttpServletRequest request) {
		UserInfo u = new UserInfo();
		u.setUserEmail(email);
		List<UserInfo> users = new ArrayList<UserInfo>();
		users = userInfoService.queryuserInfo(u);
		if (users != null && !users.isEmpty()) {
			String sessionCode = (String) request.getSession().getAttribute("code");
			// 获取session中的验证码
			if (sessionCode != null) {
				// 获取页面提交的验证码
				if (sessionCode.toLowerCase().equals(verifyCode.toLowerCase())) {

					users.get(0).setUserPassword(newPassword);
					request.getSession().removeAttribute("user");
					userInfoService.userInfoAlter(users.get(0));
					request.getSession().removeAttribute("code");
					return "success";
				} else {
					return "error";
					// 验证失败
				}
			} else {
				// 验证失败
				return "error";
			}
			// 移除session中的验证码
		} else {
			return "error1";
		}

	}

	@RequestMapping("/loadfans")
	public String loadFindFans(HttpServletRequest request, HttpSession session) {

		FondInfo fondInfo = new FondInfo();
		FondInfo fondInfo1 = new FondInfo();
		UserInfo u = new UserInfo();
		u = (UserInfo) session.getAttribute("user");
		fondInfo.setFansId(u.getUserId());
		fondInfo1.setIdolId(u.getUserId());
		List<FondInfo> fondFs = fondInfoService.queryFondInfo(fondInfo1);
		List<FondInfo> fondIfs = fondInfoService.queryFondInfo(fondInfo);
		List<UserInfo> fs = new ArrayList<UserInfo>();
		List<UserInfo> fs1 = new ArrayList<UserInfo>();
		for (FondInfo f : fondFs) {
			UserInfo u1 = new UserInfo();
			u1.setUserId(f.getFansId());
			try {
				fs.add(userInfoService.queryuserInfo(u1).get(0));
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		for (FondInfo f : fondIfs) {
			UserInfo u2 = new UserInfo();
			u2.setUserId(f.getIdolId());
			try {
				fs1.add(userInfoService.queryuserInfo(u2).get(0));
			} catch (Exception e) {
			}
		}
		request.setAttribute("fondFs", fs);
		request.setAttribute("fondIfs", fs1);
		return "login/personal";
	}

	@RequestMapping("/follow")
	public @ResponseBody String followSb(String userId, HttpSession session, HttpServletRequest request) {
		Date date = new Date();
		FondInfo fondInfo = new FondInfo();
		UserInfo user = (UserInfo) session.getAttribute("user");
		fondInfo.setFansId(user.getUserId());
		fondInfo.setIdolId(userId);
		if (fondInfoService.queryFondInfo(fondInfo).size() > 0) {
			return "error";
		} else {
			fondInfo.setFondId(String.valueOf(Math.abs((user.getUserId() + userId + date.toString()).hashCode())
					+ Math.round(Math.random() * 1000000000)));
			fondInfoService.concernFondInfo(fondInfo);
			return "success";
		}
	}

	@RequestMapping("/unfollow")
	public @ResponseBody String unFollowSb(String userId, HttpServletRequest request, HttpSession session) {
		UserInfo u = (UserInfo) session.getAttribute("user");
		FondInfo fondInfo = new FondInfo();
		fondInfo.setFansId(u.getUserId());
		fondInfo.setIdolId(userId);
		FondInfo fondId = fondInfoService.queryFondInfo(fondInfo).get(0);
		fondInfoService.cancelFondInfo(fondId);
		return "success";
	}

	@RequestMapping("/contact")
	public @ResponseBody String contactMsg(String message) {
		System.out.println("接收到用户信息:" + message);
		return "success";
	}

	@RequestMapping("/bookshelf")
	public String persionBS(HttpServletRequest request, HttpSession session) {
		UserInfo userinfo = (UserInfo) request.getSession().getAttribute("user");
		NovelInfo novelInfo = new NovelInfo();
		novelInfo.setAuthorInfo(userinfo);
		BookShelfInfo bookshelfinfo = new BookShelfInfo();
		bookshelfinfo.setUserInfo(userinfo);
		List<BookShelfInfo> bookshelfinfos = bookShelfInfoService.queryBookShelfInfo(bookshelfinfo);
		List<NovelInfo> novelinfos = new ArrayList<NovelInfo>();
		for (BookShelfInfo bs : bookshelfinfos) {
			novelinfos.add(bs.getNovelInfo());
		}
		if (novelinfos != null) {
			request.setAttribute("novelinfos", novelinfos);
			request.setAttribute("NOnovel", "true");
		} else {
			request.setAttribute("NOnovel", "false");
		}

		return "login/personbs";
	}

	@RequestMapping("/pay")
	public String pay() {
		return "/login/pay";
	}

	@RequestMapping("/doPay")
	public String DoPay(HttpServletRequest request) {
		UserInfo userinfo = (UserInfo) request.getSession().getAttribute("user");
		userinfo.setUserVip("ture");
		userInfoService.userInfoAlter(userinfo);

		return "login/personal";
	}

}
