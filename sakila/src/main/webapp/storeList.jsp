<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.*"%>
<%
	StoreDao storeDao = new StoreDao();
	List<Map<String, Object>> list = storeDao.electStoreList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StoreList</title>
</head>
<body>
	<a href = "">index</a>
	<h1>StoreList</h1>
	<table border="1">
		<thead>
			<tr>
				<th>storeId</th>
				<th>staffId</th>
				<th>staffName</th>
				<th>addressId</th>
				<th>staffAddress</th>
				<th>lastUpdate</th>
			</tr>
		</thead>
		<tbody>
			<%  
				for(Map m : list) {
			%>
				<tr><%=m.get("storeId")%></td>
				<tr><%=m.get("staffId")%></td>
				<tr><%=m.get("staffName")%></td>
				<tr><%=m.get("addressId")%></td>
				<tr><%=m.get("staffAddress")%></td>
				<tr><%=m.get("lastUpdate")%></td>
		</tbody>				
	</table>
</body>
</html>