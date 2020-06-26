package com.library.dao;

import java.util.List;

import com.library.model.Stu;

public interface AdminStuDao {
		//删除用户
		public void delete(Stu s);
		//修改用户
		public void update(Stu s);
		//根据ID找到这个人
		public Stu getstuById(int id);
		//搜索数据库里面所有的id
		public List<Integer> getstuAllId();
}
