package com.elephant.test.email;

public class EMallTest implements Runnable{

	public void run() {
		String name = Thread.currentThread().getName();
		System.err.println(name+"开始");
		//System.out.println(name+"...");
		try {
			Thread.sleep(10000L);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.err.println(name+"结束");
	}
	
}
