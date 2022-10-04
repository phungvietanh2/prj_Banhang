/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBcontext;

import Model.OrderDetail;
import Model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author phung
 */
public class OrderDetailDBcontext extends DBcontext<OrderDetail> {

    @Override
    public ArrayList<OrderDetail> list() {
        ArrayList<OrderDetail> OrderDetails = new ArrayList<>();
        try {
            String sql = "select p.name , o.quantity ,o.price , o.[status] from OrderLine o join  Product p on o.productID = p.productID";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                OrderDetail o = new OrderDetail();
                Product p = new Product();
                o.setQuantity(rs.getInt("quantity"));
                o.setPrice(rs.getDouble("price"));
                o.setStatus(rs.getString("status"));
                p.setName(rs.getString("name"));
                o.setProduct(p);
                OrderDetails.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return OrderDetails;
    }
    public static void main(String[] args) {
        OrderDetailDBcontext dao = new OrderDetailDBcontext();
        ArrayList<OrderDetail> a = dao.list();
        System.out.println(a);

    }

    @Override
    public OrderDetail get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(OrderDetail model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(OrderDetail model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(OrderDetail model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
