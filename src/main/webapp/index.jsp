<%@page import="java.util.*" %>
<%@page import="com.shopping.connection.DBCon" %>
<%@page import="com.shopping.model.*" %>
<%@page import="com.shopping.Dao.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    User auth=(User)request.getSession().getAttribute("auth");
    if(auth != null){
    	request.setAttribute("auth",auth);
    }
    ProductDao pd= new ProductDao(DBCon.getConnection());
    List<Product> product= pd.getAllProducts();
    
    ArrayList<Cart> cart_list=(ArrayList<Cart>) session.getAttribute("cart-list");
    if(cart_list != null){
 	  request.setAttribute("cart_list",cart_list); 
    }
    %>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to Shopping Cart</title>
<%@include file="/includes/head.jsp"%>
</head>
<body id="page-top">
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

<%out.print(DBCon.getConnection()); %>
<header class="masthead bg-primary text-white text-center">
		<div class="container d-flex align-items-center flex-column">
			
			<img class="masthead-avatar mb-5" src="pageimage/indexgif.gif"
				alt="..." />
			<h1 class="masthead-heading mb-0">Start your Shopping with us </h1>
			<div class="divider-custom divider-light">
			</div>
		</div>
	</header>
	<section class="page-section portfolio" id="portfolio">
	<div class="container">
		<div class="page-section-heading text-center text-uppercase text-secondary mb-0">All Products</div>
		<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon"></div>
				<div class="divider-custom-line"></div>
				<div class="divider-custom-line"></div>
			</div>
			<div class="row">
		<%
		if(!product.isEmpty()){
			for(Product p:product){%>
				
				<div class="col-md-3 my-3 my-3">
				<div class="card w-100">
					<img class="card-img-top" src="image/<%=p.getImage() %>" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=p.getName() %></h5>
						<h6 class="price">price:<%=p.getPrice() %></h6>
						<h6 class="category">Category: <%=p.getCategory() %></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a href="add-to-cart?id=<%=p.getId() %>" class="btn btn-dark">Add to Cart</a> <a
								class="btn btn-primary" href="order-now?quantity=1&id=<%=p.getId()%>">Buy Now</a>
						</div>
					</div>
				</div>
			</div>	
			<% }
		}
		%>
	</div>
</div>
	</section>
	<%@include file="/includes/footer.jsp"%>
</body>
</html>