package com.sxhkwy.utils;

import com.sxhkwy.pojo.Information;
import com.sxhkwy.pojo.User;
import com.sxhkwy.pojo.WebSites;

import java.io.Serializable;
import java.util.List;

public class PageBean implements Serializable {
	private List<Information> iList;//留言集合
	private List<User> uList;
	private List<WebSites> wList;
	private int pages;//总页数
	private int pageNum;//当前页码数
	private int rows;//一页记录数
	private int startIndex;//开始索引
	private int totalRecord;//总记录数
	
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public List<Information> getiList() {
		return iList;
	}
	public void setiList(List<Information> iList) {
		this.iList = iList;
	}
	public int getPages() {
		return pages;
	}
	public void setPages(int pages) {
		this.pages = pages;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public List<User> getuList() {
		return uList;
	}

	public void setuList(List<User> uList) {
		this.uList = uList;
	}

	public List<WebSites> getwList() {
		return wList;
	}

	public void setwList(List<WebSites> wList) {
		this.wList = wList;
	}
}
