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