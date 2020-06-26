package com.library.dao;

import com.library.action.UserAction;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.library.model.Book;
import com.library.model.LendBook;
import com.library.model.Stu;



public class AdminPageMainBookDao {
    public List readFirstTitle(int stuid){
        List<Stu> liststu =new ArrayList<Stu>();
        List<Book> listbook =new ArrayList<Book>();
        List<LendBook> listlend=new ArrayList<LendBook>();
        int [] arr= new int [100];
        Connection con=null;
        //引入该学生学号！
        
        
        PreparedStatement psmt=null;
        ResultSet rs=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try {
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_bookmanage","root","123456");
            
            //取学生实体
//            String sqlstu="select * from t_student where stu_id = 'stuid' ";
//            psmt=con.prepareStatement(sqlstu);
//            rs=psmt.executeQuery();
//            while(rs.next())
//            {	
//            	 int stuid2=rs.getInt("stu_id");
//                 String stuname=rs.getString("stu_name");
//                 String stusex=rs.getString("stu_sex");
//                 String stuage=rs.getString("stu_age");
//                 String stupro=rs.getString("stu_pro");
//                 String stugrade=rs.getString("stu_grade");
//                 String stuintegrity=rs.getString("stu_integrity");
//                 String stuphone=rs.getString("stu_phone");
//                 String stupw=rs.getString("stu_pw");
//                 Stu s=new Stu(stuid, stuname, stusex, stuage,stupro,stugrade,stuintegrity,stuphone,stupw);
//                 liststu.add(s);
//            }
            //取书号id
            String sqlbook="select book_id from t_lendbook where stu_id ='+"+stuid+"+' ";
            System.out.println(stuid);
            psmt=con.prepareStatement(sqlbook);
            rs=psmt.executeQuery();
            int num=0;
            while(rs.next())
            {	
            	 int bookid=rs.getInt("book_id");
            	 arr[num]=bookid;
            	 num++;
            	
                 
            }
           
            //取书本实体
            for(int i=0;i<arr.length;i++){
            	String sql="select * from t_book where book_id = '+"+arr[i]+"+' ";
                psmt=con.prepareStatement(sql);
                rs=psmt.executeQuery();
                
                while(rs.next())
                {	
                	 int bookid=rs.getInt("book_id");
                     String bookname=rs.getString("book_name");
                     String bookauthor=rs.getString("book_author");
                     String bookpub=rs.getString("book_pub");
                     String booknum=rs.getString("book_num");
                     String sortid=rs.getString("sort_id");
                     Date bookrecord=rs.getDate("book_record");
                     Book b=new Book(bookid, bookname, bookauthor, bookpub,booknum,sortid,bookrecord);
                     listbook.add(b);
                     
                }

            }
            //取借书实体
           
           

        } catch (SQLException e) {
            e.printStackTrace();
        }finally
        {
            try {
                if(rs!=null)
                {
                    rs.close();
                }
                if(psmt!=null)
                {
                    psmt.close();
                }
                if(con!=null)
                {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return listbook;
    }

}
