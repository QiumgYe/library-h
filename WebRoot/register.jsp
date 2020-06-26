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
		<title>注册界面</title>
		<link rel="stylesheet" href="css/reset.css" />
		<link rel="stylesheet" href="css/common.css" />
		<link rel="stylesheet" href="css/font-awesome.min.css" />
		<link rel="stylesheet" href="css/style_num.css" />
		<script type="text/javascript">
		function chgStuage(a) {
			var number = document.getElementById("stuage");
			var p = parseInt(number.value);
			if(a==1 && p<99){
				number.value=p+1;
			}else if(a==0 && p>8){
				number.value=p-1;
			}
		}
		function chgStugrade(a) {
			var number = document.getElementById("stugrade");
			var p = parseInt(number.value);
			if(a==1 && p<20){
				number.value=p+1;
			}else if(a==0 && p>16){
				number.value=p-1;
			}
		}
		</script>
	</head>

	<body leftmargin="25%" topmargin="25%">
    		<div class="wrap login_wrap">
			<div class="content">
				
				<div class="logo"></div>
				
				<div class="login_box">	
					
					<div class="login_form">
						<div class="login_title">
							注册
						</div>
						<form action="user_register.action" method="post">
							
							<div class="form_text_ipt">
								<input name="stuid" type="text" placeholder="学号"  oninput="value=value.replace(/[^\d]/g,'')" maxlength="8">
								<s:fielderror fieldName="tip_stuid" />
							</div>
							<div class="ececk_warning"><span>学号不能为空</span></div>
							
							<div class="form_text_ipt">
								<input name="stuname" type="text" placeholder="姓名" maxlength="8">
								<s:fielderror fieldName="tip_stuname" />
							</div>
							<div class="ececk_warning"><span>姓名不能为空</span></div>
							
							
							<div class="form_num">
								年龄：&emsp;&emsp;&emsp;&emsp;
								<div class="form_num_ipt">
									<input id="stuage" name="stuage" type="text" placeholder="年龄" value="19" oninput="value=value.replace(/[^\d]/g,'')" maxlength="2" onfocus="this.blur()" readonly="true">
								</div>&emsp;
								<button type="button" class="form_num_btn" onclick="chgStuage(1);return false;">+</button>
								<button type="button" class="form_num_btn" onclick="chgStuage(0);return false;">-</button>
							<s:fielderror fieldName="tip_stuage" />
							</div>
							<div class="ececk_warning"><span>年龄不能为空</span></div>
							
							<div class="form_num">
								性别:&emsp;&emsp;&emsp;&emsp;&emsp;
								<input id="man" type="radio" checked="checked" name="stusex" value="男" />男&emsp;
								<input id="woman" type="radio" name="stusex" value="女" />女
							</div>
							<s:fielderror fieldName="tip_stusex" />
							
							
							<!-- <div class="form_text_ipt">
								<input name="stupro" type="text" placeholder="专业">
							</div> -->
							<div class="form_text_ipt">
								<select id="register_select" name="stupro">
									<option value="软件工程" selected="selected">软件工程</option>
									<option value="网络工程">网络工程</option>
									<option value="计算机科学与技术">计算机科学与技术</option>
								</select>
								<s:fielderror fieldName="tip_stupro" />
							</div>
							<div class="ececk_warning"><span>专业不能为空</span></div>
							
							<div class="form_num">
								年级：&emsp;&emsp;&emsp;&emsp;
								<div class="form_num_ipt">
									<input id="stugrade" name="stugrade" type="text" value="17" placeholder="年级" oninput="value=value.replace(/[^\d]/g,'')" maxlength="2" onfocus="this.blur()" readonly="true">
								</div>&emsp;
								<button type="button" class="form_num_btn" value="1" onclick="chgStugrade(1);return false;">+</button>
								<button type="button" class="form_num_btn" value="0" onclick="chgStugrade(0);return false;">-</button>
								<s:fielderror fieldName="tip_stugrade" />
							</div>
							<div class="ececk_warning"><span>年级不能为空</span></div>
							
							<div class="form_text_ipt">
								<input name="stupw" type="password" placeholder="密码">
								<s:fielderror fieldName="tip_stupwd" />
							</div>
							<div class="ececk_warning"><span>密码不能为空</span></div>
							
							<div class="form_text_ipt">
								<input name="restupw" type="password" placeholder="重复密码">
								<s:fielderror fieldName="tip_restupwd" />
							</div>
							<div class="ececk_warning"><span>密码不一致</span></div>
							
							<div class="form_text_ipt">
								<input name="stuphone" type="text" placeholder="手机号"  oninput="value=value.replace(/[^\d]/g,'')" maxlength="11">
								<s:fielderror fieldName="tip_stuphone" />
							</div>
							<div class="ececk_warning"><span>手机号号不能为空</span></div><br/><br/>
							
							<div class="form_btn">
								<input type="submit" value="注册">
							</div>
							
							<div class="form_reg_btn">
								<span>已有帐号？</span><a href="index.jsp">马上登录</a>
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