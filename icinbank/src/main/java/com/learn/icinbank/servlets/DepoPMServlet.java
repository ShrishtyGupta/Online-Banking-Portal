package com.learn.icinbank.servlets;

import com.learn.icinbank.dao.UserDao;
import com.learn.icinbank.dao.PrimAccDao;
import com.learn.icinbank.entities.Cheq;
import com.learn.icinbank.entities.User;
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

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import com.learn.icinbank.entities.PrimAcc;
import com.learn.icinbank.entities.Trans;
import com.learn.icinbank.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DepoPMServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
     try {                      int pacc_status = Integer.parseInt(request.getParameter("pacc_status"));
                                int pacct_user_id = Integer.parseInt(request.getParameter("pacct_user_id"));
                               int pacc_id = Integer.parseInt(request.getParameter("pacc_id"));
                                int pacc_balnew = Integer.parseInt(request.getParameter("pacc_balnew"));
                                int pacc_bal = Integer.parseInt(request.getParameter("pacc_bal"));  
                               int x=pacc_bal+pacc_balnew;
             
                if(pacc_status==1)
                {
                Session s = FactoryProvider.getFactory().openSession();
                Transaction tx = s.beginTransaction(); 
                Query q=s.createQuery("update PrimAcc set paccBal=:p where paccId=:i");
                
                q.setParameter("p",x);
                q.setParameter("i",pacc_id);
                q.executeUpdate();
                tx.commit();
                s.close();   
               
               
                HttpSession httpSession = request.getSession();
                
                httpSession.setAttribute("message", "Transaction Succcessful!"  );    
              
                response.sendRedirect("depositmoney.jsp");
                return;
                
                
                
                }
                else
                        {
                        HttpSession httpSession = request.getSession();
                
                httpSession.setAttribute("message", "Blocked ! Your Primary Account is Blocked! Contact Admin to get Unblocked! "  );    
              
                response.sendRedirect("depositmoney.jsp");
                return;
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
