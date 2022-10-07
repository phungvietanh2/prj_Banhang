/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBcontext;

import Model.Brand;
import Model.Category;
import Model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
            String sql = "select [productID] , [name] ,[description], [img] ,[categoryID] , [brandID] ,[price] ,quantity  from Product ";
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
                products.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;

    }

    public ArrayList<Product> listProductsdienthoai() {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "select [productID] , [name] ,[description], [img] ,[categoryID] , [brandID] ,[price] ,quantity  from Product  where categoryID = 1 ";
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
                products.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;

    }

    public Product getproductbyid(int id) {

        try {
            String sql = "select [productID]  from Product   where productID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("productID"));
                return p;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Product> listProductbyid(int id) {
        ArrayList<Product> products = new ArrayList<>();
        String sql = "select [productID] , [name] ,[description], [img] ,[categoryID] , [brandID] ,[price] ,quantity  from Product  where 1 = 1 ";
        if(id != 0 )
        {
            sql+=" and brandID="+id;
        }
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("productID"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setImg(rs.getString("img"));
                Brand b = new Brand();
                b.setBrandID(rs.getInt("brandID"));
                p.setBrand(b);
                p.setCategoryID(rs.getInt("categoryID"));
                p.setPrice(rs.getFloat("price"));
                products.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;

    }
    
     public ArrayList<Product> searchproduct(String  key ,int id ,Double price1 ,Double price2) {
        ArrayList<Product> products = new ArrayList<>();
        String sql = "select [productID] , [name] ,[description], [img] ,[categoryID] , [brandID] ,[price] ,quantity  from Product  where 1 = 1 ";
        if(key != null && !key.equals("") )
        {
            sql+="and name like '%"+key+"%' or description like '%"+key+"%' ";
        }
        if(price1!=null)
        {
            sql+=" and price>="+price1;
        }
        if(price2 != null )
        {
             sql+=" and price<="+price2;
        }
        if(id != 0 )
        {
            sql+=" and brandID="+id;
        }
        
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("productID"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setImg(rs.getString("img"));
                Brand b = new Brand();
                b.setBrandID(rs.getInt("brandID"));
                p.setBrand(b);
                p.setCategoryID(rs.getInt("categoryID"));
                p.setPrice(rs.getFloat("price"));
                products.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;

    }

    public void main(String[] args) {
        ProductDBcontext dao = new ProductDBcontext();
        List<Product> a = dao.list();
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
