package com.library.dao;


import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.library.model.Book;



public class AdminPageScienceBookDao {
    public List readFirstTitle(){
        List<Book> list =new ArrayList<Book>();
        Connection con=null;
        PreparedStatement psmt=null;
        ResultSet rs=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try {
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_bookmanage","root","123456");
            String sql="select * from t_book where sort_id = '科学类' ";
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
                list.add(b);
            }

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
        return list;
    }

}
