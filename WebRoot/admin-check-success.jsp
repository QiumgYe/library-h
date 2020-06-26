<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.util.*,java.sql.*"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="com.library.model.Book"%>
<%@ page import="com.library.dao.AdminPageCheckBookDao"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'admin-check-success.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  借阅号与学号匹配成功，借书成功！<hr>

  <%
  			int a= Integer.parseInt(session.getAttribute("bookid").toString());
			AdminPageCheckBookDao dao=new AdminPageCheckBookDao();
            List<Book> list =dao.readFirstTitle(a);    
            for(Book b:list)
            {%>
						<tr class="border-b">
							
							借阅的书籍ID:<td class="py-2"><%=b.getBookId() %></td><hr>
							借阅的书籍名字:<td class="py-2"><%=b.getBookName() %></td><hr>
							书本的类别是:<td class="py-2"><%=b.getSortId() %></td><hr>
							书本的具体位置是：<td class="py-2"><%= b.getSortId()%></td>,<td class="py-2"><%=b.getBookcaseId() %>号书架,<td class="py-2"><%=b.getBookcaseLayer() %>层<hr>
							
							
							
							
						</tr>
						<%}
			%>
 			<a href="admin-main-check.jsp">继续核对信息</a><hr>
 			<a href="admin-main.jsp">返回首页</a><hr>

  </body>
</html>
