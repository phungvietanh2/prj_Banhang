/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package AdminController;

import DBcontext.OrderDBcontext;
import DBcontext.ProductDBcontext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;

public class AllstatsController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }
    ProductDBcontext prodb = new ProductDBcontext();
    OrderDBcontext orddb = new OrderDBcontext();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String from_raw = request.getParameter("from");
        String to_raw = request.getParameter("to");
        String from1_raw = request.getParameter("from1");
        String to1_raw = request.getParameter("to1");
        String from2_raw = request.getParameter("from2");
        String to2_raw = request.getParameter("to2");
        Date from, to, from1, to1 ,from2 , to2;
        try {
            from = ((from_raw == null) || (from_raw.equals(""))) ? null : Date.valueOf(from_raw);
            to = ((to_raw == null) || (to_raw.equals(""))) ? null : Date.valueOf(to_raw);
            from1 = ((from1_raw == null) || (from1_raw.equals(""))) ? null : Date.valueOf(from1_raw);
            to1 = ((to1_raw == null) || (to1_raw.equals(""))) ? null : Date.valueOf(to1_raw);
            from2 = ((from2_raw == null) || (from2_raw.equals(""))) ? null : Date.valueOf(from2_raw);
            to2 = ((to2_raw == null) || (to2_raw.equals(""))) ? null : Date.valueOf(to2_raw);

            request.setAttribute("sumorder", orddb.searctsumorder(from, to));
            request.setAttribute("sumprice", prodb.searchsumprice(from1, to1));
            request.setAttribute("topsanpham", prodb.listtopproduct());

            request.getRequestDispatcher("admin/Allstats.jsp").forward(request, response);
        } catch (Exception e) {
        }

    }

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
