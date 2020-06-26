package com.library.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.library.model.Book;
import com.library.model.Stu;
import com.library.service.UserBookService;
import com.library.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {

	//private Stu s;
	private int stuid;
	private String stuname;
	private String stuage;
	private String stusex;
	private String stupro;
	private String stugrade;
	private String stupw;
	private String restupw;
	private String stuphone;
	private String stuoldpw;
	private String stunewpw;
	private String restunewpw;
	private String usercode;

	public int getStuid() {
		return stuid;
	}
	public void setStuid(int stuid) {
		this.stuid = stuid;
	}
	public String getStuname() {
		return stuname;
	}
	public void setStuname(String stuname) {
		this.stuname = stuname;
	}
	public String getStuage() {
		return stuage;
	}
	public void setStuage(String stuage) {
		this.stuage = stuage;
	}
	public String getStusex() {
		return stusex;
	}
	public void setStusex(String stusex) {
		this.stusex = stusex;
	}
	public String getStupro() {
		return stupro;
	}
	public void setStupro(String stupro) {
		this.stupro = stupro;
	}
	public String getStugrade() {
		return stugrade;
	}
	public void setStugrade(String stugrade) {
		this.stugrade = stugrade;
	}
	public String getStupw() {
		return stupw;
	}
	public void setStupw(String stupw) {
		this.stupw = stupw;
	}
	public String getRestupw() {
		return restupw;
	}
	public void setRestupw(String restupw) {
		this.restupw = restupw;
	}
	public String getStuphone() {
		return stuphone;
	}
	public void setStuphone(String stuphone) {
		this.stuphone = stuphone;
	}
	public String getStuoldpw() {
		return stuoldpw;
	}
	public void setStuoldpw(String stuoldpw) {
		this.stuoldpw = stuoldpw;
	}
	public String getStunewpw() {
		return stunewpw;
	}
	public void setStunewpw(String stunewpw) {
		this.stunewpw = stunewpw;
	}
	public String getRestunewpw() {
		return restunewpw;
	}
	public void setRestunewpw(String restunewpw) {
		this.restunewpw = restunewpw;
	}
	public String getUsercode() {
		return usercode;
	}
	public void setUsercode(String usercode) {
		this.usercode = usercode;
	}


	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	private UserBookService userBookService;
	public void setUserBookService(UserBookService userBookService) {
		this.userService = userService;
	}
	
	// 存放个人信息
	Stu resultStu = null;
	// 存放书籍信息
	List<Book> resultBook = null;
	
	//-------------------------方法----------------------------
	
	//获取个人信息
	public void getPersonInfo(){
		ActionContext actionContext = ActionContext.getContext(); 
		Map session = actionContext.getSession(); 
		stuid = Integer.parseInt(session.get("stuid").toString());
		
		resultStu = userService.showPersonalInfo(stuid);
		session.put("stuname", resultStu.getStuName());
		session.put("stusex", resultStu.getStuSex());
		session.put("stuage", resultStu.getStuAge());
		session.put("stupro", resultStu.getStuPro());
		session.put("stugrade", resultStu.getStuGrade());
		session.put("stuphone", resultStu.getStuPhone());
		session.put("stuintergrity",resultStu.getStuIntegrity());
	}

	//-------------------------功能1----------------------------
	
	// 用户注册
	public String register() {
		if(userService.register(stuid, stuname, stuage, stusex, stupro, stugrade, stupw, restupw, stuphone)){
			return "registerSuccess";
		}else{
			addFieldError("tip_stuid", "该学号已被注册！");
			return "register";
		}
	}

	// 用户登录
	public String login() {
		ActionContext actionContext = ActionContext.getContext(); 
		Map session = actionContext.getSession(); 
		session.put("stuid", stuid);
		int loginResult = userService.login(stuid,stupw);
		if(checkLogin()){
			if(loginResult==1){
				//获取个人信息方法
				getPersonInfo();
				return "loginSuccess";
			}else if(loginResult==0){
					addFieldError("tip_stupwd", "登录失败，请检查学号和密码！");
					return "login";
			}else{
					addFieldError("tip_stuid", "登录失败，学号不存在！");
					return "login";
			}
		}else{
			return "login";
		}
	}

	// 用户修改密码
	public String changePwd() {
		if(chechChangePwd()){
			ActionContext actionContext = ActionContext.getContext(); 
			Map session = actionContext.getSession(); 
			if(userService.changePwd(Integer.parseInt(session.get("stuid").toString()),stuoldpw,stunewpw)){
				return "changePwdSuccess";
			}else{
				addFieldError("tip_stuoldpwd","密码错误！");
				return "changePwd";
			}
		}else{
			return "changePwd";
		}
	}

	// 用户查看个人信息
	public String showPersonInfo() {
		//获取个人信息方法
		getPersonInfo();
		return "personalInfo";
	}
	
	//忘记密码
	//请求
	public String forgetPasswordRequest(){
		if(chenckForgetPwdRequest()){
			String realcode = userService.fgPwdRequest(stuid);
			if(realcode.equals("error")){
				addFieldError("tip_stuid","发送错误,请检查学号!");
				return "forgetPasswordRequest";
			}else{
				ActionContext actionContext = ActionContext.getContext();
				Map session = actionContext.getSession();
				session.put("stuid", stuid);
				session.put("realcode", realcode);
				return "forgetPasswordRequestSuccess";
			}
		}else{
			return "forgetPasswordRequest";
		}
	}
	//响应
	public String forgetPasswordResponse(){
		if(chenckForgetPwdResponse()){
			ActionContext actionContext = ActionContext.getContext();
			Map session = actionContext.getSession();
			userService.fgPwdResponse(Integer.parseInt(session.get("stuid").toString()), usercode, stunewpw, session.get("realcode").toString());
			return "forgetPasswordResponseSuccess";
		}else{
			return "forgetPasswordResponse";
		}
	}

	// 查找书籍
	public String searchBook() {
		return "searchResult";
	}

	// 罚金
	public String payFine() {

		return NONE;
	}

	//-------------------------校验----------------------------
	
	//注册校验
	public void validateRegister(){
		//学号
		if(stuid == 0){
			addFieldError("tip_stuid","学号不能为空");
		}else if(stuid<10000000 || stuid>99999999){
			addFieldError("tip_stuid","请输入8位学号");
		}
		//姓名
		if(stuname.equals("")){
			addFieldError("tip_stuname","姓名不能为空");
		}else if(stuname.length()<1 || stuname.length()>8){
			addFieldError("tip_stuname","名字长度为1-8");
		}
		//密码
		if(stupw.equals("")){
			addFieldError("tip_stupwd","密码不能为空");
		}else if(stupw.length()<6 || stupw.length()>18){
			addFieldError("tip_stupwd","密码长度为6-18");
		}
		//重复密码
		if(stupw.equals("")){
			addFieldError("tip_restupwd","重复密码不能为空");
		}
		//电话
		if(stuphone.equals("")){
			addFieldError("tip_stuphone","电话不能为空");
		}else if(stuphone.length() != 11){
			addFieldError("tip_stuphone","请输入11位电话号码");
		}
	}
	
	//登录校验
	public boolean checkLogin(){
		if(stuid == 0){
			addFieldError("tip_stuid","学号不能为空");
			return false;
		}else if(stuid<10000000 || stuid>99999999){
			addFieldError("tip_stuid","请输入8位学号");
			return false;
		}else if(stupw.equals("")){
			addFieldError("tip_stupwd","密码不能为空");
			return false;
		}else{
			return true;
		}
	}
	
	//修改密码校验
	public boolean chechChangePwd(){
		if(stuoldpw.equals("")){
			addFieldError("tip_stuoldpwd","旧密码不能为空");
			return false;
		}else if(stunewpw.equals("")){
			addFieldError("tip_stunewpwd","新密码不能为空");
			return false;
		}else if(restunewpw.equals("")){
			addFieldError("tip_restunewpwd","重复新密码不能为空");
			return false;
		}else if(stunewpw.length()<6 || stunewpw.length()>18){
			addFieldError("tip_stunewpwd","密码长度为6-18");
			return false;
		}else if(!stunewpw.equals(restunewpw)){
			addFieldError("tip_stunewpwd","密码不一致！");
			return false;
		}else{
			return true;
		}
	}
	
	//修改密码校验
	//请求
	public boolean chenckForgetPwdRequest(){
		if(stuid == 0){
			addFieldError("tip_stuid","学号不能为空");
			return false;
		}else if(stuid<10000000 || stuid>99999999){
			addFieldError("tip_stuid","请输入8位学号");
			return false;
		}else{
			return true;
		}
	}
	//响应
	public boolean chenckForgetPwdResponse(){
		if(stunewpw.equals("")){
			addFieldError("tip_stunewpwd","新密码不能为空");
			return false;
		}else if(stunewpw.length()<6 || stunewpw.length()>18){
			addFieldError("tip_stunewpwd","密码长度为6-18");
			return false;
		}else if(!stunewpw.equals(stunewpw)){
			addFieldError("tip_restunewpwd","密码不一致请重新输入");
			return false;
		}else{
			return true;
		}
	}
}
