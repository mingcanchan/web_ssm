package com.ming.model;

public class ChartsData {
	
	private String name;
	private String color;
	private String  dashStyle;
//	private List<ZonesData> zones;
	private int[] data;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	
	public String getDashStyle() {
		return dashStyle;
	}
	public void setDashStyle(String dashStyle) {
		this.dashStyle = dashStyle;
	}
	
	public int[] getData() {
		return data;
	}
	public void setData(int[] data) {
		this.data = data;
	}
	
}
