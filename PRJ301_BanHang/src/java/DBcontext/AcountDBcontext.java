/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBcontext;

import Model.Account;
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
            String sql = "select accID , email, phone , fullname , username , password "
                    + ", isAdmin , isCustomer from Account";
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
    public static void main(String[] args) {
        AcountDBcontext dao = new AcountDBcontext();
        ArrayList<Account> a = dao.list();
        System.out.println(a);

    }

    @Override
    public Account get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
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
