package com.shopping.servlet;
import com.shopping.model.*;
import java.util.*;
import java.text.SimpleDateFormat; 
import com.shopping.Dao.*;
import com.shopping.connection.DBCon;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
@WebServlet("/order-now")
public class OrderNowservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			
			User auth = (User) request.getSession().getAttribute("auth");
			if(auth != null) {
				  String productId = request.getParameter("id");
				  int productQuantity = Integer.parseInt(request.getParameter("quantity"));
				  if(productQuantity <=0) {
					  productQuantity = 1;
				  }
				  Order ordermodel = new Order();
				  ordermodel.setId(Integer.parseInt(productId));
				  ordermodel.setUid(auth.getId());
				  ordermodel.setQuantity(productQuantity);
				  ordermodel.setDate(formatter.format(date));
				  
				  OrderDao orderdao = new OrderDao(DBCon.getConnection());
				  boolean result=orderdao.insertOrder(ordermodel);
				  
				  if(result) {
					  ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
						if(cart_list!=null) {
							for(Cart c:cart_list) {
								if(c.getId()==Integer.parseInt(productId)) {
									cart_list.remove(cart_list.indexOf(c));
									break;
								}
							}
						}
					  response.sendRedirect("orders.jsp");
				  }else {
					  out.println("Order Failed!!");
				  }
				
			} else {
				response.sendRedirect("login.jsp");
			}
        } catch(Exception e) {
        	e.printStackTrace();
        }
	}
    

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
