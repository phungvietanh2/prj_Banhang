/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package AdminController;

import DBcontext.BrandDBcontext;
import DBcontext.CategoryDBcontext;
import DBcontext.ProductDBcontext;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;

/**
 *
 * @author phung
 */
public class Addproduct1Controller extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Addproduct1Controller</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Addproduct1Controller at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    BrandDBcontext bandb = new BrandDBcontext();
    CategoryDBcontext catedb = new CategoryDBcontext();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("ban", bandb.list());
        request.setAttribute("cate", catedb.list());
        request.getRequestDispatcher("admin/AddProduct1.jsp").forward(request, response);
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
        String[] indexs = request.getParameterValues("index");
        ProductDBcontext prodb = new ProductDBcontext();
        Product p = new Product();

        for (String index : indexs) {
            p.setName(request.getParameter("name" + index));
            p.setDescription(request.getParameter("Description" + index));
            p.setImg(request.getParameter("Img" + index));
            p.setCategoryID(Integer.parseInt(request.getParameter("Category" + index)));
            p.setBrandID(Integer.parseInt(request.getParameter("Brand" + index)));
            p.setQuantity(Integer.parseInt(request.getParameter("quantity" + index)));
            p.setPrice(Integer.parseInt(request.getParameter("price" + index)));
            p.setDate(Date.valueOf(request.getParameter("date" + index)));
            prodb.insert(p);
 
        }
        request.getRequestDispatcher("Admin").forward(request, response);
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
