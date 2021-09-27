/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package quangnt.controllers;

import java.io.IOException;
import java.text.DecimalFormat;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import quangnt.order.Order;
import quangnt.order.OrderDAO;
import quangnt.order.OrderError;
import quangnt.user.UserDTO;

/**
 *
 * @author ACER
 */
@WebServlet(name = "CheckOutController", urlPatterns = {"/CheckOutController"})
public class CheckOutController extends HttpServlet {

    public static final String FAIL = "checkOut.jsp";
    public static final String SUCCESS = "vnpay_home.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = FAIL;
        OrderError orderError = new OrderError();
        try {
            String orderID = request.getParameter("orderID");
            float totalMoney = Float.parseFloat(request.getParameter("totalMoney"));
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            String userID = user.getUserID();
            String statusID = "A";
            String paymentStatus = "N";
            LocalDate date = java.time.LocalDate.now();
            String orderDate = date.toString();
            DecimalFormat decimalFormat = new DecimalFormat("#########.##########");
            String amount = decimalFormat.format(totalMoney);
            request.setAttribute("AMOUNT", amount);
            //CheckValidation
            boolean checkValidate = true;
            if (orderID.length() < 4 || orderID.length() > 10) {
                orderError.setOrderIDError("Order ID must be in [4,9]!");
                checkValidate = false;
            } else if (!orderID.matches("^O\\d{3,8}$")) {
                orderError.setOrderIDError("Order ID format: [BXXX...] !!");
                checkValidate = false;
            } else {
                OrderDAO dao = new OrderDAO();
                checkValidate = dao.checkDuplicate(orderID);
                if (!checkValidate) {
                    orderError.setOrderIDError("Order ID is duplicated !!");
                }
            }
            if (!phone.matches("^\\d{9,11}$")) {
                orderError.setPhoneError("Phone must be in digits [9,11]!!");
                checkValidate = false;
            }

            if (checkValidate) {
                //Create Order
                Order order = new Order(orderID, email, userID, address, phone, totalMoney, orderDate, statusID, paymentStatus);
                session.setAttribute("ORDER", order);
                url = SUCCESS;
            } else {
                request.setAttribute("CHECK_OUT_ERROR", orderError);
            }
        } catch (Exception e) {
            log("Error at CheckOutController " + e.toString());
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
