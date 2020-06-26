package com.library.service;

import java.util.List;

import com.library.model.LendBook;;

public interface AdminLendBooService {
	//存入借阅号信息
	public void lendbook(LendBook l);
	//取这个学生借的书的所有id
	public List<Integer> getbookAllId(int stuid);
	//取这本书的数量
	public List<String> RepayBookNum(int bookid);
	//根据借阅号获取书本的id
	public List<Integer> getlendbookAllId(String lendbookid);
	//根据借阅号确认学生的id
	public List<Integer> getlendstuAllId(String lendbookid);
	//学生在实体店里面借阅了图书之后，更改图书状态
	public void updateLendState(String lendid);
	//更改状态，已经归还
	public void updateLendState2(String lendid);
}
