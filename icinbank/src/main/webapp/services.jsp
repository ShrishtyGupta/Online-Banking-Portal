<%-- 
    Document   : services
    Created on : May 9, 2021, 2:58:04 AM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Services </title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body style="background: #0b2239">
        <%@include file="components/navbar.jsp" %><br><br>
      
        <div class="container admin">


            <div class="container-fluid mt-3">
                <%@include file="message.jsp" %>
            </div>




            <div class="row mt-3">

                <!--first col-->
                <div class="col-md-4">

                    <!--first box-->
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid " src="img/social.png" alt="user_icon">

                            </div> 
                          
                            <h1 class="text-uppercase text-muted">USER<BR> PROFILE </h1>

                        </div>

                    </div>



                </div>

                <!--second col-->

                <div class="col-md-4">


                    <div class="card " data-toggle="modal" data-target="#add-category-modal">

                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid " src="img/product.png" alt="user_icon">

                            </div> 

                            
                            <h1 class="text-uppercase text-muted">request checkbook</h1>

                        </div>

                    </div>


                </div>


                <!--third col-->
                <div class="col-md-4">


                    <div class="card" data-toggle="modal" data-target="#add-category-modal">

                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid " src="img/add-friend.png" alt="user_icon">
                            </div> 
                            <h1 class="text-uppercase text-muted">transfer money</h1>
                        </div>
                    </div>
                </div>
            </div>

            <!--second row-->

            <div class="row mt-3">
                <!--second :row first col-->
                <div class="col-md-6">


                    <div class="card" data-toggle="modal" data-target="#add-category-modal">

                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid " src="img/minus.png" alt="user_icon">

                            </div> 

                            <p class="mt-2">Click here to Deposit Money </p>
                            <h1 class="text-uppercase text-muted"> DEPOSIT MONEY </h1>

                        </div>

                    </div>
                </div>

                <!--second row : second col-->

                <div class="col-md-6">

                    <div class="card" data-toggle="modal" data-target="#add-category-modal">

                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid " src="img/keys.png" alt="user_icon">

                            </div> 

                            <p class="mt-2">Click here to Check Balance Sheet </p>
                            <h1 class="text-uppercase text-muted">balance sheet</h1>

                        </div>

                    </div>

                </div>




            </div>



        </div>






        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header text-white" style="background: #0b2239">
                        <h5 class="modal-title" id="exampleModalLabel">Login to Avail Service</h5>
                        <button type="button" class="close" style="color: #fff" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="LoginServlet" method="post">

                            <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input  name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input  name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
<a href="register.jsp" class="text-center d-block mb-2" style="color:#0b2239"> If You Are A New User Click Me </a>
                                
                            <div class="cotnainer text-center">

                                <button type="submit" class="btn btn-primary border-0 " style="background:#0b2239">Login</button>
                                    
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                            </div>



                        </form>




                    </div>

                </div>
            </div>
        </div>




        <!--End modal-->

        
        <br><br><br>
          <%@include file="components/footer_1.jsp" %>
    </body>
</html>
