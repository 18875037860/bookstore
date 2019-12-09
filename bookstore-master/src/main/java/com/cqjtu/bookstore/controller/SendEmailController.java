package com.cqjtu.bookstore.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cqjtu.bookstore.bean.UserInfo;
import com.cqjtu.bookstore.util.JavaMailUtil;
import com.cqjtu.bookstore.util.RandomUtil;
import com.cqjtu.bookstore.util.emailHtml;

@Controller
@RequestMapping("/Code")
public class SendEmailController {
	private static final long serialVersionUID = 1L;

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
}
