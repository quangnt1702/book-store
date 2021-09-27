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

/**
 *
 * @author ACER
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    public static final String ERROR = "error.jsp";
    public static final String HOME = "home";
    public static final String SIGN_IN = "login.html";
    public static final String LOGIN = "LoginController";
    public static final String LOGOUT = "LogoutController";
    public static final String SEARCH = "SearchController";
    public static final String ADD_PRODUCT = "AddProductController";
    public static final String CONFRIM_ADD = "ConfirmAddController";
    public static final String DELETE = "DeleteController";
    public static final String EDIT_PRODUCT = "EditProductController";
    public static final String CONFIRM_EDIT = "ConfirmEditController";
    public static final String ADD_TO_CART = "AddToCartController";
    public static final String REMOVE_CART = "RemoveCartController";
    public static final String UPDATE_CART = "UpdateCartController";
    public static final String GO_TO_CHECK_OUT = "checkOut.jsp";
    public static final String CHECK_OUT = "CheckOutController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if ("Home".equals(action)) {
                url = HOME;
            } else if ("Login".equals(action)) {
                url = LOGIN;
            } else if ("Add into cart".equals(action)) {
                url = SIGN_IN;
            } else if ("Logout".equals(action)) {
                url = LOGOUT;
            } else if ("Search".equals(action)) {
                url = SEARCH;
            } else if ("AddProduct".equals(action)) {
                url = ADD_PRODUCT;
            } else if ("Confirm Add".equals(action)) {
                url = CONFRIM_ADD;
            } else if ("Delete".equals(action)) {
                url = DELETE;
            } else if ("Edit".equals(action)) {
                url = EDIT_PRODUCT;
            } else if ("Confirm Edit".equals(action)) {
                url = CONFIRM_EDIT;
            } else if ("Add to cart".equals(action)) {
                url = ADD_TO_CART;
            } else if ("Remove".equals(action)) {
                url = REMOVE_CART;
            } else if ("Update".equals(action)) {
                url = UPDATE_CART;
            } else if ("Go To Check Out".equals(action)) {
                url = GO_TO_CHECK_OUT;
            } else if ("Check Out".equals(action)) {
                url = CHECK_OUT;
            } else if ("Home".equals(action)) {
                url = HOME;
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("ERROR_MESSAGE", "This function is not supported!!!");
            }
        } catch (Exception e) {
            log("Error at MainController" + e.toString());
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
