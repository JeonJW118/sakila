<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "dao.*" %>
<%
	StaffDao staffDao =new StaffDao();
	List<Map<String,Object>> list = staffDao.selectStoreList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="<%=request.getContextPath()%>/index.jsp">index</a>
	<h1>staffList</h1>
	<table border="1">
		<thead>
			<tr>
				<th>staffId</th>
				<th>staffName</th>
				<th>addressId</th>
				<th>staffAddress</th>				
				<th>email</th>
				<th>storeId</th>
				<th>active</th>
				<th>userName</th>
				<th>password</th>
				<th>lastUpdate</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Map m : list){
			%>
				<tr>
					<td><%=m.get("staffId") %></td>
					<td><%=m.get("staffName") %></td>
					<td><%=m.get("addressId") %></td>
					<td><%=m.get("staffAddress") %></td>
					<td><%=m.get("email") %></td>
					<td><%=m.get("storeId") %></td>
					<td><%=m.get("active") %></td>
					<td><%=m.get("userName") %></td>
					<td><%=m.get("password") %></td>
					<td><%=m.get("lastUpdate") %></td>
			<%
				}
			%>
				</tr>
		</tbody>
	</table>
</body>
</html> 