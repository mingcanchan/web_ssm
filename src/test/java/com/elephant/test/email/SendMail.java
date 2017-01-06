package com.elephant.test.email;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
	public static void sendMail(String user, String password,
			String toMail, String mailTitle)
			throws Exception {
		
		String contentString = "<div id=\"mailContentContainer\" class=\"qmbox qm_con_body_content qqmail_webmail_only\">"
			+ "<style type=\"text/css\">"
			+ ".qmbox body{font-size:14px;font-family:Tahoma, Geneva, sans-serif;text-align:center;color:#333;}"
			+ ".qmbox a{color:#4EB35F;font-weight:bold;}"
			+ ".qmbox .main{width:100%;text-align:left;border:1px solid #efefef;padding:20px;background:#fafafa;}"
			+ ".qmbox p span{color:#000;font-weight:bold;font-size:18px;}"
			+ ".qmbox h3{color:#75b9e6;font-size:14px;margin:0;font-weight: normal;}"
			+ ".qmbox .footer{color:#666;font-size:14px;}"
			+ "</style>"
			+ "<div class=\"main\" style=\"border: 1px solid #efefef;\">"
			+ "<p><span>尊敬的用户：</span></p>"
			+ "<p style=\"text-indent: 2.5em;\">您正在使用该邮箱进行账户激活业务！</p>"
			+ "<p style=\"text-indent: 2.5em;\">请点击下面的链接进行账户激活（重复点击无效）：</p>"
			+ "<p style=\"text-indent: 2.5em;\">"
			+ "<a href=\"http://dx.jiweitech.com:80/customerInfo/activation.do?email=618d1eab919fa9a68ec1af110f2ea9cb766d2a2c408c8f7cd6338e1d789851de\" target=\"_blank\">立即激活</a>"
			+ "</p>"
			+ "<h3 style=\"margin-left: 220px;color: #000;\">大象云通信综合平台</h3>"
			+ "<h3 style=\"margin-left: 259px;color: #000;\">"
			+ "<span style=\" position: relative;\" t=\"5\" times=\"\" isout=\"0\">2016-12-08</span>"
			+ "</h3>"
			+ "<div class=\"footer\">"
			+ "<p style=\"border-bottom: 1px dashed #d8d7d7;padding-bottom:10px;width:350px;\"></p>"
			+ "<p style=\"width:250px;\">此邮件为系统自动发出，请勿回复。</p>"
			+ "<p style=\"margin-top: -10px;\">信息改变生活，服务创造价值！</p>"
			+ "</div>"
			+ "</div>"
			+ "<style type=\"text/css\">"
			+ ".qmbox style, .qmbox script, .qmbox head, .qmbox link, .qmbox meta {display: none !important;}"
			+ "</style>" + "</div>";
		
		String restContent = "<div id=\"mailContentContainer\" class=\"qmbox qm_con_body_content qqmail_webmail_only\">"
				+ "<style type=\"text/css\">"
				+ ".qmbox body{font-size:14px;font-family:Tahoma, Geneva, sans-serif;text-align:center;color:#333;}"
				+ ".qmbox .main{width:100%;text-align:left;border:1px solid #dfdfdf;padding:20px;background:#fafafa;}"
				+ ".qmbox a{color:#4EB35F;font-weight:bold;}"
				+ ".qmbox p span{color:#000;font-weight:bold;font-size:18px;}"
				+ ".qmbox h3{color:#06c;font-size:14px;margin:0;font-weight: normal;}"
				+ ".qmbox .footer{color:#666;font-size:14px;}"
				+ "</style>"
				+ "<div class=\"main\">"
				+ "<p><span>尊敬的用户：</span></p>"
				+ "<p style=\"padding-left: 34px;\">您正在使用该邮箱进行密码重置业务。</p>"
				+ "<p style=\"padding-left: 34px;\">请点击下面的按钮进行密码重置：(20分钟内有效，请尽快完成重置。)</p>"
				+ "<a style=\"padding-left: 33px;\" href=\"http://dx.jiweitech.com:80/clientController/resetPwd.do?ID=8605ceec-ef12-4a83-ad0c-33528ae2639a&amp;token=69061dfb-be8a-4acd-a02b-ee1c483241d8\" target=\"_blank\">立即重置</a>"
				+ "<h3 style=\"margin-left: 450px;color: #000;margin-top: 15px;\">大象云通信服务平台</h3>"
				+ "<h3 style=\"margin-left: 312px;color: #000;\">"
				+ "<span style=\"position: relative;\" >2016-12-08</span> 09:48:08</h3>"
				+ "<div class=\"footer\">"
				+ "<p style=\"padding-bottom:10px;width: 580px;border-bottom: 1px dashed #d8d7d7;\"></p>"
				+ "<p style=\"width:250px;\">此邮件为系统自动发出，请勿回复。</p>"
				+ "<p style=\"margin-top: -10px;\">信息改变生活，服务创造价值！</p></div></div>"
				+ "<style type=\"text/css\">.qmbox style, .qmbox script, .qmbox head, .qmbox link, .qmbox meta {display: none !important;}</style>"
				+ "</div>";
		
		Properties props = new Properties(); // 可以加载一个配置文件
		// 使用smtp：简单邮件传输协议
		props.put("mail.smtp.host", "smtp.163.com");// 存储发送邮件服务器的信息
		props.put("mail.smtp.auth", "true");// 同时通过验证
		props.put("mail.transport.protocol", "smtp");
		
		Session session = Session.getInstance(props);// 根据属性新建一个邮件会话
		// session.setDebug(true); //有他会打印一些调试信息。

		MimeMessage message = new MimeMessage(session);// 由邮件会话新建一个消息对象
		message.setFrom(new InternetAddress(user));// 设置发件人的地址
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(
				toMail));// 设置收件人,并设置其接收类型为TO
		message.setSubject(mailTitle);// 设置标题
		// 设置信件内容
		// message.setText(mailContent); //发送 纯文本 邮件 todo
		message.setContent(restContent, "text/html;charset=utf-8"); // 发送HTML邮件，内容样式比较丰富
		message.setSentDate(new Date());// 设置发信时间
		message.saveChanges();// 存储邮件信息

		// 发送邮件
		// Transport transport = session.getTransport("smtp");
		Transport transport = session.getTransport();
		transport.connect(user, password);
		transport.sendMessage(message, message.getAllRecipients());// 发送邮件,其中第二个参数是所有已设好的收件人地址
		transport.close();
	}

	public static void main(String[] args) throws Exception {
		
		
		sendMail("350862217@163.com", "8355733zz", "chinaofwarcraft@163.com", "Java Mail 测试邮件");
	}
}
