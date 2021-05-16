package com.learn.icinbank.servlets;

import java.util.Date;
import com.learn.icinbank.entities.User;
import com.learn.icinbank.entities.Cheq;
import com.learn.icinbank.entities.PrimAcc;
import com.learn.icinbank.entities.SaveAcc;
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

public class RegisterServlet extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            try {
                
                String userName = request.getParameter("user_name");
                String userEmail = request.getParameter("user_email");
                String userPassword = request.getParameter("user_password");
                String userPhone = request.getParameter("user_phone");
                String userAddress = request.getParameter("user_address");

                // validations
                if (userName.isEmpty()) {
                    out.println("Name is blank ");
                    return;
                }
                //creating user object to store data
                
                User user = new User(userName, userEmail, userPassword, userPhone, userAddress, "normal", 1);
                java.util.Date date=new java.util.Date();  
                Cheq cheqq = new Cheq(1, user, userAddress, userPhone); 
                PrimAcc paccss = new PrimAcc(0,user,0);
                SaveAcc saccss = new SaveAcc(0,user,0);
                Trans transs = new Trans(0,date,"Acc. Activation","Acc. Activation",user,true,userName,"Acc. Activation" );
                Session hibernateSession = FactoryProvider.getFactory().openSession();
                Transaction tx = hibernateSession.beginTransaction();                
                int userId = (int) hibernateSession.save(user);
                int cheqId = (int) hibernateSession.save(cheqq);
                int paccId = (int) hibernateSession.save(paccss);
                int saccId = (int) hibernateSession.save(saccss);
                int transId = (int) hibernateSession.save(transs);
                tx.commit();
                hibernateSession.close();                
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", " Your Unique User ID is " + userId + "! Your Primary Account Number is " + paccId + "! Your Savings Account Number is " + saccId );    
              
                response.sendRedirect("afterregister.jsp");
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

