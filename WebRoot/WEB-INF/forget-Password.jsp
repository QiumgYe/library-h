<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset="utf-8">
		<title>修改密码界面</title>
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
							修改密码
						</div>
						<form action="f-register.action" method="post">
							
							<div class="form_text_ipt">
								<input name="stuid" type="text" placeholder="学号">
							</div>
							<div class="ececk_warning"><span>学号不能为空</span></div>
							
							<div class="form_text_ipt">
								<input name="stuphone" type="text" placeholder="手机号">
							</div>
							<div class="ececk_warning"><span>手机号号不能为空</span></div>
							
							<div class="form_text_ipt">
								<input name="stupw" type="password" placeholder="新密码">
							</div>
							<div class="ececk_warning"><span>新密码不能为空</span></div>
							
							<div class="form_text_ipt">
								<input name="restupw" type="password" placeholder="再次输入新密码">
							</div>
							<div class="ececk_warning"><span>新密码不能为空</span></div>
							
						
							<div class="form_btn">
								<input type="button" onclick="window.location.href='#'" value="点击修改">
							</div>
							
							<div class="form_reg_btn">
								<span>修改成功？</span><a href="index.jsp">马上登录</a>
							</div>
						</form>
						<div class="other_login">
<!-- 							<div class="left other_left"> -->
<!-- 								<span>其它登录方式</span> -->
<!-- 							</div> -->
<!-- 							<div class="right other_right"> -->
<!-- 								<a href="#"><i class="fa fa-qq fa-2x"></i></a> -->
<!-- 								<a href="#"><i class="fa fa-weixin fa-2x"></i></a> -->
<!-- 								<a href="#"><i class="fa fa-weibo fa-2x"></i></a> -->
<!-- 							</div> -->
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
