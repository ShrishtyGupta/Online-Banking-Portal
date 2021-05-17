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
        <title> Admin - Services </title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body style="background: #0b2239">
        <%@include file="components/navbar.jsp" %><br><br><br><br>
      
        <div class="container admin">


            <div class="container-fluid mt-3">
                <%@include file="message.jsp" %>
            </div>




           

            <!--second row-->

            <div class="row mt-3">

                <!--second :row first col-->
                <div class="col-md-6">

<a href="auth.jsp" style="hover{text-decoration: none; }">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">

                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid  " src="img/social.png" alt="user_icon">

                            </div> 

                            <p class="mt-2" style="color:#000">Click here to Authenticate User and User Accounts </p>
                            <h1 class="text-uppercase text-muted"> User <br>Authentication </h1>

                        </div>

                    </div></a>
                </div>

                <!--second row : second col-->

                <div class="col-md-6">
                    <a href="checkbookadmin.jsp" >
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">

                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid  " src="img/product.png" alt="user_icon">

                            </div> 

                            <p class="mt-2" style="color:#000; ">Click here to View and Approve Checkbook Requests </p>
                            <h1 class="text-uppercase text-muted">Approve <br>Checkbook</h1>

                        </div>

                    </div></a>

                </div>




            </div>



        </div>



        <!--add category modal-->



        <!-- Modal -->
        




        <br><br><br><br><br>
          <%@include file="components/footer_1.jsp" %>
    </body>
</html>
