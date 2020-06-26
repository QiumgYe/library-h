package com.library.service;

import java.util.List;

import com.library.dao.AdminLendBookDao;
import com.library.model.LendBook;

public class AdminLendBookServiceImpl implements AdminLendBookDao {
	
	private AdminLendBookDao lendbookdao;
	public AdminLendBookDao getLendbookdao() {
		return lendbookdao;
	}
	public void setLendbookdao(AdminLendBookDao lendbookdao) {
		this.lendbookdao = lendbookdao;
	}
	@Override
	public void save(LendBook l) {
		// TODO Auto-generated method stub
		lendbookdao.save(l);
	}
	public List<Integer> getbookAllId(int stuid){
		// TODO Auto-generated method stub
		return lendbookdao.getbookAllId(stuid);
	}
	public List<String> RepayBookNum(int bookid){;
		return lendbookdao.RepayBookNum(bookid);
	}
	
	public List<Integer> getlendbookAllId(String lendbookid){
		return lendbookdao.getlendbookAllId(lendbookid);
	}
	public List<Integer> getlendstuAllId(String lendbookid){
		return lendbookdao.getlendstuAllId(lendbookid);
	}
	public void updateLendState(String lendid){
		lendbookdao.updateLendState(lendid);
	}
	public void updateLendState2(String lendid){
		lendbookdao.updateLendState2(lendid);
	}

}
