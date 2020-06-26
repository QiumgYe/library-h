package com.library.service;

import java.util.List;

import com.library.model.Book;
public interface UserBookService {

	public void borrowBooks();

	public void returnBooks();

	public void searchBook();

	public void payFine();
	
	public List<Book> searchBook(String searchInfo);
	
}
