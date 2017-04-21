/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.CDCE.Controller;

import com.CDCE.DAOs.PaymentDAO;
import com.CDCE.Model.Payment;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dinusha
 */
public class UpdatePayment extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            if(request.getParameter("payment_type") != null){
                String id = request.getParameter("id");
                String paymentType = request.getParameter("payment_type");
                String year = request.getParameter("year");
                String amount = request.getParameter("amount");
                
                Payment payment = new Payment();
                
                payment.setPaymentType(Integer.parseInt(paymentType));
                payment.setPaymentAmount(Double.parseDouble(amount));
                payment.setPaymentYear(year);
                payment.setId(id);
                
                try{
                    PaymentDAO pay = new PaymentDAO();
                    pay.updatePayment(payment);
                    
                    response.sendRedirect("payments.jsp");
                }catch(SQLException e){
                    
                }
            }
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
