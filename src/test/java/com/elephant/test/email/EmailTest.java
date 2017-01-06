package com.elephant.test.email;

public class EmailTest {
	public static void main(String[] args) {
//		System.out.println("Main开始");
//		EMallTest eMallTest = new EMallTest();
//		Thread thread = new Thread(eMallTest);
//		Thread thread1 = new Thread(eMallTest);
//		thread.start();
//		thread1.start();
//		System.out.println("Main结束");
//	//	System.err.println(Thread.currentThread().getName());
		String str = "^[A-Za-z0-9]{1,}$";
		String str1 = "Wdsadsa";
	//	boolean matches = str1.matches(str);
		if (str1.matches(str)) {
			System.out.println("yes");
		}
	}
}