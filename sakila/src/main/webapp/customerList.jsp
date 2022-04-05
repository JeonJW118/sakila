<%@page import="vo.CustomerList"%>
<%@page import="vo.ActorInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.*"%>
<%

	int currentPage = 1;
	if(request.getParameter("currentPage") !=  null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}

	int rowPerPage = 5;
	int beginRow = (currentPage - 1) * rowPerPage;
	
	CustomerListDao ci = new CustomerListDao();
	List<CustomerList> list = ci.selectCustomerInfoListByPage(beginRow, rowPerPage);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Store List</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="jumbotron text-center" style="margin-bottom:0">
	  <h1>SAKILA DB</h1>
	 <jsp:include page="/inc/upMenu.jsp"></jsp:include>
	</div>

	<br>
	<br>
	<br>
	 
	
	<div class="row">
	
	  <div class="container col-sm-1">
	  </div>
	  <div class="container col-sm-1">
		
		<jsp:include page="/inc/leftMenu.jsp"></jsp:include>
	  </div>
	  <div class="container col-sm-1">
	  </div>
	  
	  <div class="col-sm-5 container">
		
	<h1>Customer List</h1>
	<table border="1" class="table table-striped">
		<thead>
			<tr>
				<th>id</th>
				<th>NAME</th>
				<th>address</th>
				<th>zipCode</th>
				<th>phone</th>
				<th>city</th>
				<th>country</th>
				<th>notes</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(CustomerList c : list) {
			%>
					<tr>
						<td><%=c.getId()%></td>
						<td><%=c.getName()%></td>
						<td><%=c.getAddress()%></td>
						<td><%=c.getZipCode()%></td>
						<td><%=c.getPhone()%></td>
						<td><%=c.getCity()%></td>
						<td><%=c.getCountry()%></td>
						<td><%=c.getNotes()%></td>
					</tr>
			<%
				}
			%>
		</tbody>
		
		<% if(currentPage > 1) {%>
		<A href="<%=request.getContextPath()%>/customerList.jsp?currentPage=<%=currentPage-1%>" class="btn btn-secondary">[이전]</A>
		<%}%>
		<A href="<%=request.getContextPath()%>/customerList.jsp?currentPage=<%=currentPage+1%>" class="btn btn-primary">[다음]</A>
			
	</table>
	  </div>
	  
	  <div class="col-sm-4 container">
	  </div>
	</div>
</body>
</html>