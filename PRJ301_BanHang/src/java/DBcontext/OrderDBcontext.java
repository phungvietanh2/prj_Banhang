/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBcontext;

import Model.Account;
import Model.Cart;
import Model.Item;
import Model.Order;
import Model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author phung
 */
public class OrderDBcontext extends DBcontext<Order> {

    @Override
    public ArrayList<Order> list() {
        return null;
        }

  

    public void addOrder(Account a, Cart c) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            //add order
            String sql = "INSERT INTO [dbo].[Order] VALUES (? ,? , ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, date);
            stm.setInt(2, a.getAccID());
            stm.setDouble(3, c.getTotalMoney());
            stm.executeUpdate();
            //lay id order vua add
            String sql1 = "select id from [Order] order by id desc";
            PreparedStatement stm1 = connection.prepareStatement(sql1);
            ResultSet rs = stm1.executeQuery();
            //add bang OrderDetail
            while (rs.next()) {
                int oid = rs.getInt("id");
                for (Item i : c.getItems()) {
                    String sql2 = "INSERT INTO [dbo].[OrderLine] VALUES (? ,? , ? , ?,?)";
                    PreparedStatement stm2 = connection.prepareStatement(sql2);
                    stm2.setInt(1, oid);
                    stm2.setInt(2, i.getProduct().getProductID());
                    stm2.setInt(3, i.getQuantity());
                    stm2.setDouble(4, i.getPrice());
                    stm2.setString(5, c.getstatus());
                    stm2.executeUpdate();
                }
            }
            //cap nhap lai so luong
            String sql3 = "UPDATE [dbo].[Product] set quantity=quantity-? where productID = ?";
            PreparedStatement stm3 = connection.prepareStatement(sql3);
            for (Item i : c.getItems()) {
                stm3.setInt(1, i.getQuantity());
                stm3.setInt(2, i.getProduct().getProductID());
                stm3.executeUpdate();
            }
        } catch (SQLException e) {
        }
    }

//    public static void main(String[] args) {
//        OrderDBcontext dao = new OrderDBcontext();
//       Order a = dao.getbyid(3);
//        System.out.println(a);
//
//    }

    @Override
    public Order get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Order model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Order model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Order model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
