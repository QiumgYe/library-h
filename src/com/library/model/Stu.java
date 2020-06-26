package com.library.model;
// default package



/**
 * stu entity. @author MyEclipse Persistence Tools
 */

public class Stu  implements java.io.Serializable {


    // Fields    

     private Integer stuId;
     private String stuName;
     private String stuSex;
     private String stuAge;
     private String stuPro;
     private String stuGrade;
     private String stuIntegrity;
     private String stuPhone;
     private String stuPw;


    // Constructors

    /** default constructor */
    public Stu() {
    }

	/** minimal constructor */
    public Stu(Integer stuId) {
        this.stuId = stuId;
    }
    
    /** full constructor */
    public Stu(Integer stuId, String stuName, String stuSex, String stuAge, String stuPro, String stuGrade, String stuIntegrity, String stuPhone, String stuPw) {
        this.stuId = stuId;
        this.stuName = stuName;
        this.stuSex = stuSex;
        this.stuAge = stuAge;
        this.stuPro = stuPro;
        this.stuGrade = stuGrade;
        this.stuIntegrity = stuIntegrity;
        this.stuPhone = stuPhone;
        this.stuPw = stuPw;
    }

   
    // Property accessors

    public Integer getStuId() {
        return this.stuId;
    }
    
    public void setStuId(Integer stuId) {
        this.stuId = stuId;
    }

    public String getStuName() {
        return this.stuName;
    }
    
    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public String getStuSex() {
        return this.stuSex;
    }
    
    public void setStuSex(String stuSex) {
        this.stuSex = stuSex;
    }

    public String getStuAge() {
        return this.stuAge;
    }
    
    public void setStuAge(String stuAge) {
        this.stuAge = stuAge;
    }

    public String getStuPro() {
        return this.stuPro;
    }
    
    public void setStuPro(String stuPro) {
        this.stuPro = stuPro;
    }

    public String getStuGrade() {
        return this.stuGrade;
    }
    
    public void setStuGrade(String stuGrade) {
        this.stuGrade = stuGrade;
    }

    public String getStuIntegrity() {
        return this.stuIntegrity;
    }
    
    public void setStuIntegrity(String stuIntegrity) {
        this.stuIntegrity = stuIntegrity;
    }

    public String getStuPhone() {
        return this.stuPhone;
    }
    
    public void setStuPhone(String stuPhone) {
        this.stuPhone = stuPhone;
    }

    public String getStuPw() {
        return this.stuPw;
    }
    
    public void setStuPw(String stuPw) {
        this.stuPw = stuPw;
    }
   








}