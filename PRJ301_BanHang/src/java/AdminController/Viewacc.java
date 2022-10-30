/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package AdminController;

import DBcontext.AcountDBcontext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author phung
 */
public class Viewacc extends HttpServlet {

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
       
    }
    AcountDBcontext acc = new AcountDBcontext();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           String id_raw = request.getParameter("id");
           request.setAttribute("acc", acc.getid(id_raw));
        request.getRequestDispatcher("admin/UpdateAdmin.jsp").forward(request, response);

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
      String Id_raw = request.getParameter("id");
        String Phone_raw = request.getParameter("phone");
        String Gmail_raw = request.getParameter("gmail");
        String Fullname_raw = request.getParameter("fullname");
        String Username_raw = request.getParameter("username");
        String Pass_raw = request.getParameter("password");
        String Role_raw = request.getParameter("role");
        String admin_raw = "";
        String Customer_raw = "";
        if (!Role_raw.equals("true")) {
            admin_raw = "False";
            Customer_raw = "true";
        }
        if (!Role_raw.equals("False")) {
           
            admin_raw = "true";
            Customer_raw = "False";
        }
        acc.updateacc(Gmail_raw, Phone_raw, Fullname_raw, Username_raw, Pass_raw, admin_raw, Customer_raw, Id_raw);

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
