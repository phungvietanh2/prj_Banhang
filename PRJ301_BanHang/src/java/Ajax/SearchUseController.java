/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Ajax;

import DBcontext.ProductDBcontext;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author phung
 */
public class SearchUseController extends HttpServlet {

    ProductDBcontext prodb = new ProductDBcontext();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String text_raw = request.getParameter("key");
        List<Product> listproduct = prodb.searchproduct(text_raw);
        PrintWriter out = response.getWriter();
        for (Product c : listproduct) {
            out.println(" <div  class=\"col-md-3 col-sm-6\">\n"
                    + "                        <div style=\"    background: #fff;\n"
                    + "                             box-shadow: 0 4px 6px #00000029;\n"
                    + "                             margin: 0 10px 10px 0;\n"
                    + "                             border-radius: 10px \" class=\"product-grid2\">\n"
                    + "                            <div class=\"product-image2\">\n"
                    + "                                <a  href=\"#\">\n"
                    + "                                    <img  class=\"pic-1\" src=\"img/iphone/" + c.getImg() + "\">\n"
                    + "                                    <img class=\"pic-2\" src=\"img/iphone/" + c.getImg() + "\">    \n"
                    + "                                </a>\n"
                    + "                                <ul class=\"social\">\n"
                    + "                                    <li><a href=\"#\" data-tip=\"Quick View\"><i class=\"fa fa-eye\"></i></a></li>\n"
                    + "                                    <li><a href=\"#\" data-tip=\"Add to Wishlist\"><i class=\"fa fa-shopping-bag\"></i></a></li>\n"
                    + "                                    <li><a href=\"#\" data-tip=\"Add to Cart\"><i class=\"fa fa-shopping-cart\"></i></a></li>\n"
                    + "                                </ul>\n"
                    + "                                <a class=\"add-to-cart\" href=\"\">Add to cart</a>\n"
                    + "                            </div>\n"
                    + "                            <div class=\"product-content\">\n"
                    + "                                <h3 class=\"title\"><a href=\"#\">" + c.getName() + "</a></h3>\n"
                    + "                                <span class=\"price\">$" + c.getPrice() + "</span>\n"
                    + "                            </div>\n"
                    + "                        </div>\n"
                    + "\n"
                    + "                    </div>");
        }
    }

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
