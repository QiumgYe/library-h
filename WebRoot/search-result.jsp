<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page import="com.library.model.Book" %>
<%@ page import="java.util.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>My JSP 'search-result.jsp' starting page</title>
		<style>
			table-context {
				margin: 100px auto;
				font-family: 'trebuchet MS', 'Lucida sans', Arial;
				font-size: 14px;
				color: #444;
			}

			table {
				*border-collapse: collapse;
				/* IE7 and lower */
				border-spacing: 0;
				width: 100%;
			}

			.bordered {
				border: solid #ccc 1px;
				-moz-border-radius: 6px;
				-webkit-border-radius: 6px;
				border-radius: 6px;
				-webkit-box-shadow: 0 1px 1px #ccc;
				-moz-box-shadow: 0 1px 1px #ccc;
				box-shadow: 0 1px 1px #ccc;
			}

			.bordered tr:hover {
				background: #fbf8e9;
				-o-transition: all 0.1s ease-in-out;
				-webkit-transition: all 0.1s ease-in-out;
				-moz-transition: all 0.1s ease-in-out;
				-ms-transition: all 0.1s ease-in-out;
				transition: all 0.1s ease-in-out;
			}

			.bordered td,
			.bordered th {
				border-left: 1px solid #ccc;
				border-top: 1px solid #ccc;
				padding: 10px;
				text-align: left;
			}

			.bordered th {
				background-color: #dce9f9;
				background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc),
					to(#dce9f9));
				background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);
				background-image: -moz-linear-gradient(top, #ebf3fc, #dce9f9);
				background-image: -ms-linear-gradient(top, #ebf3fc, #dce9f9);
				background-image: -o-linear-gradient(top, #ebf3fc, #dce9f9);
				background-image: linear-gradient(top, #ebf3fc, #dce9f9);
				-webkit-box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
				-moz-box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
				box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
				border-top: none;
				text-shadow: 0 1px 0 rgba(255, 255, 255, .5);
			}

			.bordered td:first-child,
			.bordered th:first-child {
				border-left: none;
			}

			.bordered th:first-child {
				-moz-border-radius: 6px 0 0 0;
				-webkit-border-radius: 6px 0 0 0;
				border-radius: 6px 0 0 0;
			}

			.bordered th:last-child {
				-moz-border-radius: 0 6px 0 0;
				-webkit-border-radius: 0 6px 0 0;
				border-radius: 0 6px 0 0;
			}

			.bordered th:only-child {
				-moz-border-radius: 6px 6px 0 0;
				-webkit-border-radius: 6px 6px 0 0;
				border-radius: 6px 6px 0 0;
			}

			.bordered tr:last-child td:first-child {
				-moz-border-radius: 0 0 0 6px;
				-webkit-border-radius: 0 0 0 6px;
				border-radius: 0 0 0 6px;
			}

			.bordered tr:last-child td:last-child {
				-moz-border-radius: 0 0 6px 0;
				-webkit-border-radius: 0 0 6px 0;
				border-radius: 0 0 6px 0;
			}

			/*----------------------*/
			.zebra td,
			.zebra th {
				padding: 10px;
				border-bottom: 1px solid #f2f2f2;
			}

			.zebra tbody tr:nth-child(even) {
				background: #f5f5f5;
				-webkit-box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
				-moz-box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
				box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
			}

			.zebra th {
				text-align: left;
				text-shadow: 0 1px 0 rgba(255, 255, 255, .5);
				border-bottom: 1px solid #ccc;
				background-color: #eee;
				background-image: -webkit-gradient(linear, left top, left bottom, from(#f5f5f5),
					to(#eee));
				background-image: -webkit-linear-gradient(top, #f5f5f5, #eee);
				background-image: -moz-linear-gradient(top, #f5f5f5, #eee);
				background-image: -ms-linear-gradient(top, #f5f5f5, #eee);
				background-image: -o-linear-gradient(top, #f5f5f5, #eee);
				background-image: linear-gradient(top, #f5f5f5, #eee);
			}

			.zebra th:first-child {
				-moz-border-radius: 6px 0 0 0;
				-webkit-border-radius: 6px 0 0 0;
				border-radius: 6px 0 0 0;
			}

			.zebra th:last-child {
				-moz-border-radius: 0 6px 0 0;
				-webkit-border-radius: 0 6px 0 0;
				border-radius: 0 6px 0 0;
			}

			.zebra th:only-child {
				-moz-border-radius: 6px 6px 0 0;
				-webkit-border-radius: 6px 6px 0 0;
				border-radius: 6px 6px 0 0;
			}

			.zebra tfoot td {
				border-bottom: 0;
				border-top: 1px solid #fff;
				background-color: #f1f1f1;
			}

			.zebra tfoot td:first-child {
				-moz-border-radius: 0 0 0 6px;
				-webkit-border-radius: 0 0 0 6px;
				border-radius: 0 0 0 6px;
			}

			.zebra tfoot td:last-child {
				-moz-border-radius: 0 0 6px 0;
				-webkit-border-radius: 0 0 6px 0;
				border-radius: 0 0 6px 0;
			}

			.zebra tfoot td:only-child {
				-moz-border-radius: 0 0 6px 6px;
				-webkit-border-radius: 0 0 6px 6px border-radius: 0 0 6px 6px
			}

			.zebra tr:hover {
				background: #dde9fb;
			}

			.zebra tbody tr:nth-child(even):hover {
				background: #dde9fb;
			}
		</style>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
	</head>
	<!-- ------------------------------------------------------------------- -->
	<body>
		<table class="zebra">
			<thead>
				<tr>
					<th>#</th>
					<th>书名</th>
					<th>作者</th>
					<th>出版社</th>
					<th>位置</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td>&nbsp;</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tfoot>
			<%
				if(request.getAttribute("result_list")!=null){
					List<Book> list = (List<Book>) request.getAttribute("result_list");
					Book book;
					for(int i=0;i<list.size();i++){
						out.print("<tr>");
						
						book = list.get(i);
						out.print("<td>"+i+1+"</td>");
						out.print("<td>"+book.getBookName()+"</td>");
						out.print("<td>"+book.getBookAuthor()+"</td>");
						out.print("<td>"+book.getBookPub()+"</td>");
						out.print("<td>"+book.getSortId()+"-书架"+book.getBookcaseId()+"-"+book.getBookcaseLayer()+"层</td>");
						
						out.print("</tr>");
					}
				}else{
					System.out.print("未接收到");
				}
			%>
		</table>
	</body>
</html>
