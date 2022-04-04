<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>INDEX</h1>
	<ol>
		<li> <a href ="<%=request.getContextPath()%>/storeList.jsp">Store List</a> </li>
		<li> <a href ="<%=request.getContextPath()%>/staffList.jsp">Staff List</a> </li>
		<li> <a href ="<%=request.getContextPath()%>/actionInfoList.jsp">ActionInfo List</a> </li>
		<li> <a href ="<%=request.getContextPath()%>/customerList.jsp">Customer List</a> </li>
		<li> <a href ="<%=request.getContextPath()%>/filmListt.jsp">Film List</a> </li>
		<li> <a href ="<%=request.getContextPath()%>/nicerButSlowFilmList.jsp">Nicer But Slow Film List</a> </li>
		<li> <a href ="<%=request.getContextPath()%>/salesByFilmCategory.jsp">sales By Film Category</a> </li>
		<li> <a href ="<%=request.getContextPath()%>/staffListView.jsp">Staff List View</a> </li>
	</ol>
</body>

</html>