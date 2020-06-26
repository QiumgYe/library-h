package com.library.service;

import java.util.UUID;

import com.library.dao.UserDao;
import com.library.model.Stu;
import com.library.tool.Sms;

public class UserServiceImpl implements UserService {

	private Stu stu;
	private Sms sms;

	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	public void setSms(Sms sms) {
		this.sms = sms;
	}

	// 注册逻辑
	@Override
	public boolean register(int stuid, String stuname, String stuage, String stusex, String stupro, String stugrade,
			String stupw, String restupw, String stuphone) {
		if(!userDao.checkUser(stuid)){
			userDao.addUser(stuid, stuname, stuage, stusex, stupro, stugrade, stupw, stuphone);
			System.out.println("用户" + stuid + ": 注册");
			return true;
		}else{
			return false;
		}
	}

	// 登录逻辑
	@Override
	public int login(int stuid, String stupw) {
		if(stuid!=0 && userDao.checkUser(stuid)){
			stu = userDao.getPersonalInfo(stuid);
			if (stu.getStuPw().equals(stupw)) {
				System.out.println("用户" + stuid + ": 登录成功");
				return 1;
			} else {
				System.out.println("用户" + stuid + ": 登录失败");
				return 0;
			}
		}else{
			return 2;
		}
	}

	// 修改密码逻辑
	@Override
	public boolean changePwd(int stuid, String stuoldpw, String stunewpw) {
		stu = userDao.getPersonalInfo(stuid);
		if (stu.getStuPw().equals(stuoldpw)) {
			System.out.println("密码正确 - 修改密码");
			userDao.changPwd(stuid, stuoldpw, stunewpw);
			return true;
		}else{
			System.out.println("密码错误 - 拒绝修改");
			return false;
		}
	}

	// 查看个人信息逻辑
	@Override
	public Stu showPersonalInfo(int stuid) {
		stu = userDao.getPersonalInfo(stuid);
		return stu;
	}
	
	//用户——忘记密码
	@Override
	public String fgPwdRequest(int stuid){
		if(userDao.checkUser(stuid)){
			stu = userDao.getPersonalInfo(stuid);
			//生成验证码
			String code = UUID.randomUUID().toString().substring(0, 4);
			sms.SendMessage(stu.getStuPhone(), code);
			return code;
		}else{
			System.out.println("用户"+stuid+"不存在！");
			return "error";
		}		
	}
	@Override
	public boolean fgPwdResponse(int stuid,String userCode,String newstupwd,String realCode){
		if(userCode.equals(realCode)){
			userDao.changPwd(stuid, userDao.getPersonalInfo(stuid).getStuPw(), newstupwd);
			return true;
		}else{
			return false;
		}
	}

}
