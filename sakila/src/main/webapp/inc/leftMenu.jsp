<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    	   
		<ol>
		View List
			<li><a href="<%=request.getContextPath() %>/index.jsp">INDEX</a></li>
			<li><a href="<%=request.getContextPath() %>/storeList.jsp">Store List</a></li>
			<li><a href="<%=request.getContextPath() %>/staffList.jsp">Staff List</a></li>
			<li><a href="<%=request.getContextPath() %>/actorList.jsp">Actor List</a></li>
            <li><a href="<%=request.getContextPath()%>/customerList.jsp">Customer List(View)</a></li>
            <li><a href="<%=request.getContextPath()%>/filmList(view).jsp">Film List(View)</a></li>
            <li><a href="<%=request.getContextPath()%>/niceButSlowerFilmList(view).jsp">NicerButSlowerFilm List(view)</a></li>
            <li><a href="<%=request.getContextPath()%>/salesByStoreList(view).jsp">SalesByFilmCategory List(View)</a></li>
            <li><a href="<%=request.getContextPath()%>/salesByStoreList(view).jsp">SalesByStore List(View)</a></li>
		</ol>
		
		<ol>
		Procedure List
			<li><a href="<%=request.getContextPath() %>/procedureFilmInStock.jsp">procedureFilmInStock</a></li>
			<li><a href="<%=request.getContextPath() %>/procedureFilmNotInStock.jsp">procedureFilmNotInStock</a></li>
			<li><a href="<%=request.getContextPath() %>/procedureReport.jsp">procedureReport</a></li>
		</ol>