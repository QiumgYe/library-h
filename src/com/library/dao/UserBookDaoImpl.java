package com.library.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.Query;
import org.hibernate.Session;

import com.library.model.Book;

public class UserBookDaoImpl implements UserBookDao {
	
	private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
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
	public void payFine() {
		// TODO Auto-generated method stub

	}
		//结果对象
		List<Book> result_list = null;
		
		//检索书籍
		@Override
		public List<Book> searchBook(String searchInfo) {
			Session se = getSessionFactory().openSession();
			se.beginTransaction();
			
			String hql = "FROM Book WHERE ";
			//书名
			hql+="bookName LIKE '%"+searchInfo+"%' ";
			//书本编号
			hql+="OR bookId LIKE '%"+searchInfo+"%' ";
			//作者
			hql+="OR bookAuthor LIKE '%"+searchInfo+"%' ";
			//出版社
			hql+="OR bookPub LIKE '%"+searchInfo+"%' ";
			//分类
			hql+="OR sortId LIKE '%"+searchInfo+"%'";
			
			Query query = se.createQuery(hql);
			result_list = query.list();
			
			if(result_list.size()==0){
				System.out.println("查询"+searchInfo+"结果为0");
			}

			se.getTransaction().commit();
			se.close();
			return result_list;
		}

}
