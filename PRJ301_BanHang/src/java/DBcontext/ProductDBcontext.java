/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBcontext;

import Model.Brand;
import Model.Category;
import Model.OrderDetail;
import Model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author phung
 */
public class ProductDBcontext extends DBcontext<Product> {

    //list sản phẩm 
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
    // list điện thoai 

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
    // list ipad

    public ArrayList<Product> listProductipad() {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "select [productID] , [name] ,[description], [img] ,[categoryID] , [brandID] ,[price] ,quantity  from Product  where categoryID = 2 ";
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
    // list laptop

    public ArrayList<Product> listProductlabtop() {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "select [productID] , [name] ,[description], [img] ,[categoryID] , [brandID] ,[price] ,quantity  from Product  where categoryID = 3 ";
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
    // lấy id của sản phẩm 

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
    // lấy id của sản phẩm 

    public ArrayList<Product> getidproduct(String id) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "select [productID] , [name] ,[description], [img] ,[categoryID] , [brandID] ,[price] ,quantity  from Product  where productID = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
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
    // 

    public ArrayList<Product> listProductbyid(int id) {
        ArrayList<Product> products = new ArrayList<>();
        String sql = "select [productID] , [name] ,[description], [img] ,[categoryID] , [brandID] ,[price] ,quantity  from Product  where 1 = 1 ";
        if (id != 0) {
            sql += " and brandID=" + id;
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

    // tim kiem use product
    public ArrayList<Product> searchproduct(String cid, String bid, String price) {
        ArrayList<Product> products = new ArrayList<>();
        String sql = "select [productID] , [name] ,[description], [img] ,[categoryID] , [brandID] ,[price] ,quantity  from Product  where 1 = 1 ";
        if (!cid.equals("0")) {
            sql += " and categoryID = " + cid;
            if (!bid.equals("0")) {
                sql += " and brandID = " + bid;
            }
        }
        if (!price.equals("0")) {
            sql += " and price ";
            switch (price) {
                case "1":
                    sql += "between 0 and 20";
                    break;
                case "2":
                    sql += "between 21 and 30";
                    break;
                case "3":
                    sql += "between 31 and 50";
                    break;
                case "4":
                    sql += " > 50";
                    break;
            }
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
//tim kiem product admin 

    public ArrayList<Product> searchproductadmin(String key) {
        ArrayList<Product> products = new ArrayList<>();
        String sql = "select [productID] , [name] ,[description], [img] ,[categoryID] , [brandID] ,[price] ,quantity  from Product  where 1 = 1 ";
        if (key != null && !key.equals("")) {
            sql += " and [name] like '%" + key + "%' or description like '%" + key + "%'";
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

    //top 10 san pham ban chay nhat admin 
    public ArrayList<Product> listtopproduct() {
        ArrayList<Product> products = new ArrayList<>();
        String sql = "select top 5 p.name ,  count(od.quantity) as quantity from OrderLine od\n"
                + "	left join  Product p on od.productID= p.productID  GROUP BY p.name  ORDER BY quantity DESC";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setName(rs.getString("name"));
                OrderDetail o = new OrderDetail();
                o.setQuantity(rs.getInt("quantity"));
                p.setOrderDetail(o);
                products.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;

    }

    //tim kiem sum price product  ngay nam admin
    public ArrayList<Product> searchsumprice(Date from, Date to) {
        ArrayList<Product> products = new ArrayList<>();
        String sql = "select sum(price) as price from Product where 1 = 1";
        if (from != null) {
            sql += " and [date]>='" + from + "'";
        }
        if (to != null) {
            sql += " and [date]<='" + to + "'";
        }
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setPrice(rs.getFloat("price"));
                products.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;

    }

    //search product
    public ArrayList<Product> searchproduct(String key) {
        ArrayList<Product> products = new ArrayList<>();
        String sql = "select [productID] , [name] ,[description], [img] ,[categoryID] , [brandID] ,[price] ,quantity  from Product  where 1 = 1 ";
        if (key != null && !key.equals("")) {
            sql += " and [name] like '%" + key + "%'";
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

    //load more
    public ArrayList<Product> loadmore(int key) {
        ArrayList<Product> products = new ArrayList<>();
        String sql = "select [productID] , [name] ,[description], [img] ,[categoryID] , [brandID] ,[price] ,quantity  from Product  \n"
                + "order by [productID] \n"
                + "OFFSET ? ROWS FETCH NEXT 1 ROW ONLY";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, key);
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
        List<Product> a = dao.searchproduct("1", "1", "0");
        System.out.println(a);

    }

    @Override
    public Product get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Product model) {
        try {
            String sql = " INSERT INTO [dbo].[Product]\n"
                    + "           ([name]\n"
                    + "           ,[description]\n"
                    + "           ,[img]\n"
                    + "           ,[categoryID]\n"
                    + "           ,[brandID]\n"
                    + "           ,[quantity]\n"
                    + "           ,[price]\n"
                    + "           ,[date])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "          ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getName());
            stm.setString(2, model.getDescription());
            stm.setString(3, model.getImg());
            stm.setInt(4, model.getCategoryID());
            stm.setInt(5, model.getBrandID());
            stm.setInt(6, model.getQuantity());
            stm.setFloat(7, model.getPrice());
            stm.setDate(8, model.getDate());
            stm.executeUpdate();
            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBcontext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(ProductDBcontext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(ProductDBcontext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public void update(Product model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void delete(String id) {
        try {
            String sql = "DELETE FROM [dbo].[Product]\n"
                    + "      WHERE productID =  ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return;
    }

    @Override
    public void delete(Product model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
