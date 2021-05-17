/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.icinbank.servlets;
import java.util.List;
import com.learn.icinbank.dao.PrimAccDao;
import com.learn.icinbank.entities.PrimAcc;
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
public class PrimAuthServlet extends HttpServlet {

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
                                int pacct_user_id = Integer.parseInt(request.getParameter("pacct_user_id"));
                               int pacc_id = Integer.parseInt(request.getParameter("pacc_id"));
                                int pacc_status =  Integer.parseInt(request.getParameter("pacc_status"));
                               
                // validations

                     PrimAccDao dao=new PrimAccDao(FactoryProvider.getFactory());
                     List<PrimAcc> list = dao.getPrimAcc();      
                     
                     if(pacct_user_id==pacc_id)
                     {
                   Session s = FactoryProvider.getFactory().openSession();
                Transaction tx = s.beginTransaction(); 
                Query q=s.createQuery("update PrimAcc set paccStatus=:p where paccId=:i");
                
                q.setParameter("p",pacc_status);
                q.setParameter("i",pacc_id);
                q.executeUpdate();
                tx.commit();
                s.close();   
               
             
               
                HttpSession httpSession = request.getSession();
               
 httpSession.setAttribute("message", "Status Updated Succcessfully!"  );    
              
                response.sendRedirect("primauth.jsp");
               
                return;}
                     else
                     {
                     HttpSession httpSession = request.getSession();
               
 httpSession.setAttribute("message", "Wrong combination of user and account ID!"  );    
              
                response.sendRedirect("primauth.jsp");
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
