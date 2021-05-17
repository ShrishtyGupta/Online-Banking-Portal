/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.icinbank.servlets;
import com.learn.icinbank.dao.UserDao;
import com.learn.icinbank.dao.ReqCheqDao;
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
import com.learn.icinbank.entities.User;
import com.learn.icinbank.entities.Cheq;
import com.learn.icinbank.entities.PrimAcc;
import com.learn.icinbank.entities.Trans;
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

/**
 *
 * @author hp
 */
public class ReqChServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                                int userIdc = Integer.parseInt(request.getParameter("cheqt_user_id"));
                               String cheqConnum = request.getParameter("cheq_connum");
                                String cheqAdd = request.getParameter("cheq_add");
                               
                // validations

               
                if (cheqAdd.isEmpty()) {
                    out.println("Address is blank ");
                    return;
                }
                
               
                //creating user object to store data
                
                Cheq c = new Cheq();
                c.setCheqConnum(cheqConnum);
                c.setCheqStatus(1);
                c.setCheqAdd(cheqAdd);
                UserDao udao = new UserDao(FactoryProvider.getFactory());
                User u= udao.getUserById(userIdc);
                c.setCheqt(u);
                
                ReqCheqDao rdao = new ReqCheqDao(FactoryProvider.getFactory());
                rdao.saveCheq(c);
                HttpSession httpSession = request.getSession();
                
                httpSession.setAttribute("message", "Your Checkbook will be approved soon"  );    
              
                response.sendRedirect("cheqbook.jsp");
                return;
                
                
                
                
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
