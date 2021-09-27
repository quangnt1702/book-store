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
import quangnt.product.ProductDAO;
import quangnt.product.ProductDTO;
import quangnt.product.ProductError;

/**
 *
 * @author ACER
 */
@WebServlet(name = "ConfirmEditController", urlPatterns = {"/ConfirmEditController"})
public class ConfirmEditController extends HttpServlet {

    public static final String ERROR = "editProduct.jsp";
    public static final String SUCCESS = "home";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        ProductError productError = new ProductError();
        try {
            String productID = request.getParameter("productID");
            String productName = request.getParameter("productName");
            float productPrice = Float.parseFloat(request.getParameter("productPrice"));
            int productQuantity = Integer.parseInt(request.getParameter("productQuantity"));
            String productCategory = request.getParameter("productCategory");
            String productImage = request.getParameter("productImage");
            String status = request.getParameter("status");
            String createDate = request.getParameter("createDate");
            String description = request.getParameter("productDescription");
            //CheckValidation
            boolean checkValidator = true;
            if (productName.length() < 5 || productName.length() > 50) {
                productError.setProductNameError("Product Name must be in [5,50]!");
                checkValidator = false;
            }
            if (productPrice <= 0) {
                productError.setProductPriceError("Product Price must be more than zero!! ");
                checkValidator = false;
            }
            if (description.length() < 5 || description.length() > 500) {
                productError.setProductDescriptionError("Description must be in [5,500]!");
                checkValidator = false;
            }         
            if (checkValidator) {
                ProductDTO product = new ProductDTO(productID, productName, productPrice, productQuantity, productImage, productCategory, status, createDate, description);
                ProductDAO dao = new ProductDAO();
                boolean checkUpdate = dao.updateProduct(product);
                if (checkUpdate) {
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("PRODUCT_ERROR", productError);
            }

        } catch (Exception e) {
            log("Error at ConfirmEditController " + e.toString());
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
