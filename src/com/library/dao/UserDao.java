package com.library.dao;

import java.util.List;

import com.library.model.Book;
import com.library.model.Stu;

public interface UserDao {
	
	//检测用户是否存在
	public boolean checkUser(int stuid);
	//添加用户
	public void addUser(int stuid, String stuname, String stuage, String stusex, String stupro, String stugrade,
			String stupw, String stuphone);
	//获取个人信息
	public Stu getPersonalInfo(int stuid);
	//修改个人信息
	public void changePersonalInfo(Stu stu);
	//修改密码
	public void changPwd(int stuid,String stuoldpw,String stunewpw);
	
}
