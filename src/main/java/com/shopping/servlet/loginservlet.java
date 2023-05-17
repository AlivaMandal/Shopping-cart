package com.shopping.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import com.shopping.Dao.UserDao;
import com.shopping.connection.DBCon;
import com.shopping.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/login")
public class loginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L; 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String email = request.getParameter("username");
			String password = request.getParameter("password");
			UserDao udao = new UserDao(DBCon.getConnection());
			User user = udao.userLogin(email, password);
			if (user != null) {
				request.getSession().setAttribute("auth", user);
				response.sendRedirect("index.jsp");
			} else {
				out.println("there is no user");
			}
		} catch (ClassNotFoundException|SQLException e) {
			e.printStackTrace();
		} 
	}
}
