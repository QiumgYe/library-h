package com.library.service;

import java.util.List;

import com.library.model.Book;

public interface AdminBookService {
	public void addbook(Book b);
	
	public void deletebook(Book b);
	
	public Book getbookById(int id);
	
	public void updatebook(Book b);

	public List<Integer> getbookAllId();
	

}