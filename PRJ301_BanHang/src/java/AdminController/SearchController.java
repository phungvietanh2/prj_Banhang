/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package AdminController;

import DBcontext.OrderDBcontext;
import DBcontext.OrderDetailDBcontext;
import Model.Order;
import Model.OrderDetail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author phung
 */
public class SearchController extends HttpServlet {

    OrderDBcontext ordb = new OrderDBcontext();
    OrderDetailDBcontext orderdb = new OrderDetailDBcontext();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String raw_key = request.getParameter("key");
        String raw_key2 = request.getParameter("key2");
        String raw_key12 = request.getParameter("fromprice");
        String raw_key22 = request.getParameter("topprice");
        String raw_key13 = request.getParameter("from");
        String raw_key33 = request.getParameter("to");

        Double p1, p2;
        int a ,b;
        Date from, to;
        try {
            p1 = ((raw_key12 == null) || (raw_key12.equals(""))) ? null : Double.parseDouble(raw_key12);
            p2 = ((raw_key22 == null) || (raw_key22.equals(""))) ? null : Double.parseDouble(raw_key22);
            from = ((raw_key13 == null) || (raw_key13.equals(""))) ? null : Date.valueOf(raw_key13);
            to = ((raw_key33 == null) || (raw_key33.equals(""))) ? null : Date.valueOf(raw_key33);

            List<Order> list1 = ordb.searchlistorder(raw_key2, from, to, p1, p2);

            request.setAttribute("searchorder", list1);

        } catch (Exception e) {
        }
        // request.setAttribute("o2", ordb.listorder());
        
        request.setAttribute("o1", orderdb.list());
        request.setAttribute("o", ordb.chartyear());
        request.setAttribute("o2", ordb.chartgetid(raw_key));
        request.setAttribute("cid", raw_key);
        
     
        request.getRequestDispatcher("admin/Searchadmin.jsp").forward(request, response);
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
