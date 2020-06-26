package com.library.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.library.model.Book;
import com.library.service.UserBookService;
import com.opensymphony.xwork2.ActionSupport;

public class UserBookAction extends ActionSupport {
	
	private String searchInfo;
	public String getSearchInfo() {
		return searchInfo;
	}
	public void setSearchInfo(String searchInfo) {
		this.searchInfo = searchInfo;
	}

	//
	private UserBookService userBookService;
	public void setUserBookService(UserBookService userBookService) {
		this.userBookService = userBookService;
	}

	// 搜书
	public String searchInfo() {
		HttpServletRequest request = ServletActionContext.getRequest();
		List<Book> result_list = userBookService.searchBook(searchInfo);
		request.setAttribute("result_list", result_list);
		return "searchResult";
	}
}
