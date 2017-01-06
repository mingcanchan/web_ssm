package com.elephant.model;

import java.util.List;

public class HighchartsModel {
	
	private String text;
	private List<String> categories;
	private String title;
	private List<ChartsData> series;
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public List<String> getCategories() {
		return categories;
	}
	public void setCategories(List<String> categories) {
		this.categories = categories;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public List<ChartsData> getSeries() {
		return series;
	}
	public void setSeries(List<ChartsData> series) {
		this.series = series;
	}
	
}
