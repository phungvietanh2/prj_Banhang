/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package AcountController;

import DBcontext.AcountDBcontext;
import Model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author phung
 */
public class SignUpController extends HttpServlet {

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

    AcountDBcontext acountdb = new AcountDBcontext();

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

        HttpSession session = request.getSession();
        String phone_raw = request.getParameter("phone").trim();
        String gmail_raw = request.getParameter("email").trim();
        String pass_raw = request.getParameter("pass").trim();
        String name_raw = request.getParameter("name").trim();
        session.setAttribute("email", gmail_raw);
        session.setAttribute("phone", phone_raw);
        session.setAttribute("name", name_raw);
        // check sdt
        String check_phone = "^[0-9]{10}";
        Pattern phone = Pattern.compile(check_phone);
        Matcher pho = phone.matcher(phone_raw);
        if (!pho.matches()) {
            request.setAttribute("mess1", "Phone must have 10 character");
            request.getRequestDispatcher("Login").forward(request, response);
        }
        //      check pass 
        String check_pass = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{8,20}$";
        Pattern pass = Pattern.compile(check_pass);
        Matcher pas = pass.matcher(pass_raw);
        if (!pas.matches()) {
            request.setAttribute("mess1", "Password have at least 8 character contain at least one number, one lowercase, one uppercase");
            request.getRequestDispatcher("Login").forward(request, response);
        }

        Account a = acountdb.getgmail(gmail_raw);
        if (a == null) {
            session.setAttribute("pass", pass_raw);
            request.setAttribute("signup", acountdb.getsignup(phone_raw, name_raw, gmail_raw, pass_raw));
            request.setAttribute("mess1", "Create account successful, You can login!");
        } else {
            request.setAttribute("mess1", "Email is already exist");
        }
        request.getRequestDispatcher("Login").forward(request, response);

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
