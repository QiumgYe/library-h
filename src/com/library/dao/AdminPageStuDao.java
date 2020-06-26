package com.library.dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.library.model.Stu;



public class AdminPageStuDao {
    public List readFirstTitle(){
        List<Stu> list =new ArrayList<Stu>();
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
            String sql="select * from t_student";
            psmt=con.prepareStatement(sql);
            rs=psmt.executeQuery();

            while(rs.next())
            {
                int stuid=rs.getInt("stu_id");
                String stuname=rs.getString("stu_name");
                String stusex=rs.getString("stu_sex");
                String stuage=rs.getString("stu_age");
                String stupro=rs.getString("stu_pro");
                String stugrade=rs.getString("stu_grade");
                String stuintegrity=rs.getString("stu_integrity");
                String stuphone=rs.getString("stu_phone");
                String stupw=rs.getString("stu_pw");
                Stu s=new Stu(stuid, stuname, stusex, stuage,stupro,stugrade,stuintegrity,stuphone,stupw);
                list.add(s);
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
