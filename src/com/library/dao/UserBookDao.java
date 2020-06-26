package com.library.dao;

import java.util.List;

import com.library.model.Book;

public interface UserBookDao {

	
	public void borrowBooks();
	public void returnBooks();
	public void payFine();
	
	public List<Book> searchBook(String searchInfo);
}
