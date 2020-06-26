package com.library.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.library.model.Book;


public class AdminBookDaoImpl implements AdminBookDao {
	
	private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void save(Book b) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(b);

	}

	@Override
	public void delete(Book b) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().delete(b);
	}

	@Override
	public void update(Book b) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(b);
	}

	@Override
	public Book getbookById(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		String hql =  "from Book b where b.bookId = '" + id + "'";
		Query query = session.createQuery(hql);
		List list = query.list();
		
		session.close();
		if (list.isEmpty()) {
			return  null;
		}
		else {
			return (Book)list.get(0);
		}
	}


	public List<Integer> getbookAllId() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		String hql = "select b.bookId from Book b";
		Query query = session.createQuery(hql);
		List list = query.list();
		session.close();
		if (list.isEmpty()) {
			return null;
		} else {
			return list;
		}


	}
}
