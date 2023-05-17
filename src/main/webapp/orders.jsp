<%@page import="java.util.*" %>
<%@page import="com.shopping.connection.DBCon" %>
<%@page import="com.shopping.model.*" %>
<%@page import="com.shopping.Dao.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    User auth=(User)request.getSession().getAttribute("auth");
    List<Order> ord=null;
    if(auth!=null){
    	request.setAttribute("auth", auth);
    	ord = new OrderDao(DBCon.getConnection()).userOrders(auth.getId());
    }else{
          response.sendRedirect("login.jsp");
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
<nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="#page-top">Ecommerce Shopping</a>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="cart.jsp">Cart<span class="badge badge-danger">${cart_list.size()}</span> </a></li>
				
				<% 
				if(auth != null){%>
					<li class="nav-item"><a class="nav-link" href="orders.jsp">Orders</a></li>
					<li class="nav-item"><a class="nav-link" href="log-out">Logout</a></li>
				<% }else{ %>
					<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
		            <% }
				%>
			</ul>
		</div>
	</div>
</nav>
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
			<%
			if(ord!=null){
				for(Order o: ord){%>
				<tr>
				<td><%=o.getDate() %></td>
				<td><%=o.getName() %></td>
				<td><%=o.getCategory() %></td>
				<td><%=o.getQuantity() %></td>
				<td><%=o.getPrice() %></td>
				<td>
				<a class="btn-btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId() %>">Cancel</a>
				</td>
				</tr>			
				<%}
			}
			%>
			</tbody>
		</table>
	</div>
<%@include file="/includes/footer.jsp"%>
</body>
</html>