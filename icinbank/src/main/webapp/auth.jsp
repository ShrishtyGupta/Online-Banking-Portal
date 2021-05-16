<%@page import="com.learn.icinbank.entities.User"%>
<%

    User user = (User) session.getAttribute("current-user");
    if (user == null) {

        session.setAttribute("message", "You are not logged in !! Login first!! ");
        response.sendRedirect("login.jsp");
        return;

    } else {

        if (user.getUserType().equals("normal")) {

            session.setAttribute("message", "You are not admin ! Do not access admin page");
            response.sendRedirect("login.jsp");
            return;

        }

    }


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Authentication Panel</title>
        <%@include file="components/common_css_js.jsp" %>
        
    </head>
    <body style="background: #0b2239">
        <%@include file="components/navbar.jsp" %><br><br><br><br><br><br>
       
    
    <div class="container admin">


           



            <div class="row ">

                <!--first col-->
                <div class="col-md-4">

                    <a href="primauth.jsp">         <!--first box-->
                <div class="card" style="background: #fff;   box-shadow: 0 0 20px rgba(0,0,0,0.4);   border-radius: 5px;      padding: 20px;   text-align: center;   color: white;   ">
                        <div class="card-body text-center">
                             
                          
                            <h1 class="text-uppercase text-muted">Primary Account AUDIT </h1>

                        </div>

                    </div>
                    </a>


                </div>

                <!--second col-->

                <div class="col-md-4">

 <a href="userauth.jsp">  
                <div class="card" style="background: #fff;   margin-top: 23PX;box-shadow: 0 0 20px rgba(0,0,0,0.4);   border-radius: 5px;      padding: 20px;   text-align: center;   color: white;   ">

                        <div class="card-body text-center">

                             

                            
                            <h1 class="text-uppercase text-muted">USER <BR> AUDIT</h1>

                        </div>

                    </div>
 </a>

                </div>


                <!--third col-->
                <div class="col-md-4">

                    <a href="saveauth.jsp">
                <div class="card" style="background: #fff;   box-shadow: 0 0 20px rgba(0,0,0,0.4);   border-radius: 5px;      padding: 20px;   text-align: center;   color: white;   ">
                   
                        <div class="card-body text-center">

                            
                            <h1 class="text-uppercase text-muted">Savings Account AUDIT</h1>
                        </div>
                    </div> </a>
                </div>
            </div>
    </div>
        <br><br><br><br><br><br><br>
    <%@include file="components/footer_1.jsp" %>
    </body>
</html>
