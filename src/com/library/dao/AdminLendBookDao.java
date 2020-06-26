package com.library.dao;

import java.util.List;

import com.library.model.LendBook;;

public interface AdminLendBookDao {
	//存入借阅信息
	public void save(LendBook l);
	
	//根据学生id找到这个学生借所有书的id
	public List<Integer> getbookAllId(int stuid);
	
	//返回书本数量
	public List<String> RepayBookNum(int bookid);
	
	//根据借阅号确定学生借的书
	public List<Integer> getlendbookAllId(String lendbookid);
	
	//根据借阅号确定学生的学号
	public List<Integer> getlendstuAllId(String lendbookid);
	
	//学生在实体店里面借阅了图书之后，更改图书状态
	public void updateLendState(String lendid);
	//更改状态，已经归还
	public void updateLendState2(String lendid);
}
