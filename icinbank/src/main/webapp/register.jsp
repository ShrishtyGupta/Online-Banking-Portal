<%-- 
    Document   : register
    Created on : May 9, 2021, 2:24:43 AM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User Registration</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body style="background-color: #0b2239">
        <%@include  file="components/navbar.jsp" %><br>
        <div class="container-fluid" >
            <div class="row mt-3">
                <div class="col-md-4 offset-md-4">                  

                    <div class="card">                        
                        <%@include  file="message.jsp" %>                        
                        <div class="card-body px-5">
                            <div class="container text-center">
                                <img src="img/seo-and-web.png"  style="max-width: 100px;" class="img-fluid" alt="user">
                            </div>


                            <h3 class="text-center my-3">Subscribe To ICIN Here !!</h3>

                            <form action="RegisterServlet" method="post">

                                <div class="form-group">
                                    <label for="name">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="name" placeholder="Enter here" aria-describedby="emailHelp">
                                </div>

                                <div class="form-group">
                                    <label for="email">User Email</label>
                                    <input name="user_email" type="email" class="form-control" id="email" placeholder="Enter here" aria-describedby="emailHelp">
                                </div>

                                <div class="form-group">
                                    <label for="password">User password</label>
                                    <input name="user_password" type="password" class="form-control" id="password" placeholder="Enter here" aria-describedby="emailHelp">
                                </div>

                                <div class="form-group">
                                    <label for="phone">User phone</label>
                                    <input name="user_phone" type="number" class="form-control" id="phone" placeholder="Enter here" aria-describedby="emailHelp">
                                </div>

                                <div class="form-group">
                                    <label for="phone">User Address</label>
                                    <textarea name="user_address" style="height: 50px;" class="form-control" placeholder="Enter your address"></textarea>


                                </div>

                                <div class="container text-center"> 
                                    <button class="btn " style="border-color: #0b2239; color:#fff; background-color:#0b2239; hover{background-color:#ffffff!important; color:#fff!important; cursor: pointer; }">
                                        Register</button>
                                    

                                </div>


                            </form>


                        </div>

                    </div>

                </div>
            </div>



        </div>
                        <br><br>
                        <%@include file="components/footer_1.jsp" %>
    </body>
</html>
