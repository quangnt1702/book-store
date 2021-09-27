/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package quangnt.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import quangnt.product.ProductDTO;
import quangnt.shopping.Cart;

/**
 *
 * @author ACER
 */
@WebServlet(name = "AddToCartController", urlPatterns = {"/AddToCartController"})
public class AddToCartController extends HttpServlet {

    public static final String ERROR = "home";
    public static final String SUCCESS = "home";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String productID = request.getParameter("productID");
            String productName = request.getParameter("productName");
            float productPrice = Float.parseFloat(request.getParameter("productPrice"));
            int productQuantityAvailable = Integer.parseInt(request.getParameter("productQuantityAvailable"));
            int productQuantity = Integer.parseInt(request.getParameter("productQuantity"));
            String productCategory = request.getParameter("productCategory");
            String productImage = request.getParameter("productImage");
            ProductDTO product = new ProductDTO(productID, productName, productPrice, productQuantity, productImage, productCategory, "", "", "");
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart == null) {
                cart = new Cart();
            } else {
                if (cart.getCart().containsKey(productID)) {
                    String message = "The product is added to your cart before!!!Check your cart, please!";
                    request.setAttribute("SHOPPING_MESSAGE", message);
                    return;
                }
            }
            if (productQuantity > productQuantityAvailable) {
                String message = "The number of available products is not enough!!!";
                request.setAttribute("SHOPPING_MESSAGE", message);
            } else {
                product.setProductQuantityAvailable(productQuantityAvailable);
                cart.add(product);
                session.setAttribute("CART", cart);
                String message = "Add to cart " + productQuantity + " '" + productName + "' successfully!!!";
                request.setAttribute("SHOPPING_MESSAGE", message);
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at AddToCartController" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
