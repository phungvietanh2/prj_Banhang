/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package UseController;

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
public class HomeController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        List<Product> list = prodb.list();
        //add san pham vao gio hang
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
        //dem so luong o gio hang
        int n;
        if (lists != null) {
            n = lists.size();
        } else {
            n = 0;
        }
        request.setAttribute("size", n);
        request.setAttribute("product", list);
        request.setAttribute("productdt", prodb.listProductsdienthoai());
        request.setAttribute("productipad", prodb.listProductipad());
        request.setAttribute("productlaptop", prodb.listProductlabtop());
        request.getRequestDispatcher("use/Home.jsp").forward(request, response);
    } 
   ProductDBcontext prodb = new ProductDBcontext();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
