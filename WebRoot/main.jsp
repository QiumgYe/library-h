
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.util.*,java.sql.*"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="com.library.model.Book"%>
<%@ page import="com.library.model.LendBook"%>
<%@ page import="com.library.dao.AdminPageMainBookDao"%>
<%@ page import="com.library.dao.AdminPageMainLendBookDao"%>
 


<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html class="no-js">
  <head>
    <base href="<%=basePath%>">
    <title>主界面</title>
	<meta name="description" content="A responsive web app template with common components like profile, list, tabs, menu views. Made for Codrops exclusively.">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/output.css">
	<link rel="stylesheet" href="node_modules/tippy.js/dist/themes/light.css">
	<script type="text/javascript" src="js/main.js"></script>
	<script type="text/javascript" src="js/tailwind.js"></script>
	<script type="text/javascript" src="js/bundle.js"></script>
	<link rel="stylesheet" href="css/SearchForm.css">
<script type="text/javascript">
	function onKeyPress(e){
		if(e.which)
			keyCode = e.which;
		else if(e.keyCode)
			keyCode = e.keyCode;
		if(keyCode == 13){
			window.location="userBook_searhResult.action";
		}
		return true;
	}
</script>
  </head>
<!--   顶部导航栏 -->
  <body class="bg-grey-lighter font-sans antialiased">
 <div class="bg-indigo-darker text-center p-4 px-6 flex items-center">
	<div class="hidden lg:block lg:w-1/4 xl:w-1/5 pr-8">
		<a href="#" class="flex justify-start pl-6">
		<img src="./images/logo.svg" class="" alt="logo">
	</a>
	</div>
	<div class="lg:hidden pr-3" id="mobile-nav-trigger">
		<div class="toggle p-2 block"><span></span></div>
	</div>
	<div class="flex flex-grow items-center lg:w-3/4 xl:w-4/5">
		<span class="relative w-full">
		<form id="searchForm" action="userBook_searchInfo.action" method="post">
			<input id="searchInfo" name="searchInfo" onkeypress="onKeyPress(event)" type="text" placeholder="Search" class="w-full text-sm text-white transition border border-transparent focus:outline-none focus:border-indigo placeholder-white rounded bg-indigo-medium py-1 px-2 pl-10 appearance-none leading-normal ds-input">
		</form>
		<div class="absolute search-icon" style="top: .5rem; left: .8rem;">
		<svg class="fill-current pointer-events-none text-white w-4 h-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
			<path d="M12.9 14.32a8 8 0 1 1 1.41-1.41l5.35 5.33-1.42 1.42-5.33-5.34zM8 14A6 6 0 1 0 8 2a6 6 0 0 0 0 12z"></path>
		</svg>
		</div>
	</span>
		<a href="#" class="text-sm text-right text-white py-2 px-3 hover:text-grey-dark no-underline hidden lg:block lg:w-1/3 px-6">返回登陆</a>
	</div>
</div>
<!-- 左边导航栏	 -->
<div class="flex">
	<!-- Side Nav -->
	<nav class="absolute lg:relative lg:flex lg:text-sm bg-indigo-darker lg:bg-transparent pin-l pin-r py-4 px-6 lg:pt-10 lg:pl-12 lg:pr-6 -mt-1 lg:mt-0 overflow-y-auto lg:w-1/5 lg:border-r z-40 hidden">
		<ul class="list-reset mb-8 w-full">
			<li class="ml-2 mb-4 flex">
				<img src="./images/home-default.svg" alt="home-icon" class="w-4 h-4 mr-2">
				<div class="hover:cursor-pointer text-white lg:text-indigo-darkest no-underline font-medium mobile-home-trigger"><a href="main.jsp">主页</a></div>
			</li>
			<li class="ml-2 mb-4">
				<div class="flex" id="sidenav-categories-trigger">
					<img src="./images/category-default.svg" alt="home-icon" class="w-4 h-4 mr-2">
					<div class="hover:cursor-pointer text-white lg:text-indigo-darkest no-underline font-medium w-full relative">
						分类目录
						<div class="pointer-events-none absolute pin-y pin-r flex items-center px-1 text-grey-darker" id="sidenav-icon">
							<svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
								<path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z" />
							</svg>
						</div>
					</div>
				</div>
				<ul class="text-grey lg:text-grey-dark list-reset leading-loose mt-2" id="sidenav-categories">
					<li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4"><a href="main-Story.jsp">小说类</a></li>
					<li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4"><a href="main-Youth.jsp">青春类</a></li>
					<li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4"><a href="main-Literature.jsp">文学类</a></li>
					<li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4"><a href="main-Life.jsp">生活类</a></li>
					<li class="text-indigo-lighter lg:text-indigo-darker font-medium flex justify-between items-center hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4 mobile-home-trigger">
						<span><a href="main-Art.jsp">艺术类</a></span>
						<span class="bg-indigo-dark text-white text-xs rounded-full px-2 leading-normal">7</span>
					</li>
					<li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4"><a href="main-History.jsp">历史类</a></li>
					<li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4"><a href="main-Management.jsp">管理类</a></li>
					<li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4"><a href="main-Philosophy.jsp">哲学类</a></li>
					<li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4"><a href="main-Science.jsp">科学类</a></li>
					<li class="hover:text-indigo-dark hover:cursor-pointer transition-normal ml-1 border-l border-grey-dark pl-4"><a href="main-Economic.jsp">经济类</a></li>
				
					
				</ul>
			</li>
<!-- 			<li class="ml-2 mb-4 flex"> -->
<!-- 				<img src="./images/wishlist-default.svg" alt="wishlist-icon" class="w-4 h-4 mr-2"> -->
<!-- 				<div class="hover:cursor-pointer text-white lg:text-indigo-darkest no-underline font-medium mobile-home-trigger">心愿单</div> -->
<!-- 			</li> -->
			<li class="ml-2 mb-4 flex lg:hidden">
				<img src="./images/profile-default.svg" alt="profile-icon" class="w-4 h-4 mr-2">
				<div class="hover:cursor-pointer text-white lg:text-indigo-darkest no-underline font-medium" id="mobile-profile-trigger">Profile</div>
			</li>
		</ul>
	</nav>
<!-- 中间个人信息 -->
<div class="flex flex-1 flex-col md:px-6 pt-10" id="content">
	<div class="flex items-center mb-6">
			<svg width="60px" height="60px" viewBox="0 0 60 60" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" id="avatar">
				<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
					<g transform="translate(-1178.000000, -87.000000)">
						<g transform="translate(1159.000000, 0.000000)">
							<g transform="translate(0.000000, 87.000000)">
								<g transform="translate(19.000000, 0.000000)">
									<circle id="small-circle" fill="#5661B3" cx="30" cy="30" r="30"></circle>
									<path id="moon" d="M30.5,49.7304688 C40.7172679,49.7304688 30.5,43.266096 30.5,33.0488281 C30.5,22.8315603 40.7172679,12 30.5,12 C20.2827321,12 11.0390625,20.6479665 11.0390625,30.8652344 C11.0390625,41.0825022 20.2827321,49.7304688 30.5,49.7304688 Z" fill="#F4E1E0"></path>
									<circle id="big-circle" fill="#070707" cx="31" cy="31" r="11"></circle>
								</g>
							</g>
						</g>
					</g>
				</g>
			</svg>
			<div class="ml-3">
				<p><%=session.getAttribute("stuid") %></p>
				<p class="text-grey-dark mt-1 text-sm">2020年加入</p>
			</div>
			<div class="px-6 md: flex justify-between items-center -order-1">
			<button class="bg-indigo-dark hover:bg-indigo-darker text-white text-sm py-2 px-4 rounded-full transition-normal hover:shadow hover:translate-y-1 active:translate-y-1 focus:outline-none" onclick="window.location.href='user_showPersonInfo.action'">点击查看个人信息</button>
			</div>
		</div>
		<div class="my-4 border-t pt-4">
<!-- 			<h3 class="text-indigo-dark font-normal">2020年您已阅读 <strong>?本书</strong> </h3>	 -->
		</div>
		<div class="p-4 px-6 w-full md:w-2/3 rounded md:rounded-r-none bg-white shadow-md md:shadow-none">
			<h4>以下是你借阅图书的全部信息</h4>
				<table class="mt-4 w-full">
					<thead class="p-2 text-sm leading-loose border-b text-indigo">
						<tr>
						<td>借阅编号</td>
						<td>书本编号</td>
						<td>借阅时间</td>
						<td>归还时间</td>
						<td>借阅状态</td>
					</tr>
				</thead>
				<tbody class="p-2 leading-loose text-sm">
					<%
					int i=0;
					int stuid=Integer.parseInt(session.getAttribute("stuid").toString());
					AdminPageMainLendBookDao dao=new AdminPageMainLendBookDao();
		            List<LendBook> list =dao.readFirstTitle(stuid);    
		            for(LendBook b:list){
		            %>
						<tr class="border-b">
						<td class="py-2"><%=b.getLendId() %></td> 
<%-- 						<td class="py-2"><%=b.getBook().getBookAuthor() %></td> --%>
<%-- 						<td class="py-2"><%=b.getBook().getBookPub() %></td> --%>
<%-- 						<td class="py-2"><%=b.getBook().getSortId() %></td> --%>
						<td>
							<form action="user-lendbook.jsp" method="post">  
				       			<input id="bookid" class="main-repay-form" type="text" name="number" value="<%=b.getBook().getBookId() %>" disabled="disabled" />  
				        		 
				    		</form>
		    			</td>	
						<td class="py-2"><%=b.getLendDate() %></td>
						<%if(b.getRepayDate()==null){
								%><td><font color="red">未归还</font></td><%					
							}else{
								%><td><font color="green"><%=b.getRepayDate() %></font></td><% 
							
							}%>
							
							
						<%if(b.getLendState().equals("已归还")){
								%><td><font color="green">已归还</font></td><%
							}else if(b.getLendState().equals("已到实体店借阅")){
							%><td><font color="red">已到实体店借阅</font></td><%
							
							}else if(b.getLendState().equals("网上已预定借阅")){
							%><td><font color="black">网上已预定借阅</font></td><%					
							}else{
								%><td><%=b.getLendState() %></td><% 
							
							}%>	
						</tr>
					<%	
					i++;}
					%>	
					<h3 class="text-indigo-dark font-normal">2020年您已借阅 <strong><%=i%>本书</strong> </h3>	
				</tbody>
			</table>
		</div>
	</div>
</div>
  </body>
</html>
