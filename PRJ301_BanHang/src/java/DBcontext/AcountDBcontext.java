/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBcontext;

import Model.Account;
import Model.Information;
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
public class AcountDBcontext extends DBcontext<Account> {

    @Override
    public ArrayList<Account> list() {
        ArrayList<Account> accounts = new ArrayList<>();
        try {
            String sql = "select a.accID ,a.username , a.email , a.fullname , a.phone ,a.isAdmin, a.isCustomer ,a.[password], i.dob , i.img , i.sex , i.[address]\n"
                    + "from\n"
                    + "Account a left join Information i on a.accID=i.accID";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setAccID(rs.getInt("accID"));
                a.setEmail(rs.getString("email"));
                a.setPhone(rs.getString("phone"));
                a.setFullname(rs.getString("fullname"));
                a.setUsername(rs.getString("username"));
                a.setPassword(rs.getString("password"));
                a.setIsAdmin(rs.getBoolean("isAdmin"));
                a.setIsCustomer(rs.getBoolean("isCustomer"));
                Information i = new Information();
                i.setAddress(rs.getString("address"));
                i.setSex(rs.getString("sex"));
                i.setImg(rs.getString("img"));
                i.setDob(rs.getDate("dob"));
                a.setInformation(i);
                accounts.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AcountDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return accounts;
    }

    public Account getAccountbyuserpass(String user, String Pass) {
        try {
            String sql = "select accID , email, phone , fullname , username , password "
                    + ", isAdmin , isCustomer from Account where username = ? and password = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, user);
            stm.setString(2, Pass);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setAccID(rs.getInt("accID"));
                a.setEmail(rs.getString("email"));
                a.setPhone(rs.getString("phone"));
                a.setFullname(rs.getString("fullname"));
                a.setUsername(rs.getString("username"));
                a.setPassword(rs.getString("password"));
                a.setIsAdmin(rs.getBoolean("isAdmin"));
                a.setIsCustomer(rs.getBoolean("isCustomer"));
                return a;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AcountDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
// sign up

    public Account getsignup(String phone, String name, String gmail, String pass) {
        try {
            String sql = "INSERT INTO [dbo].[Account]\n"
                    + "           ([email]\n"
                    + "           ,[phone]\n"
                    + "           ,[username]\n"
                    + "           ,[password] \n"
                    + "           ,[isAdmin]\n"
                    + "		   ,[isCustomer])\n"
                    + "     VALUES (?,?,?,?, '0' ,'1' ) ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, gmail);
            stm.setString(2, phone);
            stm.setString(3, name);
            stm.setString(4, pass);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AcountDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    // check gmail

    public Account getgmail(String gmail) {
        try {
            String sql = "select email from Account where email = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, gmail);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setEmail(rs.getString("email"));
                return a;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AcountDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
 // UPDE 
    public Account updateacc(String Gmail, String Phone, String Fullname, String Usename,
            String pass, String isAdmin, String isCustomer ,String id) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [email] =?\n"
                + "      ,[phone] =?\n"
                + "      ,[fullname] = ? \n"
                + "      ,[username] = ?\n"
                + "      ,[password] = ?\n"
                + "      ,[isAdmin]  = ?\n"
                + "      ,[isCustomer] = ?\n"
                + " WHERE accID = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, Gmail);
            stm.setString(2, Phone);
            stm.setString(3, Fullname);
            stm.setString(4, Usename);
            stm.setString(5, pass);
            stm.setString(6, isAdmin);
            stm.setString(7, isCustomer);
            stm.setString(8, id);
            stm.executeUpdate();
        } catch (Exception e) {
        }
        return null;
    }

    public Account getid(String id) {
        try {
            String sql = "select accID , email ,phone ,fullname ,username ,password ,isAdmin ,isCustomer from Account where accID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setAccID(rs.getInt("accID"));
                a.setEmail(rs.getString("email"));
                a.setPhone(rs.getString("phone"));
                a.setFullname(rs.getString("fullname"));
                a.setUsername(rs.getString("username"));
                a.setPassword(rs.getString("password"));
                a.setIsAdmin(rs.getBoolean("isAdmin"));
                a.setIsCustomer(rs.getBoolean("isCustomer"));
                return a;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AcountDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    // xoa id acc 
     public Account Deleteid(String id) {
        try {
            String sql = "DELETE FROM Account  WHERE accID =  ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AcountDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public Account get(int id) {

        return null;
    }

    @Override
    public void insert(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
