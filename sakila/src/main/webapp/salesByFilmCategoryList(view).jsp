<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%	
	int currentPage = 1;
	if(request.getParameter("currentPage") != null) { // 이전, 다음 링크를 통해서 들어왔다면
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	System.out.println(currentPage+ " <-- currentPage"); // 디버깅
	
	// 페이지 바뀌면 끝이 아니고, 가지고 오는 데이터가 변경되어야 한다.
	int rowPerPage = 5;
	int beginRow = (currentPage-1)*rowPerPage; // 현재페이지가 변경되면 beginRow도 변경된다. -> 가져오는 데이터 변경된다.
	
	SalesByFilmCategoryDao salesByFilmCategoryDao = new SalesByFilmCategoryDao();
	ArrayList<SalesByFilmCategory> list = salesByFilmCategoryDao.selectSalesByFilmCategoryListByPage(beginRow, rowPerPage);
	
	// 전체 행의수
	int totalCount = salesByFilmCategoryDao.selectSalesByFilmCategoryListTotalRow();
	
	// 마지막페이지 설정
	int lastPage = 0;
	lastPage = (int)(Math.ceil((double)totalCount / (double)rowPerPage));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SalesByFilmCategoryList(view)</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<!-- 상단메뉴 -->
	<div class="col-sm-10 bg-secondary text-white">
		<tr>[스마트혼합]공공데이터 융합자바/스프링 개발자 양성과정(19회차) &nbsp&nbsp Teacher : P.SungHwan &nbsp&nbsp Manager : L.SunMin</tr>
	</div>
	<div class="col-sm-10">
		<div>
			<a class="btn bg-dark text-white" href="<%=request.getContextPath()%>/index.jsp">index</a>
		</div>
		<div class="mt-4 p-5 bg-dark text-white rounded">
			<h1>SalesByFilmCategoryList(view)</h1>
		</div>
	<table class="table table-hover" border = "2">
		<thead>
			<th>category</th>
			<th>totalSales</th>
		</thead>
		<tbody>
			<% 
			for(SalesByFilmCategory a : list) {	
			%>
				<tr>
					 <td><%=a.getCategory()%></td>
					 <td><%=a.getTotalSales()%></td>
				</tr>
			<% 
			}
			%>
		</tbody>
	</table>
	<div class="btn-group">		
	<%
		if(currentPage > 1) { // 현재페이지가 1이면 이전페이지가 존재해서는 안된다.
	%>
			<a class="btn bg-dark text-white" href="<%=request.getContextPath()%>/salesByFilmCategoryList(view).jsp?currentPage=<%=currentPage-1%>">이전</a>&nbsp;&nbsp;&nbsp;
	<%	
		}
		if(currentPage < lastPage) { // 마지막페이지가 있다면 
	%>
		<a class="btn bg-dark text-white" href="<%=request.getContextPath()%>/salesByFilmCategoryList(view).jsp?currentPage=<%=currentPage+1%>">다음</a>&nbsp;&nbsp;&nbsp;
	<%		
		}
	%>
	</div>
	<!--  하단정보표시 -->
	<div class="bg-secondary">
		<div>상호명 : GooDee Academy</div>
		<div>전화 : 02-2108-5900</div>
		<div>팩스 : 02-2108-5909</div>
		<div>사업자등록번호 : 457-85-00300</div>
		<div>홈페이지 : <A href="https://www.gdu.co.kr">https://www.gdu.co.kr</A></div>
		<div>주소 : 서울 금천구 가산디지털2로 115 대륭테크노타운 3차 1109호 71가산디지털단지역 5번 출구에서444m</div>
	</div>
</div>
</body>
</html>