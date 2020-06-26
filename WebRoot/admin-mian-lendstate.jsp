<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.util.*,java.sql.*"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="com.library.model.LendBook"%>
<%@ page import="com.library.dao.AdminPageLendStateDao"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>管理人员主页界面</title>
	<meta name="description" content="A responsive web app template with common components like profile, list, tabs, menu views. Made for Codrops exclusively.">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/output.css">
	<link rel="stylesheet" href="css/default.css">
	<link rel="stylesheet" href="node_modules/tippy.js/dist/themes/light.css">
	<link rel="stylesheet" href="css/style-page.css">
	<script type="text/javascript" src="js/main.js"></script>
	<script type="text/javascript" src="js/tailwind.js"></script>
	<script type="text/javascript" src="js/bundle.js"></script>

  </head>
  
  <body class="bg-grey-lighter font-sans antialiased">
 	<div id="container">
			<div id="header">
				<div id="logo">
					<img src="images/admin-logo.png" width="77px" height="74px" border="0" alt="">
				</div>
				<div id="select">
					<select name="" id="sel">
						<option value="" selected>简体中文</option>
					</select></br>
					<div id="sel">
						<button class="bg-indigo-dark hover:bg-indigo-darker text-white text-sm py-2 px-4 rounded-full transition-normal hover:shadow hover:translate-y-1 active:translate-y-1 focus:outline-none" onclick="window.location.href='admin-Login.jsp'">返回登陆</button>
					</div>
					
				</div>
				
			</div>
			<div id="picture">
				<img src="img/logo_2.jpg" width="990px" height="345px" border="0" alt="">
			</div>
			<div id="nav">
				<table width="100%" height="15px" align="center" cellpadding="0px" cellspacing="0px">
					<tr>
					<td><h1><font size="23"><a href="admin-main.jsp">查看用户</a></font></h1></td>
						<td><h1><font size="23"><a href="admin-main-updateUser.jsp">修改用户</a></font></h1></td>
						<td><h1><font size="23"><a href="admin-main-deleteUser.jsp">删除用户</a></font></h1></td>
						<td><h1><font size="23"><a href="admin-mian-lendstate.jsp">用户借书状态</a></font></h1></td>
					</tr>
				</table>
				<table width="100%" height="15px" align="center" cellpadding="0px" cellspacing="0px">
					<tr>
					
						<td><h1><font size="23"><a href="admin-main-findbook.jsp">查看图书</a></font></h1></td>
						<td><h1><font size="23"><a href="admin-main-addbook.jsp">添加图书</a></font></h1></td>
						<td><h1><font size="23"><a href="admin-main-deletebook.jsp">删除图书</a></font></h1></td>
						<td><h1><font size="23"><a href="admin-main-updatebook.jsp">修改图书</a></font></h1></td>
						<td><h1><font size="23"><a href="admin-main-check.jsp">借书核对</a></font></h1></td>
						<td><h1><font size="23"><a href="admin-main-lend.jsp">归还核对</a></font></h1></td>
					</tr>
				</table>
			</div>
			<hr>
		<div id="main">
			<div id="container">
				<table class="zebra">
					<thead>
						<tr>
							<th>借阅号</th>
							<th>学号</th>
							<th>书号</th>
							<th>借阅日期</th>
							<th>归还日期</th>
							<th>借阅状态</th>
							
						</tr>
					</thead>
					<tbody>
						<%
			AdminPageLendStateDao dao=new AdminPageLendStateDao();
            List<LendBook> list =dao.readFirstTitle();    
            for(LendBook s:list)
            {%>
						<tr>
							<td><%=s.getLendId() %></td>
							
							<td><%=s.getStu().getStuId() %></td>
							<td><%=s.getBook().getBookId() %></td>
							<td><%=s.getLendDate() %></td>
							<%if(s.getRepayDate()==null){
								%><td><font color="red" size="18px">未归还</font></td><%					
							}else{
								%><td><%=s.getRepayDate() %></td><% 
							
							}%>
							
								
													
								
							
							 
							
							
						
							<%if(s.getLendState().equals("已归还")){
								%><td><font color="green">已归还</font></td><%
							}else if(s.getLendState().equals("已到实体店借阅")){
							%><td><font color="red">已到实体店借阅</font></td><%
												
							}else{
								%><td><%=s.getLendState() %></td><% 
							
							}%>
							
						</tr>
						<%}
			%>
					</tbody>
				</table>
			</div>
		</div>	
	</body>
</html>


