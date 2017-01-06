package com.elephant.test.email;

import org.junit.Test;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;

public class JavaMailDemo {
		// Spring的邮件工具类，实现了MailSender和JavaMailSender接口  
		private static JavaMailSenderImpl mailSender;  
		public JavaMailDemo() {  
		// 初始化JavaMailSenderImpl，当然推荐在spring配置文件中配置，这里是为了简单  
		mailSender = new JavaMailSenderImpl();  
		// 设置参数  
		mailSender.setHost("smtp.qq.com");  
		mailSender.setPort(25);
		mailSender.setUsername("3398132849@qq.com");  
		mailSender.setPassword("sand543320");  
	}
		
		/**  
		* 简单邮件发送  
		*  
		*/ 
		@Test
		public void simpleSend() {  
		// 构建简单邮件对象，见名知意  
		SimpleMailMessage smm = new SimpleMailMessage();  
		// 设定邮件参数  
		smm.setFrom(mailSender.getUsername());  
		smm.setTo("chinaofwarcraft@163.com");  
		smm.setSubject("Hello world");  
		smm.setText("Hello world via spring mail sender");  
		// 发送邮件  
		mailSender.send(smm);  
		} 
		
		
		public static void main(String[] args) {
			JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
			// 初始化JavaMailSenderImpl，当然推荐在spring配置文件中配置，这里是为了简单  
			mailSender = new JavaMailSenderImpl();  
			// 设置参数  
			mailSender.setHost("smtp.qq.com");  
			mailSender.setPort(25);
			mailSender.setUsername("3398132849@qq.com");  
			mailSender.setPassword("sand543320");  
			// 构建简单邮件对象，见名知意  
			SimpleMailMessage smm = new SimpleMailMessage();  
			// 设定邮件参数  
			smm.setFrom(mailSender.getUsername());  
			smm.setTo("chinaofwarcraft@163.com");  
			smm.setSubject("Hello world");  
			smm.setText("Hello world via spring mail sender");  
			// 发送邮件  
			mailSender.send(smm);  
		}
}
