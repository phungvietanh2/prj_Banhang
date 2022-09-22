/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBcontext;

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
public class ProductDBcontext extends DBcontext<Product> {

    @Override
    public ArrayList<Product> list() {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "select [productID] , [name] , [description] , [img] , [categoryID],"
                    + " [brandID] , [price] ,[gb],[Color] from Product ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("productID"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setImg(rs.getString("img"));
                p.setCategoryID(rs.getInt("categoryID"));
                p.setBrandID(rs.getInt("brandID"));
                p.setPrice(rs.getFloat("price"));
                p.setGb(rs.getString("gb"));
                p.setColor(rs.getString("Color"));
                products.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public static void main(String[] args) {
         ProductDBcontext dao = new ProductDBcontext();
         ArrayList<Product> a = dao.list();
          System.out.println(a);

    }

    @Override
    public Product get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Product model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Product model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Product model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
