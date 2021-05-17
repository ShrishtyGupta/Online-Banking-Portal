<%@page import="com.learn.icinbank.entities.PrimAcc"%>
<%@page import="com.learn.icinbank.entities.SaveAcc"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.icinbank.entities.Trans"%>
<%@page import="com.learn.icinbank.dao.UserDao"%>
<%@page import="com.learn.icinbank.dao.PrimAccDao"%>
<%@page import="com.learn.icinbank.dao.SaveAccDao"%>
<%@page import="com.learn.icinbank.helper.FactoryProvider"%>
<%@page import="com.learn.icinbank.entities.User"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    User useru = (User) session.getAttribute("current-user");
    if (useru == null) {

        session.setAttribute("message", "You are not logged in !! Login first to access this page");
        response.sendRedirect("login.jsp");
        return;

    }
    
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registered Successfully</title>
         <%@include file="components/common_css_js.jsp" %>
    </head>
    <body style="background: #0b2239">
        <%@include  file="components/navbar.jsp" %>
        <br><br><br>
        
         <div class="container" style="padding-left:170px; padding-right: 40px"> 
          
               

                    <div class="card mt-3" style="height: 370px ;width:750px; text-align: center">

                        

                        <div class="card-body" >                            
                            <%@include file="message.jsp" %>
                            <form action="login.jsp" >
                                
                                <br><br>
                                <%
    String messagee = (String) session.getAttribute("message");
    if (messagee != null) {

        //prints
        // out.println(message);

%>


<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong><%= messagee%></strong> 
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button><br>
</div>


<%            session.removeAttribute("messagee");

    }


%>
                                <h4 style="color:black"> You Have Been Registered Successfully!<br>
                                    Press The Button & Move to Login Window!</h4> <br> <br> 
                                <div class="container text-center" > 

                                    <button type="submit" class="btn btn-primary border-0 " style="background:#0b2239">Login Window</button>
                                    <br>
                                                                    </div>

                            </form>

                        </div>


                    </div>




        
            </div>
 
        
                                <br><br><br>
        
         <%@include file="components/footer_1.jsp" %>
    </body>
</html>
