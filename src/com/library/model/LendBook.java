package com.library.model;
import java.util.Date;



/**
 *  LendBook  entity. @author MyEclipse Persistence Tools
 */

public class LendBook implements java.io.Serializable {


    // Fields    

     private String lendId;
     private Book book;
     private Stu stu;
     private Date lendDate;
     private Date repayDate;
     private String lendState;
     
     

    // Constructors

   
	/** default constructor */
    public  LendBook () {
    }

	/** minimal constructor */
    public  LendBook (String lendId, Book book, Stu stu, Date lendDate) {
        this.lendId = lendId;
        this.book = book;
        this.stu = stu;
        this.lendDate = lendDate;
    }
    
    /** full constructor */
    public  LendBook (String lendId, Book book, Stu stu, Date lendDate, Date repayDate) {
        this.lendId = lendId;
        this.book = book;
        this.stu = stu;
        this.lendDate = lendDate;
        this.repayDate = repayDate;
    }
    
    public  LendBook (String lendId, Book book, Stu stu, Date lendDate, Date repayDate,String lendState) {
        this.lendId = lendId;
        this.book = book;
        this.stu = stu;
        this.lendDate = lendDate;
        this.repayDate = repayDate;
        this.lendState=lendState;
    }
    
//    public  LendBook (String lendId, int bookid, int stuid, Date lendDate, Date repayDate,String lendState) {
//        this.lendId = lendId;
//        this.bookid=bookid;
//        this.stuid=stuid;
//        this.lendDate = lendDate;
//        this.repayDate = repayDate;
//        this.lendState=lendState;
//    }
    
    
    

   
    // Property accessors

    public String getLendId() {
        return this.lendId;
        
    }
    
    public void setLendId(String lendId) {
        this.lendId = lendId;
    }

    public Book getBook() {
        return this.book;
    }
    
    public void setBook(Book book) {
        this.book = book;
    }

    public Stu getStu() {
        return this.stu;
    }
    
    public void setStu(Stu stu) {
        this.stu = stu;
    }

    public Date getLendDate() {
        return this.lendDate;
    }
    
    public void setLendDate(Date lendDate) {
        this.lendDate = lendDate;
    }

    public Date getRepayDate() {
        return this.repayDate;
    }
    
    public void setRepayDate(Date repayDate) {
        this.repayDate = repayDate;
    }
    public String getLendState() {
		return this.lendState;
	}

	public void setLendState(String lendState) {
		this.lendState = lendState;
	}









}