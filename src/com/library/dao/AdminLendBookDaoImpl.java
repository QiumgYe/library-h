package com.library.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.library.model.LendBook;

public class AdminLendBookDaoImpl implements AdminLendBookDao {
	
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public void save(LendBook l) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		//Session session2 = sessionFactory.openSession();
		int z=l.getBook().getBookId();
		String s1 = z + " ";
		String s2="网上已预约借阅";
		String s3=l.getLendId();
		//更新图书数量信息
		System.out.println("书本数减一");
		String hql = "update Book b set b.bookNum=b.bookNum-1 where b.bookId= '"+s1+"' ";
		Query query = session.createQuery(hql);
		query.executeUpdate();
		//更新图书借阅状态
		System.out.println(hql);
		sessionFactory.getCurrentSession().save(l);
	
		//System.out.println("更改状态一");
		//String hql2 = "update LendBook l set l.lendState='2' where l.lendId= '"+s3+"' ";
		//Query query2 = session2.createQuery(hql2);
		//query2.executeUpdate();
		
		//System.out.println(hql2);
		//System.out.println("已经减一，更改完毕");
		session.close();
		//session2.close();
		
	}
	
	public List<Integer> getbookAllId(int stuid) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		String hql = "select b.book.bookId from LendBook b where b.stu.stuId ='+"+stuid+"+' ";
		Query query = session.createQuery(hql);
		List list = query.list();
		if(list.isEmpty()){
			list.add(1);
			return list;
		}else{
		//System.out.println(list);
		session.close();
		//System.out.println(list);
		if (list.isEmpty()) {
			return null;
		} else {
			return list;
		}
		
		}


	}
	
	public List<String> RepayBookNum(int bookid){
		Session session = sessionFactory.openSession();
		//int z=l.getBook().getBookId();
		String s1 =bookid + " ";
		String hql = "select b.bookNum from Book b where b.bookId= '"+s1+"' ";
		Query query = session.createQuery(hql);
		List<String> list = query.list();
		session.close();
		if (list.isEmpty()) {
			return null;
		} else {
			return list;
		}
		
	}
	
	public List<Integer> getlendbookAllId(String lendbookid){
		Session session = sessionFactory.openSession();
		String a=lendbookid;
		String hql = "select b.book.bookId from LendBook b where b.lendId ='"+a+"' ";
		
		Query query = session.createQuery(hql);
		List list = query.list();
		//System.out.println(list);
		if(list.isEmpty()){
			list.add(1);
			return list;
		}else{
		session.close();
		//System.out.println(list);
		if (list.isEmpty()) {
			return null;
		} else {
			return list;
		}
		}
		
		
	}
	public List<Integer> getlendstuAllId(String lendbookid){
		Session session = sessionFactory.openSession();
		String a=lendbookid;
		String hql = "select b.stu.stuId from LendBook b where b.lendId ='"+a+"' ";
		
		Query query = session.createQuery(hql);
		List list = query.list();
		//System.out.println(list);
		if(list.isEmpty()){
			list.add(1);
			return list;
		}else{
		session.close();
		//System.out.println(list);
		if (list.isEmpty()) {
			return null;
		} else {
			return list;
		}
		}
	}
	
	public void updateLendState(String lendid){
		Session session = sessionFactory.openSession();
		String s2="已到实体店借阅";
		String s3=lendid;
	
		System.out.println("更改状态一");
		String hql = "update LendBook l set l.lendState='"+s2+"' where l.lendId= '"+s3+"' ";
		Query query = session.createQuery(hql);
		query.executeUpdate();
		
		System.out.println(hql);
		System.out.println("更改完毕");
		session.close();
		
	}
	public void updateLendState2(String lendid){
		Session session = sessionFactory.openSession();
		String s2="已归还";
		String s3=lendid;
	
		System.out.println("更改状态二");
		String hql = "update LendBook l set l.lendState='"+s2+"' where l.lendId= '"+s3+"' ";
		Query query = session.createQuery(hql);
		query.executeUpdate();
		
		//归还时间设置
		 Date now = new Date(); 
	     SimpleDateFormat dateFormat = new SimpleDateFormat("yyMMdd");
	     String createdate = dateFormat.format(now);
		
		System.out.println("更改状态三");
		String hql2 = "update LendBook l set l.repayDate='"+createdate+"' where l.lendId= '"+s3+"' ";
		Query query2 = session.createQuery(hql2);
		query2.executeUpdate();
		
		System.out.println(hql);
		System.out.println("更改完毕");
		session.close();
	}

}
