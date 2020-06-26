<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>
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
							忘记密码
						</div>
						<form action="user_forgetPasswordRequest.action" method="post">
							
							<div class="form_text_ipt">
								<input name="stuid" type="text" placeholder="学号" maxlength="8" oninput="value=value.replace(/[^\d]/g,'')">
								<s:fielderror fieldName="tip_stuold" />
							</div>
							<div class="ececk_warning"><span>学号不能为空</span></div>
							
							<div class="form_btn">
								<input type="submit" value="发送手机验证码">
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
