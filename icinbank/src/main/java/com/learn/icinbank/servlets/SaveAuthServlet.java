/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.icinbank.servlets;

import com.learn.icinbank.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author shrishty
 */
public class SaveAuthServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
          try {
                                int sacct_user_id = Integer.parseInt(request.getParameter("sacct_user_id"));
                               int sacc_id = Integer.parseInt(request.getParameter("sacc_id"));
                                int sacc_status =  Integer.parseInt(request.getParameter("sacc_status"));
                               
                // validations
if(sacct_user_id==sacc_id)
{
Session s = FactoryProvider.getFactory().openSession();
                Transaction tx = s.beginTransaction(); 
                Query q=s.createQuery("update SaveAcc set saccStatus=:p where saccId=:i");
                
                q.setParameter("p",sacc_status);
                q.setParameter("i",sacc_id);
                q.executeUpdate();
                tx.commit();
                s.close();   
               
             
               
            
               
                return;
}
                         
else
{
    HttpSession httpSession = request.getSession();
               
 httpSession.setAttribute("message", "Invalid User ID and Account ID combination!"  );    
              
                response.sendRedirect("saveauth.jsp");
}
                   
                
                
            } catch (Exception e) {
                e.printStackTrace();
                
                
                
            }
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
