<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "dao.ActorInfoDao" %>
<%@ page import = "vo.ActorInfo" %>
<%
	// 현재 페이지
	int currentPage = 1; 
	
	if(request.getParameter("currentPage") != null) { 
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}

	// 페이지당 10행 표시 및 번호 부여
	int rowPerPage = 10;
	int beginRow = (currentPage - 1) * rowPerPage;
	// 마지막 페이지
	int lastPage = 0; 
	ActorInfoDao actorInfoDao = new ActorInfoDao();
	int totalCount = actorInfoDao.selectActorInfoTotalRow(); 
	lastPage = (int)(Math.ceil((double)totalCount / (double)rowPerPage)); 
	
	// beginRow, rowPerPage 값
	List<ActorInfo> list = actorInfoDao.selectActorInfoListByPage(beginRow, rowPerPage);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ActorInfoList</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<h1 class="text-center text-info">ActorInfo List</h1>
	<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-link">index</a>
	<div class="container-fluid">
		<!-- actor_info 리스트 -->
		<table class="table table-dark">
			<tr>
				<th>actorId</th>
				<th>firstName</th>
				<th>lastName</th>
				<th>filmInfo</th>
			</tr>
		<%
			for(ActorInfo a : list) {
		%>
				<tr>
					<td class="text-info"><%=a.getActorId()%></td>
					<td><%=a.getFirstName()%></td>
					<td><%=a.getLastName()%></td>
					<td><%=a.getFilmInfo()%></td>
				</tr>
		<%
			}
		%>
		</table>
		<%
		//현재 페이지가 1보다 크면 이전
			if(currentPage > 1) {
		%>
				<a href="<%=request.getContextPath()%>/ActorInfoList.jsp?currentPage=<%=currentPage-1%>" class="btn btn-outline-info">이전</a>
		<%
			}
		// 현재 페이지가 마지막 페이지보다 작으면 다음
			if(currentPage < lastPage) {
		%>
				<a href="<%=request.getContextPath()%>/ActorInfoList.jsp?currentPage=<%=currentPage+1%>" class="btn btn-outline-info">다음</a>
		<%
			}
		%>
	</div>
</body>
</html> 