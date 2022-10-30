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
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author phung
 */
public class ProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        session.removeAttribute("Product");
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
        String cid_raw = request.getParameter("cid");
        String bid_raw = request.getParameter("bid");
        String price_raw = request.getParameter("price");
        String cid, bid, price;

        if (cid_raw != null && bid_raw != null) {
            cid = request.getParameter("cid");
            bid = request.getParameter("bid");
        } else {
            cid = "0";
            bid = "0";
        }
        if (price_raw != null) {
            price = request.getParameter("price");
        } else {
            price = "0";
        }
        try {
           
            List<Product> search = prodb.searchproduct(cid, bid, price);
            
            session.setAttribute("product", search);

            session.setAttribute("cid", cid);
            session.setAttribute("bid", bid);
            session.setAttribute("price", price);
            request.setAttribute("checksearch", 0);
   
            //request.setAttribute("product", prodb.listProductbyid(id));
            request.setAttribute("size", n);
//
//            request.setAttribute("brand", catdb.list());
//            request.setAttribute("productdt", prodb.listProductsdienthoai());
            request.getRequestDispatcher("use/product.jsp").forward(request, response);
        } catch (Exception e) {
        }

    }
    ProductDBcontext prodb = new ProductDBcontext();

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
