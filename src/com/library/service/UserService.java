package com.library.service;

import java.util.List;

import com.library.model.Stu;

public interface UserService {
	
	//用户——注册
	public boolean register(int stuid,String stuname,String stuage,String stusex,String stupro,String stugrade,String stupw,String restupw,String stuphone);
	//用户——登录
	public int login(int stuid,String stupw);
	//用户——修改密码
	public boolean changePwd(int stuid,String stuoldpw,String stunewpw);
	//用户——查看个人信息
	public Stu showPersonalInfo(int stuid);
	//用户——忘记密码
	public String fgPwdRequest(int stuid);
	public boolean fgPwdResponse(int stuid,String userCode,String newstupwd,String realCode);
	
	
	
}
