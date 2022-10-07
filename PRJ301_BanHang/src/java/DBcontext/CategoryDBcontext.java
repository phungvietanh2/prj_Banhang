/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBcontext;

import Model.Category;
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
public class CategoryDBcontext extends DBcontext<Category> {

    @Override
    public ArrayList<Category> list() {
        ArrayList<Category> Categorys = new ArrayList<>();
        try {
            String sql = "select categoryID , title from Category ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCategoryID(rs.getInt("categoryID"));
                c.setTitle(rs.getString("title"));
                Categorys.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Categorys;
    }

    @Override
    public Category get(int id) {
        ArrayList<Category> Categorys = new ArrayList<>();
        try {
            String sql = "select categoryID , title from Category where categoryID = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCategoryID(rs.getInt("categoryID"));
                c.setTitle(rs.getString("title"));
                return c;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
      
    }

    @Override
    public void insert(Category model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Category model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Category model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
