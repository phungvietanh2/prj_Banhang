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
import java.util.Date;
import java.util.List;
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
            String sql = "INSERT INTO [dbo].[Order] VALUES (? ,? , ?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, date);
            stm.setInt(2, a.getAccID());
            stm.setDouble(3, c.getTotalMoney());
            stm.setString(4, c.getstatus());
            stm.executeUpdate();
            //lay id order vua add
            String sql1 = "select id from [Order] order by id desc";
            PreparedStatement stm1 = connection.prepareStatement(sql1);
            ResultSet rs = stm1.executeQuery();
            //add bang OrderDetail
            while (rs.next()) {
                int oid = rs.getInt("id");
                for (Item i : c.getItems()) {
                    String sql2 = "INSERT INTO [dbo].[OrderLine] VALUES (? ,? , ? , ?)";
                    PreparedStatement stm2 = connection.prepareStatement(sql2);
                    stm2.setInt(1, oid);
                    stm2.setInt(2, i.getProduct().getProductID());
                    stm2.setInt(3, i.getQuantity());
                    stm2.setDouble(4, i.getPrice());

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

    public static void main(String[] args) {
//        OrderDBcontext dao = new OrderDBcontext();
//           ArrayList<Order> a = dao.status( 2 , 2);
//        System.out.println(a);

    }

    //tong so luong ban gia thang hien tai va nam 2022
    public ArrayList<Order> gettotalmoneythang() {
        ArrayList<Order> lists = new ArrayList<>();
        try {
            String sql = "  select top 1 \n"
                    + "		   datepart(yyyy,  [date]) as nam,\n"
                    + "		   datepart(mm,  [date]) as thang,\n"
                    + "\n"
                    + "	sum(totalmoney) as totalmoney\n"
                    + "	from [Order] where datepart(yyyy,  [date]) =  2022 \n"
                    + "	group by datepart(yyyy,  [date]) , datepart(mm,  [date])\n"
                    + "	ORDER BY  datepart(mm,  [date]) DESC";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setTotalmoney(rs.getDouble("totalmoney"));
                lists.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lists;
    }

    //list order DESC moi nhat
    public ArrayList<Order> listorder() {
        ArrayList<Order> lists = new ArrayList<>();
        try {
            String sql = "select q.id , q.date,q.status , q.totalmoney , a.username from [Order] q join Account a on q.accID = a.accID ORDER BY q.id DESC  ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("id"));
                o.setDate(rs.getDate("date"));
                o.setStatus(rs.getInt("status"));
                Account a = new Account();
                a.setUsername(rs.getString("username"));
                o.setAccount(a);
                o.setTotalmoney(rs.getDouble("totalmoney"));
                lists.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lists;
    }
// tim kiem  ngay name o order admin

    public ArrayList<Order> searchlistorder(String key, Date from, Date to, Double price1, Double price2) {
        ArrayList<Order> lists = new ArrayList<>();
        String sql = "select q.id , q.date,q.status , q.totalmoney , a.username from [Order] q join Account a on q.accID = a.accID where 1 =1 ";
        if (key != null && !key.equals("")) {
            sql += "and a.username like '%" + key + "%'";
        }
        if (price1 != null) {
            sql += " and totalmoney>=" + price1;
        }
        if (price2 != null) {
            sql += " and totalmoney<=" + price2;
        }
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
                Order o = new Order();
                o.setId(rs.getInt("id"));
                o.setDate(rs.getDate("date"));
                o.setStatus(rs.getInt("status"));
                Account a = new Account();
                a.setUsername(rs.getString("username"));
                o.setAccount(a);
                o.setTotalmoney(rs.getDouble("totalmoney"));
                lists.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lists;
    }

    // status
    public void status(int id, int a) {
        String sql = "UPDATE [Order]\n"
                + "   SET [status] = ? \n"
                + " WHERE id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, a);
            stm.setInt(2, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
// list danh sách năm của order 

    public ArrayList<Order> chartyear() {
        ArrayList<Order> lists = new ArrayList<>();
        String sql = " select YEAR(datename(year,[date])) as YEARS,\n"
                + "       sum(totalmoney) as [NO(ORDER)]\n"
                + "       from [Order]\n"
                + "       group by YEAR(datename(year,[date]))";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setNam(rs.getInt("YEARS"));
                lists.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lists;
    }
//lấy id năm >> thống kê sản phẩm theo năm 

    public ArrayList<Order> chartgetid(String id) {
        ArrayList<Order> lists = new ArrayList<>();
        String sql = "select \n"
                + "	   datepart(yyyy,  [date]) as nam,\n"
                + "	   datepart(mm,  [date]) as thang,\n"
                + "sum(totalmoney) as totalmoney\n"
                + "from [Order] where datepart(yyyy,  [date]) = ?\n"
                + "group by datepart(yyyy,  [date]) , datepart(mm,  [date]) ORDER BY datepart(yyyy,  [date])";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setNam(rs.getInt("nam"));
                o.setThang(rs.getInt("thang"));
                o.setTotalmoney(rs.getDouble("totalmoney"));
                lists.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lists;
    }

    //Tổng Số Tiền Order admin theo ngay thang nam
    public ArrayList<Order> searctsumorder(Date from, Date to) {
        ArrayList<Order> lists = new ArrayList<>();
        String sql = "select sum(totalmoney) as totalmoney from [Order] where 1 =1 ";
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
                Order o = new Order();
                o.setTotalmoney(rs.getDouble("totalmoney"));
                lists.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lists;
    }

    // count product 
    public int count() {
        String sql = "select count(*) as total  from [Order]";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return -1;
    }

    //phan trang 
    public ArrayList<Order> phantrang(int pageindex, int pagesize) {
        ArrayList<Order> lists = new ArrayList<>();
        try {
            String sql = "select q.id , q.date,q.status , q.totalmoney , a.username from [Order] q join Account a on q.accID = a.accID ORDER BY \n"
                    + " q.id DESC OFFSET (?-1)*? ROWS FETCH NEXT ? ROWS ONLY ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pageindex);
            stm.setInt(2, pagesize);
            stm.setInt(3, pagesize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("id"));
                o.setDate(rs.getDate("date"));
                o.setStatus(rs.getInt("status"));
                Account a = new Account();
                a.setUsername(rs.getString("username"));
                o.setAccount(a);
                o.setTotalmoney(rs.getDouble("totalmoney"));
                lists.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lists;
    }

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
