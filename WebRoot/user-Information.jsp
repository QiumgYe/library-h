<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>用户个人信息界面</title>
	<meta name="description" content="A responsive web app template with common components like profile, list, tabs, menu views. Made for Codrops exclusively.">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/output.css">
	<link rel="stylesheet" href="css/default.css">
	<link rel="stylesheet" href="node_modules/tippy.js/dist/themes/light.css">
	<script type="text/javascript" src="js/main.js"></script>
	<script type="text/javascript" src="js/tailwind.js"></script>
	<script type="text/javascript" src="js/bundle.js"></script>

  </head>
  
  <body class="bg-grey-lighter font-sans antialiased">
 	<div id="container">
			<div id="header">
				<div id="logo">
					<img src="images/user-logo.png" width="77px" height="74px" border="0" alt="">
				</div>
				<div id="select">
					<select name="" id="sel">
						<option value="" selected>简体中文</option>
					</select></br>
					<div id="sel"> 
						<button class="bg-indigo-dark hover:bg-indigo-darker text-white text-sm py-2 px-4 rounded-full transition-normal hover:shadow hover:translate-y-1 active:translate-y-1 focus:outline-none" onclick="window.location.href='main.jsp'">返回主界面</button>
 					</div> 
			
					
				</div>
				
			</div>
			<div id="picture">
				<img src="img/logo_2.jpg" width="990px" height="345px" border="0" alt="">
			</div>
			<div id="nav">
				<table width="100%" height="40px" align="center" cellpadding="0px" cellspacing="0px">
					<tr>
						<td><h1><font size="23">用户个人信息界面</font></h1></td>
					</tr>
				</table>
			</div>
			<div id="main">
				<table width="100%" height="40px" align="center" cellpadding="0px" cellspacing="0px">
					<tr>
						<td>学号</td>
						<td>姓名</td>
						<td>性别</td>
						<td>年龄</td>
						<td>专业</td>
						<td>班级</td>
						<td>电话</td>
						<td>密码</td>
						<td>诚信度</td>	
					</tr>
					<tr>
						<td><%=session.getAttribute("stuid") %></td>
						<td><%=session.getAttribute("stuname") %></td>
						<td><%=session.getAttribute("stusex") %></td>
						<td><%=session.getAttribute("stuage") %></td>
						<td><%=session.getAttribute("stupro") %></td>
						<td><%=session.getAttribute("stugrade") %></td>
						<td><%=session.getAttribute("stuphone") %></td>
						<td><button class="bg-indigo-dark hover:bg-indigo-darker text-white text-sm py-2 px-4 rounded-full transition-normal hover:shadow hover:translate-y-1 active:translate-y-1 focus:outline-none" onclick="window.location.href='change-Password.jsp'">修改密码</button></td>
						<td><%=session.getAttribute("stuintergrity") %></td>	
					</tr>
				</table>
				
			
			</div>
			
			
			
			
	</div>
 	
 	
 	
  
  </body>


 
</html>
