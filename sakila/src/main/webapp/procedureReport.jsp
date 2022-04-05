<%@page import="vo.ActorInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.*"%>
<%
	int min_monthly_purchases = 999;
	int min_dollar_amount_purchased = 999;
	
	RewordDao fd = new RewordDao();
	
	//제일 최상위의 MAP
	Map<String, Object> map = null;
	//그아래 인벤토리아이디의 리스트
	ArrayList<HashMap<String, Object>> list = null;
	// 리스트와 동일한 값으로 들어가는 count(값, 인테이저 하나)
	int count_rewardees = 999;
	
	if(request.getParameter("min_monthly_purchases") != null) { // 널값이 아니라면?
		min_monthly_purchases = Integer.parseInt(request.getParameter("min_monthly_purchases"));
	} 
	
	if(request.getParameter("min_dollar_amount_purchased") != null) { // 널값이 아니라면?
		min_dollar_amount_purchased = Integer.parseInt(request.getParameter("min_dollar_amount_purchased"));
	}
	
	if((request.getParameter("min_monthly_purchases") != null ) && (request.getParameter("min_dollar_amount_purchased") != null)) {
		map = fd.rewordsReport(min_monthly_purchases, min_dollar_amount_purchased);
		
		// 다형성 : object는 모든객체의 부모이다
		list = (ArrayList<HashMap<String, Object>>)map.get("list");
		count_rewardees = (Integer)map.get("count");
		
		
	}
	
	//디버깅코드
	System.out.println(min_monthly_purchases+"xxxxxxx"+min_dollar_amount_purchased);
	System.out.println(list+"xxxxxxx"+count_rewardees);
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
		
	<h1>Provides a customizable report on best customers</h1>
	
		<form method="post" action="<%=request.getContextPath()%>/procedureReport.jsp">
	      <table class ="table table-striped">
	         <tr>
	            <td>min_monthly_purchases</td>
	            <td><input type = "number" name = "min_monthly_purchases"></td>
	         </tr>
	         
	         <tr>
	            <td>min_dollar_amount_purchased	</td>
	            <td><input type = "number" name= "min_dollar_amount_purchased"></td>
	         </tr>
	         
	         <tr>	
	         	<td colspan = "2"><button type="submit">제출</button></td>
	         </tr>
	       </table>
	     </form>
	  
	  
	   <table class ="table table-striped">
		
				<tr>
					<th>customerId</th>
					<th>storeId</th>	
					<th>firstName</th>
					<th>LastName</th>
					<th>Email</th>
					<th>addressId</th>
					<th>active</th>
					<th>createDate</th>
					<th>lastUpdate</th>
				</tr>
				
	  <%
	  	if((request.getParameter("min_monthly_purchases") != null ) && (request.getParameter("min_dollar_amount_purchased") != null)) {
	 
	  		for(HashMap h : list) {
	  			//오브젝트니까 형변환을 해줘야겠지?
	  			//
%>

	  			<tr>
				<td><%=(Integer)h.get("customerId") %></td>
				<td><%=(Integer)h.get("storeId") %></td>
				<td><%=(String)h.get("firstName") %></td>
				<td><%=(String)h.get("lastName") %></td>
				<td><%=(String)h.get("email") %></td>
				<td><%=(String)h.get("addressId") %></td>
				<td><%=(String)h.get("active") %></td>
				<td><%=(String)h.get("createDate") %></td>
				<td><%=(String)h.get("lastUpdate") %></td>
				</tr>
	  			<%
	  			}
	 		  %>
	  		
			<tr>
				<th> count_rewardees</th>
			</tr>
			<tr>
				<td> <%=count_rewardees %></td>
			</tr>	
			<%
		}
	  %>
	  </table>
	  </div>
	  <div class="col-sm-4 container">
	  </div>
	</div>
</body>
</html>