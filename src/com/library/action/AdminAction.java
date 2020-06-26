package com.library.action;

import java.util.Map;

import com.library.model.Book;
import com.library.model.Stu;
import com.library.model.LendBook;
import com.library.service.AdminBookServiceImpl;
import com.library.service.AdminLoginServiceImpl;
import com.library.service.AdminStuServiceImpl;
import com.library.service.AdminLendBookServiceImpl;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AdminAction extends ActionSupport {
	private Book bk;
	
	
	private AdminBookServiceImpl bookservice;//1
	// AdminBookServiceImpl bookservice=new AdminBookServiceImpl();

	private Stu st;
	private AdminStuServiceImpl stuservice;//2

	private AdminLoginServiceImpl loginservice;//3
	private String id;
	private String pw;
	
	private LendBook lb;
	private AdminLendBookServiceImpl lendbookservice;//4
	
	

	public LendBook getLb() {
		return lb;
	}
	public void setLb(LendBook lb) {
		this.lb = lb;
	}
	public AdminLendBookServiceImpl getLendbookservice() {
		return lendbookservice;
	}
	public void setLendbookservice(AdminLendBookServiceImpl lendbookservice) {
		this.lendbookservice = lendbookservice;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public AdminLoginServiceImpl getLoginservice() {
		return loginservice;
	}
	public void setLoginservice(AdminLoginServiceImpl loginservice) {
		this.loginservice = loginservice;
	}
	public Stu getSt() {
		return st;
	}
	public void setSt(Stu st) {
		this.st = st;
	}
	public AdminStuServiceImpl getStuservice() {
		return stuservice;
	}
	public void setStuservice(AdminStuServiceImpl stuservice) {
		this.stuservice = stuservice;
	}
	public Book getBk() {
		return bk;
	}
	public void setBk(Book bk) {
		this.bk = bk;
	}
	public AdminBookServiceImpl getBookservice() {
		return bookservice;
	}
	public void setBookservice(AdminBookServiceImpl bookservice) {
		this.bookservice = bookservice;
	}

	// 管理员登陆
	public String login() {
		if (loginservice.validLogin(getId(), getPw()) > 0) {
			return SUCCESS;
		}
		return ERROR;
	}

	// 添加图书
	public String addbook() {
		int c = bk.getBookId();
		if ((c + "").length() == 4) {
			for (int i = 0; i < bookservice.getbookAllId().size(); i++) {
				if (bookservice.getbookAllId().get(i).equals(bk.getBookId())) {
					return "fail";
				}
			}
			bookservice.addbook(bk);
			return "addbook";
		}
		return "fail";
	}

	// 删除图书
	public String deletebook() {

		if (bookservice.getbookAllId().size() != 0) {
			for (int i = 0; i < bookservice.getbookAllId().size(); i++) {
				if (bookservice.getbookAllId().get(i).equals(bk.getBookId())) {
					Book b = bookservice.getbookById(bk.getBookId());
					bookservice.deletebook(b);
					return "deletebook";
				}
			}
		}
		return "fail";
	}

	// 修改图书
	public String updatebook() {

		if (bookservice.getbookAllId().size() != 0) {
			//bookservice.getbookAllId==list?
			for (int i = 0; i < bookservice.getbookAllId().size(); i++) {
				if (bookservice.getbookAllId().get(i).equals(bk.getBookId())) {
					Book b = bookservice.getbookById(bk.getBookId());
					b.setBookNum(bk.getBookNum());
					
					bookservice.updatebook(b);
					return "updatebook";
				}
			}
		}
		return "fail";
	}

	// 删除用户
	public String deletestu() {

		if (stuservice.getstuAllId().size() != 0) {
			for (int i = 0; i < stuservice.getstuAllId().size(); i++) {
				if (stuservice.getstuAllId().get(i).equals(st.getStuId())) {
					Stu s = stuservice.getstuById(st.getStuId());
					stuservice.deletestu(s);
					return "deletestu";
				}
			}
		}
		return "fail";
	}

	// 修改用户信息
	public String updatestu() {

		if (stuservice.getstuAllId().size() != 0) {
			for (int i = 0; i < stuservice.getstuAllId().size(); i++) {
				if (stuservice.getstuAllId().get(i).equals(st.getStuId())) {
					Stu s = stuservice.getstuById(st.getStuId());
					s.setStuId(st.getStuId());
					s.setStuName(st.getStuName());
					s.setStuIntegrity(st.getStuIntegrity());
					stuservice.updatestu(s);
					return "updatestu";
				}
			}
		}
		return "fail";

	}
	
	//用户借书
	public String lendbook(){
		
	if(lendbookservice.getbookAllId(lb.getStu().getStuId()).size()!= 0){
		for(int i = 0; i < lendbookservice. getbookAllId(lb.getStu().getStuId()).size(); i++){
			if(lendbookservice. getbookAllId(lb.getStu().getStuId()).get(i).equals(lb.getBook().getBookId())){
				return "user-lendbook-fail";
			}
		}
		if(lendbookservice.RepayBookNum(lb.getBook().getBookId()).get(0).equals("0")){
			return "user-lendbook-fail2";
		}
	}
		lendbookservice.save(lb);
		return "lendbook";
	}
	//管理员查询借阅号
	public String check(){
		
		ActionContext actionContext = ActionContext.getContext(); 
		Map session = actionContext.getSession(); 
		session.put("bookid", lendbookservice.getlendbookAllId(lb.getLendId()).get(0));
		
		
	if(lendbookservice.getlendbookAllId(lb.getLendId()).size()!=0){
		if(lendbookservice.getlendstuAllId(lb.getLendId()).get(0).equals(lb.getStu().getStuId())){
			lendbookservice.updateLendState(lb.getLendId());
			return "check";
		}
		else{
			return "fail";
		}
	}
		return "fail";
	}
	//审核管理员帮用户归还书
	public String lend(){
		
		ActionContext actionContext = ActionContext.getContext(); 
		Map session = actionContext.getSession(); 
		session.put("bookid2", lendbookservice.getlendbookAllId(lb.getLendId()).get(0));
		
		
	if(lendbookservice.getlendbookAllId(lb.getLendId()).size()!=0){
		if(lendbookservice.getlendstuAllId(lb.getLendId()).get(0).equals(lb.getStu().getStuId())&&lendbookservice.getlendbookAllId(lb.getLendId()).get(0).equals(lb.getBook().getBookId())){
			lendbookservice.updateLendState2(lb.getLendId());
			return "lend";
		}
		else{
			return "fail";
		}
	}
		return "fail";
	}
}
