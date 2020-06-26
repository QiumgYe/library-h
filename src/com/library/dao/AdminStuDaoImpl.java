package com.library.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;


import com.library.model.Stu;

public class AdminStuDaoImpl implements AdminStuDao {
	private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void delete(Stu s) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().delete(s);
	}

	@Override
	public void update(Stu s) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(s);
	}

	@Override
	public Stu getstuById(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		String hql =  "from Stu s where s.stuId = '" + id + "'";
		Query query = session.createQuery(hql);
		List list = query.list();
		session.close();
		if (list.isEmpty()) {
			return  null;
		}
		else {
			return (Stu)list.get(0);
		}
	}
	@Override
	public List<Integer> getstuAllId(){
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		String hql =  "select s.stuId from Stu s";
		Query query = session.createQuery(hql);
		List list = query.list();

		session.close();
		if (list.isEmpty()) {
			return  null;
		}
		else {
			return list;
		}
	}
	

}
