<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta charset="utf-8">
		<title>管理员登录界面</title>
		<link rel="stylesheet" href="css/reset.css" />
		<link rel="stylesheet" href="css/common.css" />
		<link rel="stylesheet" href="css/font-awesome.min.css" />
  </head>
  
  <body leftmargin="25%" topmargin="25%">
        <div class="wrap login_wrap">
			<div class="content">
				<div class="logo"></div>
				<div class="login_box">	
					
					<div class="login_form">
						<div class="login_title">
							管理员登录
						</div>
						<form action="Admin-login.action" method="post">
							
							<div class="form_text_ipt">
								<input name="id"  id="id" type="text" placeholder="管理员ID">
							</div>
							<div class="ececk_warning"><span>管理员ID不能为空</span></div>
							<div class="form_text_ipt">
								<input name="pw"  id="pw" type="password" placeholder="密码">
							</div>
							<div class="ececk_warning"><span>密码不能为空</span></div>
							<div class="form_check_ipt">
								<div class="left check_left">
<!-- 									<label><input name="" type="checkbox"> 下次自动登录</label> -->
								</div>
								<div class="right check_right">
<!-- 									<a href="#">忘记密码</a> -->
								</div>
							</div>
							<div class="form_btn">
								<input type="submit" value="登录">
							</div>
							<div class="form_reg_btn">
<!-- 								<span>还没有帐号？</span><a href="register.jsp">马上注册</a> -->
							</div>
						</form>
						<div class="other_login">
							<div class="left other_left">
								<span><a href="index.jsp">普通用户登陆</a></span>
							</div>
							<div class="right other_right">
<!-- 								<a href="#"><i class="fa fa-qq fa-2x"></i></a> -->
<!-- 								<a href="#"><i class="fa fa-weixin fa-2x"></i></a> -->
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
