package com.library.service;

import java.util.List;

import com.library.dao.AdminStuDao;

import com.library.model.Stu;

public class AdminStuServiceImpl implements AdminStuService {

	private AdminStuDao studao;

	public AdminStuDao getStudao() {
		return studao;
	}

	public void setStudao(AdminStuDao studao) {
		this.studao = studao;
	}
	
	
	@Override
	public void deletestu(Stu s) {
		// TODO Auto-generated method stub
		if(s != null){
			studao.delete(s);
		}	
	}

	
	
	@Override
	public Stu getstuById(int id) {
		// TODO Auto-generated method stub
		Stu su=studao.getstuById(id);
		return su;
	}

	@Override
	public void updatestu(Stu s) {
		// TODO Auto-generated method stub
		studao.update(s);
	}
	
	
	@Override
	public List<Integer> getstuAllId(){
		// TODO Auto-generated method stub
		 return studao.getstuAllId();
	}

}
