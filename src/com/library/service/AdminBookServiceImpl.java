package com.library.service;

import java.util.List;

import com.library.dao.AdminBookDao;
import com.library.model.Book;

public class AdminBookServiceImpl implements AdminBookService {
	
	private AdminBookDao bookdao;
	@Override
	public void addbook(Book b) {
		// TODO Auto-generated method stub
		bookdao.save(b);

	}

	@Override
	public void deletebook(Book b) {
		// TODO Auto-generated method stub
		if(b != null){
			bookdao.delete(b);
		}	

	}

	@Override
	public Book getbookById(int id) {
		// TODO Auto-generated method stub
		Book bk=bookdao.getbookById(id);
		//bookdao.getbookById(id)=bk
		return bk;
	}

	public AdminBookDao getBookdao() {
		return bookdao;
	}

	public void setBookdao(AdminBookDao bookdao) {
		this.bookdao = bookdao;
	}

	@Override
	public void updatebook(Book b) {
		// TODO Auto-generated method stub
		bookdao.update(b);
	}

	public List<Integer> getbookAllId(){
		// TODO Auto-generated method stub
		return bookdao.getbookAllId();
	}
	
}
