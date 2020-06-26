package com.library.model;
// default package

import java.util.Date;


/**
 * book entity. @author MyEclipse Persistence Tools
 */

public class Book  implements java.io.Serializable {


    // Fields    

     private Integer bookId;
     private String bookName;
     private String bookAuthor;
     private String bookPub;
     private String bookNum;
     private String sortId;
     private Date bookRecord;
     private Integer bookcaseId;
     private Integer bookcaseLayer;
     


    // Constructors

    /** default constructor */
    public Book() {
    }

	/** minimal constructor */
    public Book(Integer bookId) {
        this.bookId = bookId;
    }
    
    /** minimal constructor */
    public Book(Integer bookId, String bookName, String bookAuthor, String bookPub, String bookNum, String sortId, Date bookRecord) {
        this.bookId = bookId;
        this.bookName = bookName;
        this.bookAuthor = bookAuthor;
        this.bookPub = bookPub;
        this.bookNum = bookNum;
        this.sortId = sortId;
        this.bookRecord = bookRecord;
    }
    
    /** full constructor */
    public Book(Integer bookId, String bookName, String bookAuthor, String bookPub, String bookNum, String sortId, Date bookRecord, Integer bookcaseId, Integer bookcaseLayer) {
        this.bookId = bookId;
        this.bookName = bookName;
        this.bookAuthor = bookAuthor;
        this.bookPub = bookPub;
        this.bookNum = bookNum;
        this.sortId = sortId;
        this.bookRecord = bookRecord;
        this.bookcaseId = bookcaseId;
        this.bookcaseLayer = bookcaseLayer;
    }

   
    // Property accessors

    public Integer getBookId() {
        return this.bookId;
    }
    
    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return this.bookName;
    }
    
    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getBookAuthor() {
        return this.bookAuthor;
    }
    
    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
    }

    public String getBookPub() {
        return this.bookPub;
    }
    
    public void setBookPub(String bookPub) {
        this.bookPub = bookPub;
    }

    public String getBookNum() {
        return this.bookNum;
    }
    
    public void setBookNum(String bookNum) {
        this.bookNum = bookNum;
    }

    public String getSortId() {
        return this.sortId;
    }
    
    public void setSortId(String sortId) {
        this.sortId = sortId;
    }

    public Date getBookRecord() {
        return this.bookRecord;
    }
    
    public void setBookRecord(Date bookRecord) {
        this.bookRecord = bookRecord;
    }

	public Integer getBookcaseId() {
		return bookcaseId;
	}

	public void setBookcaseId(Integer bookcaseId) {
		this.bookcaseId = bookcaseId;
	}

	public Integer getBookcaseLayer() {
		return bookcaseLayer;
	}

	public void setBookcaseLayer(Integer bookcaseLayer) {
		this.bookcaseLayer = bookcaseLayer;
	}
	
	








}