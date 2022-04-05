<%@page import="vo.ActorInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.*"%>
<%
	int filmNum = 999;
	int storeNum = 999;
	
	FilmDao fd = new FilmDao();
	
	//제일 최상위의 MAP
	Map<String, Object> map = null;
	//그아래 인벤토리아이디의 리스트
	List<Integer> list = null;
	// 리스트와 동일한 값으로 들어가는 count(값, 인테이저 하나)
	int countByProcedure = 999;
	
	if(request.getParameter("filmNum") != null) { // 널값이 아니라면?
		filmNum = Integer.parseInt(request.getParameter("filmNum"));
	} 
	
	if(request.getParameter("storeNum") != null) { // 널값이 아니라면?
		storeNum = Integer.parseInt(request.getParameter("storeNum"));
	}
	
	if((request.getParameter("filmNum") != null ) && (request.getParameter("storeNum") != null)) {
		map = fd.filmNotInStockCall(filmNum, storeNum);
		
		// 다형성 : object는 모든객체의 부모이다
		list = (List<Integer>)map.get("list");
		countByProcedure = (Integer)map.get("count");
	}
	
	//디버깅코드
	System.out.println(filmNum+"xxxxxxx"+storeNum);
	System.out.println(list+"xxxxxxx"+countByProcedure);
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
		
	<h1>필름 대여 불가능한지 확인</h1>
	
		<form method="post" action="<%=request.getContextPath()%>/procedureFilmNotInStock.jsp">
	      <table class ="table table-striped">
	         <tr>
	            <td>필름 번호 선택 </td>
	            <td><input type = "number" name = "filmNum"></td>
	         </tr>
	         
	         <tr>
	            <td>매장 번호 선택 </td>
	            <td><input type = "number" name= "storeNum"></td>
	         </tr>
	         
	         <tr>	
	         	<td colspan = "2"><button type="submit">제출</button></td>
	         </tr>
	       </table>
	     </form>
	  
	  
	   <table class ="table table-striped">
	         <tr>
	            <th>inventory_id</th>
	         </tr>

	  <%
	  	if((request.getParameter("filmNum") != null ) && (request.getParameter("storeNum") != null)) {
			for(Integer i : list) {
				%>
				<tr>
					<td> <%=i %></td>
				</tr>	
				<%
			}
		  	
			%>
			<tr>
				<th> countByProcedure</th>
			</tr>
			<tr>
				<td> <%=countByProcedure %></td>
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