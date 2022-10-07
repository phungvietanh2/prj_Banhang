/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package UseController;

import DBcontext.BrandDBcontext;
import DBcontext.ProductDBcontext;
import Model.Cart;
import Model.Item;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author phung
 */
public class DienThoaiController extends HttpServlet {
   
  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        List<Product> list = prodb.list();
       
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                }
            }
        }

        Cart cart = new Cart(txt, list);
        List<Item> lists = cart.getItems();
        int n;
        if (lists != null) {
            n = lists.size();
        } else {
            n = 0;
        }
        BrandDBcontext catdb = new BrandDBcontext();
        String raw_key = request.getParameter("key");
        String raw_key2 = request.getParameter("key2");
        String raw_key12 = request.getParameter("fromprice");
        String raw_key22 = request.getParameter("topprice");
        int id;
        Double p1, p2;
        try {
            id = (raw_key == null) ? 0 : Integer.parseInt(raw_key);
            p1 = ((raw_key12 == null) || (raw_key12.equals(""))) ? null : Double.parseDouble(raw_key12);
            p2 = ((raw_key22 == null) || (raw_key22.equals(""))) ? null : Double.parseDouble(raw_key22);

             List<Product> list1 = prodb.searchproduct(raw_key2, id, p1, p2);
             
             request.setAttribute("product", list1);
            //request.setAttribute("product", prodb.listProductbyid(id));
            request.setAttribute("cid", id);
        } catch (Exception e) {
        }
        request.setAttribute("size", n);

        request.setAttribute("brand", catdb.list());
        request.setAttribute("productdt", prodb.listProductsdienthoai());
        request.getRequestDispatcher("use/Dienthoai.jsp").forward(request, response);
    }
    ProductDBcontext prodb = new ProductDBcontext();


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
