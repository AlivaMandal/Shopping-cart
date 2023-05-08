<%@page import="java.util.*" %>
<%@page import="com.shopping.connection.DBCon" %>
<%@page import="com.shopping.model.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    User auth=(User)request.getSession().getAttribute("auth");
    if(auth!=null){
    	request.setAttribute("auth",auth);
    }
    
    ArrayList<Cart> cart_list=(ArrayList<Cart>) session.getAttribute("cart-list");
    if(cart_list!=null){
 	  request.setAttribute("cart_list",cart_list); 
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>order page</title>
<%@include file="/includes/head.jsp"%>

</head>
<body>
<%@include file="/includes/navbar.jsp" %>
<div class="container my-3">
<div class="divider-custom">
			</div>
<header><div class="container d-flex align-items-center flex-column">
			<div class="divider-custom divider-light">
			</div>
		</div> </header>
<br>

		<div class="d-flex py-3"><h3>All Orders </h3>
		<a></a></div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
			
	
			</tbody>
		</table>
	</div>
		
		</div>
<%@include file="/includes/footer.jsp"%>
</body>
</html>