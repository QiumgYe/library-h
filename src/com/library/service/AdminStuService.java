package com.library.service;

import java.util.List;

import com.library.model.Stu;

public interface AdminStuService {
	
	public void deletestu(Stu s);
	//根据id获取学生实体
	public Stu getstuById(int id);
	
	public void updatestu(Stu s);
	//获取学生的所有id
	public List<Integer> getstuAllId();
}
