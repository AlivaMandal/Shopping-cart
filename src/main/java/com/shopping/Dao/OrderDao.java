package com.shopping.Dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import com.shopping.model.*;
public class OrderDao {
	private Connection con;
	private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    public OrderDao(Connection con) {
    	this.con = con;
    }
    public boolean insertOrder(Order model) {
        boolean result = false;
        try {
            query = "insert into orders (p_id, u_id, o_quantity, o_date) values(?,?,?,?)";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, model.getId());
            pst.setInt(2, model.getUid());
            pst.setInt(3, model.getQuantity());
            pst.setString(4, model.getDate());
            pst.executeUpdate();
            result = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }
    public List<Order> userOrders(int id){
    	List<Order> list = new ArrayList<Order>();
    	try {
    		query="select * from orders where u_id=? order by orders.o_id desc";
    		pst=this.con.prepareStatement(query);
    		pst.setInt(1, id);
    		rs=pst.executeQuery();
    		while(rs.next()) {
    			Order order= new Order();
    			ProductDao productdao = new ProductDao(this.con);
    			int pid=rs.getInt("p_id");
    			Product prdt = productdao.getSingleProduct(pid);
    			order.setOrderId(rs.getInt("o_id"));
    			order.setId(pid);
    			order.setName(prdt.getName());
    			order.setCategory(prdt.getCategory());
    			order.setPrice(prdt.getPrice()*rs.getInt("o_quantity"));
    			order.setQuantity(rs.getInt("o_quantity"));
    			order.setDate(rs.getString("0_date"));
    			list.add(order);
    		}
    		
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
		return list;
    }
    public void cancelOrder(int id) {
        try {
            query = "delete from orders where o_id=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            pst.execute();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
    }
}
