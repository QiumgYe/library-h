
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.util.*,java.sql.*"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="com.library.model.Book"%>
<%@ page import="com.library.dao.AdminPageScienceBookDao"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html class="no-js">
  <head>
    <base href="<%=basePath%>">
    <title>主界面-欢迎阅读科学类图书</title>
	<meta name="description" content="A responsive web app template with common components like profile, list, tabs, menu views. Made for Codrops exclusively.">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/output.css">
	<link rel="stylesheet" href="node_modules/tippy.js/dist/themes/light.css">
	<script type="text/javascript" src="js/main.js"></script>
	<script type="text/javascript" src="js/tailwind.js"></script>
	<script type="text/javascript" src="js/bundle.js"></script>
  </head>
  
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
		<input type="search" placeholder="Search" class="w-full text-sm text-white transition border border-transparent focus:outline-none focus:border-indigo placeholder-white rounded bg-indigo-medium py-1 px-2 pl-10 appearance-none leading-normal ds-input">
		<div class="absolute search-icon" style="top: .5rem; left: .8rem;">
		<svg class="fill-current pointer-events-none text-white w-4 h-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
			<path d="M12.9 14.32a8 8 0 1 1 1.41-1.41l5.35 5.33-1.42 1.42-5.33-5.34zM8 14A6 6 0 1 0 8 2a6 6 0 0 0 0 12z"></path>
		</svg>
		</div>
	</span>
		<a href="#" class="text-sm text-right text-white py-2 px-3 hover:text-grey-dark no-underline hidden lg:block lg:w-1/3 px-6">返回登陆</a>
	</div>
</div>
<!--左边导航栏 -->
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
<!-- 中间主要内容 -->
	<div class="flex flex-1 flex-col md:px-6 pt-10" id="content">
		<!-- Title -->
		<div class="px-6 md:px-0 flex justify-between items-center -order-1">
			<div>
				<h2 class="font-normal">欢迎阅读<strong>科学类</strong>图书</h2>
				<p class="text-grey-dark mt-2">本站数据显示</p>
			</div>
<!-- 			<button class="bg-indigo-dark hover:bg-indigo-darker text-white text-sm py-2 px-4 rounded-full transition-normal hover:shadow hover:translate-y-1 active:translate-y-1 focus:outline-none">点击添加新书</button> -->
		</div>
		<!--中上部分 -->
		<div class="hidden px-6 md:px-0 mt-4 md:flex flex-wrap order-1 md:-order-1 md:shadow-md js-tab-pane" id="section-stats">
 			<div class="p-4 px-6 w-full md:rounded-r-none bg-white shadow-md md:shadow-none"> 
				<h4>本站科学类所有图书具体信息如下</h4>
				<table class="mt-4 w-full">
					<thead class="p-2 text-sm leading-loose border-b text-indigo">
						<tr>
							
							<td>书名</td>
							<td>作者</td>
							<td>出版社</td>
							<td>数量</td>
							<td>登记日期</td>	
							<td>编号</td>		
						</tr>
					</thead>
					<tbody class="p-2 leading-loose text-sm">
						
			<%
			AdminPageScienceBookDao dao=new AdminPageScienceBookDao();
            List<Book> list =dao.readFirstTitle();    
            for(Book b:list)
            {%>
						<tr class="border-b">
							
							<td class="py-2"><%=b.getBookName() %></td>
							<td class="py-2"><%=b.getBookAuthor() %></td>
							<td class="py-2"><%=b.getBookPub() %></td>
							<td class="py-2"><%=b.getBookNum() %></td>
							<td class="py-2"><%=b.getBookRecord() %></td>
<%--  							<td class="py-2"><a href="user-lendbook.jsp?bookid=<%=b.getBookId()%>">点击借阅</a></td>  --%>
							<td><form action="user-lendbook.jsp" method="post">  
       									 <input type="text" name="number" value="<%=b.getBookId() %>">  
        									<input type="submit" value="点击借阅">  
    								</form></td>
							
						</tr>
						<%}
			%>
					</tbody>
				</table>
			</div> 
			
		</div>
		<!-- book中间一栏 -->
		<div class="px-6 md:px-0 flex items-baseline justify-between border-b-2 border-grey-light mt-6 order-0 lg:order-1">
			<h4 class="hidden md:inline-block text-grey-dark font-normal">Books</h4>
			<div>
				<div class="inline-block md:hidden no-underline border-indigo pb-2 px-2 text-sm mr-2 text-indigo-darkest hover:cursor-pointer js-tab relative" data-tab="section-stats">Stats</div>
				<div class="no-underline inline-block border-indigo pb-2 px-2 text-sm mr-2 text-indigo-darkest hover:cursor-pointer js-tab active relative" data-tab="section-library">图书馆 <span class="text-indigo text-xs">(7)</span></div>
<!-- 				<div class="no-underline inline-block border-indigo pb-2 px-2 text-sm text-indigo-darkest hover:cursor-pointer js-tab relative" data-tab="section-picks">推荐给你</div> -->
			</div>
		</div>
		<!-- 图书馆的书 -->
		<div class="hidden px-2 pt-2 md:px-0 flex-wrap order-2 pb-8 js-tab-pane active" id="section-library">
			<div class="flex flex-row sm:flex-col items-center sm:items-start w-full xs:w-1/2 sm:w-1/3 md:w-1/5 p-4">
				<img src="./images/book-1034.png" alt="book-02" class="w-1/3 sm:w-full shadow-md transition-normal hover:brighter hover:translate-y-1 hover:shadow-lg hover:border-indigo js-book">
				<div class="ml-3 sm:ml-0 w-2/3 sm:w-full">
					<p class="text-sm my-2 font-medium sm:font-normal">大话西方艺术史</p>
					<p class="block sm:hidden mt-2 mb-3 text-sm leading-medium">Eu quo donec pellentesque, urna velit. Ultrices ante iaculis ligula praesent.</p>
					<label for="" class="hidden sm:inline-block rounded-full bg-indigo text-white px-2 py-1/2 text-xs">图片供参考</label>
					<div class="block sm:hidden relative">
						<select class="block appearance-none w-full text-sm bg-white border border-grey-light hover:border-grey pl-3 py-1 pr-8 rounded shadow leading-normal focus:outline-none focus:shadow-outline">
							<option>Start</option>
							<option>Loaned</option>
							<option>Reading</option>
							<option selected>Reading</option>
						</select>
						<div class="pointer-events-none absolute pin-y pin-r flex items-center px-2 text-grey-darker">
							<svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
								<path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z" />
							</svg>
						</div>
					</div>
				</div>
			</div>
			<div class="flex flex-row sm:flex-col items-center sm:items-start w-full xs:w-1/2 sm:w-1/3 md:w-1/5 p-4">
				<img src="./images/book-1035.png" alt="book-02" class="w-1/3 sm:w-full shadow-md transition-normal hover:brighter hover:translate-y-1 hover:shadow-lg hover:border-indigo js-book">
				<div class="ml-3 sm:ml-0 w-2/3 sm:w-full">
					<p class="text-sm my-2 font-medium sm:font-normal">摄影笔记</p>
					<p class="block sm:hidden mt-2 mb-3 text-sm leading-medium">Eu quo donec pellentesque, urna velit. Ultrices ante iaculis ligula praesent.</p>
					<label for="" class="hidden sm:inline-block rounded-full bg-indigo text-white px-2 py-1/2 text-xs">图片供参考</label>
					<div class="block sm:hidden relative">
						<select class="block appearance-none w-full text-sm bg-white border border-grey-light hover:border-grey pl-3 py-1 pr-8 rounded shadow leading-normal focus:outline-none focus:shadow-outline">
							<option>Start</option>
							<option>Loaned</option>
							<option>Reading</option>
							<option selected>Reading</option>
						</select>
						<div class="pointer-events-none absolute pin-y pin-r flex items-center px-2 text-grey-darker">
							<svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
								<path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z" />
							</svg>
						</div>
					</div>
				</div>
			</div>
			<div class="flex flex-row sm:flex-col items-center sm:items-start w-full xs:w-1/2 sm:w-1/3 md:w-1/5 p-4">
				<img src="./images/book-1036.png" alt="book-02" class="w-1/3 sm:w-full shadow-md transition-normal hover:brighter hover:translate-y-1 hover:shadow-lg hover:border-indigo js-book">
				<div class="ml-3 sm:ml-0 w-2/3 sm:w-full">
					<p class="text-sm my-2 font-medium sm:font-normal">中国艺术史</p>
					<p class="block sm:hidden mt-2 mb-3 text-sm leading-medium">Eu quo donec pellentesque, urna velit. Ultrices ante iaculis ligula praesent.</p>
					<label for="" class="hidden sm:inline-block rounded-full bg-indigo text-white px-2 py-1/2 text-xs">图片供参考</label>
					<div class="block sm:hidden relative">
						<select class="block appearance-none w-full text-sm bg-white border border-grey-light hover:border-grey pl-3 py-1 pr-8 rounded shadow leading-normal focus:outline-none focus:shadow-outline">
							<option>Start</option>
							<option>Loaned</option>
							<option>Reading</option>
							<option selected>Reading</option>
						</select>
						<div class="pointer-events-none absolute pin-y pin-r flex items-center px-2 text-grey-darker">
							<svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
								<path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z" />
							</svg>
						</div>
					</div>
				</div>
			</div>
			<div class="flex flex-row sm:flex-col items-center sm:items-start w-full xs:w-1/2 sm:w-1/3 md:w-1/5 p-4">
				<img src="./images/book-1037.png" alt="book-02" class="w-1/3 sm:w-full shadow-md transition-normal hover:brighter hover:translate-y-1 hover:shadow-lg hover:border-indigo js-book">
				<div class="ml-3 sm:ml-0 w-2/3 sm:w-full">
					<p class="text-sm my-2 font-medium sm:font-normal">艺术与文化</p>
					<p class="block sm:hidden mt-2 mb-3 text-sm leading-medium">Eu quo donec pellentesque, urna velit. Ultrices ante iaculis ligula praesent.</p>
					<label for="" class="hidden sm:inline-block rounded-full bg-indigo text-white px-2 py-1/2 text-xs">图片供参考</label>
					<div class="block sm:hidden relative">
						<select class="block appearance-none w-full text-sm bg-white border border-grey-light hover:border-grey pl-3 py-1 pr-8 rounded shadow leading-normal focus:outline-none focus:shadow-outline">
							<option>Start</option>
							<option>Loaned</option>
							<option>Reading</option>
							<option selected>Reading</option>
						</select>
						<div class="pointer-events-none absolute pin-y pin-r flex items-center px-2 text-grey-darker">
							<svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
								<path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z" />
							</svg>
						</div>
					</div>
				</div>
			</div>
			<div class="flex flex-row sm:flex-col items-center sm:items-start w-full xs:w-1/2 sm:w-1/3 md:w-1/5 p-4">
				<img src="./images/book-1038.png" alt="book-02" class="w-1/3 sm:w-full shadow-md transition-normal hover:brighter hover:translate-y-1 hover:shadow-lg hover:border-indigo js-book">
				<div class="ml-3 sm:ml-0 w-2/3 sm:w-full">
					<p class="text-sm my-2 font-medium sm:font-normal">汉字书法之美</p>
					<p class="block sm:hidden mt-2 mb-3 text-sm leading-medium">Eu quo donec pellentesque, urna velit. Ultrices ante iaculis ligula praesent.</p>
					<label for="" class="hidden sm:inline-block rounded-full bg-indigo text-white px-2 py-1/2 text-xs">图片供参考</label>
					<div class="block sm:hidden relative">
						<select class="block appearance-none w-full text-sm bg-white border border-grey-light hover:border-grey pl-3 py-1 pr-8 rounded shadow leading-normal focus:outline-none focus:shadow-outline">
							<option>Start</option>
							<option>Loaned</option>
							<option>Reading</option>
							<option selected>Reading</option>
						</select>
						<div class="pointer-events-none absolute pin-y pin-r flex items-center px-2 text-grey-darker">
							<svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
								<path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z" />
							</svg>
						</div>
					</div>
				</div>
			</div>
			<div class="flex flex-row sm:flex-col items-center sm:items-start w-full xs:w-1/2 sm:w-1/3 md:w-1/5 p-4">
				<img src="./images/book-1039.png" alt="book-02" class="w-1/3 sm:w-full shadow-md transition-normal hover:brighter hover:translate-y-1 hover:shadow-lg hover:border-indigo js-book">
				<div class="ml-3 sm:ml-0 w-2/3 sm:w-full">
					<p class="text-sm my-2 font-medium sm:font-normal">香港电影史记</p>
					<p class="block sm:hidden mt-2 mb-3 text-sm leading-medium">Eu quo donec pellentesque, urna velit. Ultrices ante iaculis ligula praesent.</p>
					<label for="" class="hidden sm:inline-block rounded-full bg-indigo text-white px-2 py-1/2 text-xs">图片供参考</label>
					<div class="block sm:hidden relative">
						<select class="block appearance-none w-full text-sm bg-white border border-grey-light hover:border-grey pl-3 py-1 pr-8 rounded shadow leading-normal focus:outline-none focus:shadow-outline">
							<option>Start</option>
							<option>Loaned</option>
							<option>Reading</option>
							<option selected>Reading</option>
						</select>
						<div class="pointer-events-none absolute pin-y pin-r flex items-center px-2 text-grey-darker">
							<svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
								<path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z" />
							</svg>
						</div>
					</div>
				</div>
			</div>
			
		</div>
		<!-- 推荐给你的书 -->
<!-- 		<div class="hidden flex-wrap order-2 pt-0 md:pt-6 md:pb-8 js-tab-pane" id="section-picks"> -->
<!-- 			<div class="flex justify-start items-center p-5 px-6 w-full sm:w-1/2" style="background-color:#FBC164;"> -->
<!-- 				<img src="./images/pick-1.jpg" alt="pick" class="shadow-md w-1/3"> -->
<!-- 				<div class="ml-4 mt-1 w-2/3"> -->
<!-- 					<p class="font-medium"> 稻草人手记</p> -->
<!-- 					<p class="mt-3 text-sm">稻草人手记》是2009年3月北京十月文艺出版社出版的图书，作者是三毛。本书主要介绍了作者婚后的平淡琐事以及作者的感想等内容。</p> -->
<!-- 					<button class="shadow-md mt-3 bg-grey-lightest hover:bg-white text-indigo-darker text-xs py-2 px-4 rounded-full transition-normal hover:shadow hover:translate-y-1 active:translate-y-1 focus:outline-none">添加到心愿单</button> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="flex justify-start items-center p-5 px-6  w-full sm:w-1/2" style="background-color:#F1CECD;"> -->
<!-- 				<img src="./images/pick-2.jpg" alt="pick" class="shadow-md w-1/3"> -->
<!-- 				<div class="ml-4 mt-1 w-2/3"> -->
<!-- 					<p class="font-medium">稻草人手记</p> -->
<!-- 					<p class="mt-3 text-sm">稻草人手记》是2009年3月北京十月文艺出版社出版的图书，作者是三毛。本书主要介绍了作者婚后的平淡琐事以及作者的感想等内容。</p> -->
<!-- 					<button class="shadow-md mt-3 bg-grey-lightest hover:bg-white text-indigo-darker text-xs py-2 px-4 rounded-full transition-normal hover:shadow hover:translate-y-1 active:translate-y-1 focus:outline-none">添加到心愿单</button> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="flex justify-start items-center p-5 px-6  w-full sm:w-1/2" style="background-color:#ECE7E9;"> -->
<!-- 				<img src="./images/pick-3.jpg" alt="pick" class="shadow-md w-1/3"> -->
<!-- 				<div class="ml-4 mt-1 w-2/3"> -->
<!-- 					<p class="font-medium">稻草人手记</p> -->
<!-- 					<p class="mt-3 text-sm">稻草人手记》是2009年3月北京十月文艺出版社出版的图书，作者是三毛。本书主要介绍了作者婚后的平淡琐事以及作者的感想等内容。</p> -->
<!-- 					<button class="shadow-md mt-3 bg-grey-lightest hover:bg-white text-indigo-darker text-xs py-2 px-4 rounded-full transition-normal hover:shadow hover:translate-y-1 active:translate-y-1 focus:outline-none">添加到心愿单</button> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="flex justify-start items-center p-5 px-6  w-full sm:w-1/2" style="background-color:#D0E3E8;"> -->
<!-- 				<img src="./images/pick-4.jpg" alt="pick" class="shadow-md w-1/3"> -->
<!-- 				<div class="ml-4 mt-1 w-2/3"> -->
<!-- 					<p class="font-medium">稻草人手记</p> -->
<!-- 					<p class="mt-3 text-sm">稻草人手记》是2009年3月北京十月文艺出版社出版的图书，作者是三毛。本书主要介绍了作者婚后的平淡琐事以及作者的感想等内容。</p> -->
<!-- 					<button class="shadow-md mt-3 bg-grey-lightest hover:bg-white text-indigo-darker text-xs py-2 px-4 rounded-full transition-normal hover:shadow hover:translate-y-1 active:translate-y-1 focus:outline-none">添加到心愿单</button> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
	</div>
	<!-- 个人资料 -->
	<div class="hidden absolute pin-b z-10 lg:relative lg:block w-full lg:w-1/5 bg-grey-lighter-2 px-6 pt-10" id="profile">
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
		</div>
		<div class="my-4 border-t pt-4">
			<h3 class="text-indigo-dark font-normal">祝你有个美好的 <strong>阅读时光</strong></h3>
			<div class="flex flex-wrap -ml-2 justify-start items-center">
				<img src="./images/read-01.jpg" alt="read" class="w-1/6 lg:w-1/5 max-w-tiny shadow-md block m-2 transition-normal hover:brighter">
				<img src="./images/read-02.jpg" alt="read" class="w-1/6 lg:w-1/5 max-w-tiny shadow-md block m-2 transition-normal hover:brighter">
				<img src="./images/read-03.jpg" alt="read" class="w-1/6 lg:w-1/5 max-w-tiny shadow-md block m-2 transition-normal hover:brighter">
				<img src="./images/read-04.jpg" alt="read" class="w-1/6 lg:w-1/5 max-w-tiny shadow-md block m-2 transition-normal hover:brighter">
			</div>
		</div>
		
	</div>
</div>
<!-- 点击图书右键出现的内容 -->
<div class="hidden p-4" id="popup">
	<h3 class="font-medium">图书名字</h3>
	<p class="text-sm mt-2 mb-3">图书介绍</p>
	<div class="relative">
		<select class="block appearance-none w-full text-sm bg-white border border-grey-light hover:border-grey pl-3 py-1 pr-8 rounded shadow leading-normal focus:outline-none focus:shadow-outline" id="tippy-select">
			<option>Start</option>
			<option>Loaned</option>
			<option selected>图书状态</option>
		</select>
		<div class="pointer-events-none absolute pin-y pin-r flex items-center px-2 text-grey-darker">
			<svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
				<path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z" />
			</svg>
		</div>
	</div>
</div>


<script src="bundle.js" async defer></script>
  </body>
</html>
