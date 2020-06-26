package com.library.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.library.model.Book;
import com.library.model.Stu;

public class UserDaoImpl implements UserDao {
	
	private Stu stu;
	private List<Stu> result_list;
	
	private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	//检测用户是否存在
	@Override
	public boolean checkUser(int stuid){
		Session se = getSessionFactory().openSession();
		se.beginTransaction();
		
		String hql = "select stuId from Stu where stuId="+stuid;
		Query query = se.createQuery(hql);
		result_list = query.list();se.getTransaction().commit();
		se.close();
		if(result_list.size()==0){
			return false;
		}else{
			return true;
		}
	}
	//添加用户
	@Override
	public void addUser(int stuid, String stuname, String stuage, String stusex, String stupro, String stugrade, String stupw, String stuphone){
		Session se = getSessionFactory().openSession();
		se.beginTransaction();
		
		stu = new Stu();
		stu.setStuId(stuid);
		stu.setStuName(stuname);
		stu.setStuAge(stuage);
		stu.setStuSex(stusex);
		stu.setStuPro(stupro);
		stu.setStuGrade(stugrade);
		stu.setStuPw(stupw);
		stu.setStuPhone(stuphone);
		
		//保存强制提交
		se.save(stu);
		se.flush();
		se.getTransaction();
		
		se.getTransaction().commit();
		se.close();
	}	
	
	//获取个人信息
	@Override
	public Stu getPersonalInfo(int stuid) {
		Session se = getSessionFactory().openSession();
		se.beginTransaction();
		
		String hql = "from Stu where stuId="+stuid;
		Query query = se.createQuery(hql);
		result_list = query.list();
		se.getTransaction().commit();
		se.close();
		System.out.println("获取个人信息结果为：" + result_list.size());
		stu = result_list.get(0);
		return stu;
	}
	
	//修改密码
	@Override 
	public void changPwd(int stuid,String stuoldpw,String stunewpw){
		Session se = getSessionFactory().openSession();
		se.beginTransaction();
		
		String hql="update Stu set stuPw=? where stuId=?";
		Query query  = se.createQuery(hql); 
		query.setString(0,stunewpw);
		query.setInteger(1,stuid);
		query.executeUpdate();
		
		se.getTransaction().commit();
		se.close();
	}
	
	//修改个人信息
	@Override
	public void changePersonalInfo(Stu stu) {
		// 建立连接开启事务
		Session se = getSessionFactory().openSession();
		se.beginTransaction();
		
		//保存强制提交
		se.save(stu);
		se.flush();
		se.getTransaction();
	}

}
