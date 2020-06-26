package com.library.service;

import com.library.dao.UserBookDao;
import java.util.List;


import com.library.model.Book;

public class UserBookServiceImpl implements UserBookService {
	
	private UserBookDao userBookDao;
	
	public UserBookDao getUserBookDao() {
		return userBookDao;
	}
	public void setUserBookDao(UserBookDao userBookDao) {
		this.userBookDao = userBookDao;
	}

	@Override
	public void borrowBooks() {
		// TODO Auto-generated method stub

	}

	@Override
	public void returnBooks() {
		// TODO Auto-generated method stub

	}

	@Override
	public void searchBook() {
		// TODO Auto-generated method stub

	}

	@Override
	public void payFine() {
		// TODO Auto-generated method stub

	}
	@Override
	public List<Book> searchBook(String searchInfo) {
		List<Book> result_list = userBookDao.searchBook(searchInfo);
		System.out.println("结果："+result_list.size()+"个");
		return result_list;
	}

}
