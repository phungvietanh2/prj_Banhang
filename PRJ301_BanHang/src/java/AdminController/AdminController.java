/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package AdminController;

import DBcontext.AcountDBcontext;
import DBcontext.OrderDBcontext;
import DBcontext.OrderDetailDBcontext;
import Model.Order;
import Model.OrderDetail;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author phung
 */
public class AdminController extends HttpServlet {

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
        request.setAttribute("o1", ordb.gettotalmoneythang());
        request.setAttribute("o2", ordb.listorder());
        request.setAttribute("acc", acc.list());
        String raw_page = request.getParameter("page");
        if (raw_page == null) {
            raw_page = "1";
        }
        int pageindex = Integer.parseInt(raw_page);
        int pagesize = Integer.parseInt(getServletContext().getInitParameter("pagesize"));
        List<Order> a = ordb.phantrang(pageindex, pagesize);
        int totalRecords = ordb.count();
        int totalpage = (totalRecords % pagesize == 0) ? totalRecords / pagesize
                : (totalRecords / pagesize) + 1;
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("totalpage", totalpage);
        request.setAttribute("o2", a);
        request.getRequestDispatcher("admin/Homeadmin.jsp").forward(request, response);
    }
    AcountDBcontext acc = new AcountDBcontext();
    OrderDBcontext ordb = new OrderDBcontext();
    OrderDetailDBcontext orderdb = new OrderDetailDBcontext();

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
