<%@page import="java.util.*" %>
<%@page import="java.lang.*" %>
<%@page import="com.shopping.connection.DBCon" %>
<%@page import="com.shopping.model.*" %>
<%@page import="com.shopping.Dao.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    User auth=(User)request.getSession().getAttribute("auth");
    if(auth!=null){
    	request.setAttribute("auth",auth);
    }
    ArrayList<Cart> cart_list=(ArrayList<Cart>) session.getAttribute("cart-list");
   List<Cart> cartproduct = null;
   if(cart_list != null){
	   ProductDao pDao = new ProductDao(DBCon.getConnection());
	  cartproduct =  pDao.getCartProduct(cart_list);
	  double total = pDao.getTotalCartPrice(cart_list);
	  
	   request.setAttribute("cart_list",cart_list);
	   request.setAttribute("total",total);
   }
     
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart page</title>
<style type="text/css">

.table tbody td{
vertical-align: middle;
}
.btn-incre, .btn-decre{
box-shadow: none;
font-size: 25px;
}
</style>
<%@include file="/includes/head.jsp"%>
</head>
<body>
<%@include file="/includes/navbar.jsp" %>
<div class="divider-custom">
			</div>
<header><div class="container d-flex align-items-center flex-column">
			<div class="divider-custom divider-light">
			</div>
		</div> </header>
<br>
<div class="container my-3">
		<div class="d-flex py-3"><h3>Total Price: ${(total>0)?total:0} </h3> 
		<a class="mx-3 btn btn-primary" href="cart-check-out">Check Out</a></div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Buy Now</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
		           <%
				if (cart_list != null) {
					for (Cart c : cartproduct) {
				%>
				<tr>
					<td><%=c.getName()%></td>
					<td><%=c.getCategory()%></td>
					<td><%=c.getPrice() %></td>
					<td>
						<form action="order-now" method="post" class="form-inline">
						<input type="hidden" name="id" value="<%= c.getId()%>" class="form-input">
							<div class="form-group d-flex justify-content-between">
								<a class="btn bnt-sm btn-incre" href="quantity-i-d?action=dec&id=<%=c.getId()%>"><i class="fas fa-minus-square"></i></a> 
								<input type="text" name="quantity" class="form-control w=50"  value="<%=c.getQuantity()%>" readonly> 
								<a class="btn btn-sm btn-decre" href="quantity-i-d?action=inc&id=<%=c.getId()%>"><i class="fas fa-plus-square"></i></a>
							</div>
							<button type="submit" class="btn btn-primary btn-sm">Buy</button>
						</form>
					</td>
					<td><a href="remove-from-cart?id=<%=c.getId()%>" class="btn btn-sm btn-danger">Remove</a></td>
				</tr>

				<%
				}}%>
				     
			</tbody>
		</table>
	</div>

<%@include file="/includes/footer.jsp"%>
</body>
</html>