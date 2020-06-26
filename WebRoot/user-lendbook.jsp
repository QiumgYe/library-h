<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'user-lendbook.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/reset.css" />
		<link rel="stylesheet" href="css/common.css" />
		<link rel="stylesheet" href="css/font-awesome.min.css" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	
	<%
	//书的id       
     String str=request.getParameter("number");
     //借阅号根据时间
      Date now = new Date(); 
      SimpleDateFormat dateFormat = new SimpleDateFormat("yyMMdd");
      String createdate = dateFormat.format(now);
      int date = Integer.parseInt(createdate);
      int i=(int)(Math.random()*9000)+1000; 
      String lendid=date*10000+i+"";
     
      //借阅时间：
       SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
       String createdate2 = dateFormat2.format(now);
     %>  
  
 	
<!--  	<form action="Admin-lendbook.action" method="post">   -->
<%--         借阅号<input type="text" name="lb.lendId" value="<%=lendid %>">  <hr> --%>
<%--         书号 <input type="text" name="lb.book.bookId" value="<%=str %>">  <hr>  --%>
<%--       你的学号   <input type="text" name="lb.stu.stuId" value="<%=session.getAttribute("stuid") %>"> <hr>   --%>
<%--     借阅时间    <input type="text" name="lb.lendDate" value="<%=createdate2 %>">  <hr> --%>
         
<!--         <input type="submit" value="点击确认"> <a href="main-Art.jsp">退回</a> -->
<!--     </form> -->
    <div class="">
			<div class="">
				<div class="logo"></div>
				<div class="login_box">	
					
					<div class="login_form">
						<div class="login_title">
							关于借阅的全部信息！
						</div>
						<form action="Admin-lendbook.action" method="post">
							
							<div class="form_text_ipt">
							
								<input name="lb.lendId" type="text" value="<%=lendid %>"  oninput="value=value.replace(/[^\d]/g,'')" maxlength="6" readonly="readonly"><h3>借阅号</h3>
								<s:fielderror fieldName="tip_stuid" />
							</div>
							
							<div class="form_text_ipt">
								<input name="lb.book.bookId" type="text" value="<%=str %>"  oninput="value=value.replace(/[^\d]/g,'')" maxlength="6" readonly="readonly"><h3>书号</h3>
								<s:fielderror fieldName="tip_stupwd" />
							</div>
							<div class="form_text_ipt">
								<input name="lb.stu.stuId" type="text" value="<%=session.getAttribute("stuid") %>"  oninput="value=value.replace(/[^\d]/g,'')" maxlength="6" readonly="readonly"><h3>学号</h3>
								<s:fielderror fieldName="tip_stuid" />
							</div>
							
							<div class="form_text_ipt">
								<input name="lb.lendDate" type="text" value="<%=createdate2 %>"  oninput="value=value.replace(/[^\d]/g,'')" maxlength="6" readonly="readonly"><h3>借阅时间</h3>
								<s:fielderror fieldName="tip_stupwd" />
							</div>
							
							<div class="form_text_ipt">
								<input name="lb.lendState" type="text" value="网上已预定借阅"  oninput="value=value.replace(/[^\d]/g,'')" maxlength="6" readonly="readonly"><h3>借阅状态</h3>
								<s:fielderror fieldName="tip_stupwd" />
							</div>
							
							<div class="form_check_ipt">
								<div class="left check_left">
									
								</div>
								<div class="right check_right">
									<a href="main.jsp">返回首页</a>
								</div>
							</div>
							<div class="form_btn">
								<input type="submit" value="点击确认">
							</div>
							<div class="form_reg_btn">
								
							</div>
						</form>
						<div class="other_login">
							<div class="left other_left">
								
							</div>
							<div class="right other_right">
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="js/jquery.min.js" ></script>
		<script type="text/javascript" src="js/common.js" ></script>
		<div style="text-align:center;">

</div>  
  </body>
</html>
