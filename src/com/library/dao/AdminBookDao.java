package com.library.dao;
import java.util.List;
import com.library.model.*;

public interface AdminBookDao {
	//添加图书
	public void save(Book b);
	//删除图书
	public void delete(Book b);
	//修改图书
	public void update(Book b);
	//根据ID找到这本图书
	public Book getbookById(int id);
	//找到数据库所有的书名id
	public List<Integer> getbookAllId();
	
	
}