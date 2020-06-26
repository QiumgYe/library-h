package com.library.dao;


import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.library.model.LendBook;
import com.library.model.Book;
import com.library.model.Stu;



public class AdminPageLendStateDao {
    public List readFirstTitle(){
        List<LendBook> list =new ArrayList<LendBook>();
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
            String sql="select * from t_lendbook";
            psmt=con.prepareStatement(sql);
            rs=psmt.executeQuery();

            while(rs.next())
            {
            	Book book=new Book();
                Stu stu=new Stu();
                String lendid=rs.getString("lend_id");
                book.setBookId(rs.getInt("book_id"));
                stu.setStuId(rs.getInt("stu_id"));
                Date lenddate=rs.getDate("lend_date");
                Date repaydate=rs.getDate("repay_date");
                String lendstate=rs.getString("lend_state");
                LendBook b=new LendBook(lendid, book, stu,lenddate,repaydate,lendstate);
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
