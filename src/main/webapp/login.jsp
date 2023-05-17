<%@page import="java.util.*" %>
<%@page import="com.shopping.connection.DBCon" %>
<%@page import="com.shopping.model.*" %>
<%@page import="com.shopping.Dao.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    User auth=(User)request.getSession().getAttribute("auth");
    if(auth!=null){
         response.sendRedirect("index.jsp"); 
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
<title>Sign in for shopping</title>
<%@include file="/includes/head.jsp"%>
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">

</head>
<body>
<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
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
<div class="main">
<header><div class="container d-flex align-items-center flex-column">
			<div class="divider-custom divider-light">
			</div>
		</div> </header>
		
<br>
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<img src="pageimage/logingif.gif" alt="sing up image">
						</figure>
						
					</div>

					<div class="signin-form">
						<h2 class="form-title">Sign in</h2>
						<form method="post" action="login" id="login-form">
							<div class="form-group">
								<label for="username"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="username" id="username"
									placeholder="Your Name" />
							</div>
							<div class="form-group">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="password" id="password"
									placeholder="Password" />
							</div>
							<div class="form-group">
								
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="Log in" />
							</div>
						</form>
						</div>
						</div>
					</div>
						</section>
				</div>
			
	

	
	<script src="vendor/jquery/jquery.min.js"></script>
	<%@include file="/includes/footer.jsp"%>
</body>
</html>