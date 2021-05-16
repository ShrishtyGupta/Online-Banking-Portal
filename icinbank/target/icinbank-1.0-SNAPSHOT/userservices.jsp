<%@page import="com.learn.icinbank.entities.User"%>
<%@page import="com.learn.icinbank.entities.PrimAcc"%>
<%@page import="com.learn.icinbank.dao.PrimAccDao"%>
<%@page import="com.learn.icinbank.dao.SaveAccDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.icinbank.dao.UserDao"%>
<%@page import="com.learn.icinbank.dao.SaveAccDao"%>
<%@page import="com.learn.icinbank.dao.PrimAccDao"%>
<%@page import="com.learn.icinbank.helper.FactoryProvider"%>
<%@page import="com.learn.icinbank.entities.User"%>
<%@page import="com.learn.icinbank.entities.PrimAcc"%>
<%@page import="com.learn.icinbank.entities.SaveAcc"%>
<%@page import="com.learn.icinbank.entities.User"%>
<%@page import="com.learn.icinbank.entities.PrimAcc"%>
<%@page import="com.learn.icinbank.entities.SaveAcc"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.icinbank.entities.Trans"%>
<%@page import="com.learn.icinbank.dao.UserDao"%>
<%@page import="com.learn.icinbank.dao.PrimAccDao"%>
<%@page import="com.learn.icinbank.dao.SaveAccDao"%>
<%@page import="com.learn.icinbank.helper.FactoryProvider"%>
<%@page import="com.learn.icinbank.entities.User"%>

<%

    User useru = (User) session.getAttribute("current-user");
    if (useru == null) {

        session.setAttribute("message", "You are not logged in !! Login first to access checkbook page");
        response.sendRedirect("login.jsp");
        return;

    }
    if(useru.getUserType().equals("normal")) {
        if(useru.getUserStatus()==0 ){session.setAttribute("message", "Your account is blocked");
        response.sendRedirect("login.jsp");
        return;}
        
    }

    
    
    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> <%=useru.getUserName()%>'s Services </title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body style="background: #0b2239">
         <%
                
                PrimAccDao pdao=new PrimAccDao(FactoryProvider.getFactory());
                List<PrimAcc> plist = pdao.getPrimAcc();
                
    %> 
        <%@include file="components/navbar.jsp" %><br><br><br>
      
        <div class="container admin">


            <div class="container-fluid mt-3">
                
            </div>

 <%@include file="message_1.jsp" %>


            <div class="row mt-3">

                <!--first col-->
                <div class="col-md-4">
                    <a href="profile.jsp">
                    <!--first box-->
                    <div class="card" style="box-shadow: 0 0 20px rgba(0,0,0,0.4);">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid  " src="img/social.png" alt="user_icon">

                            </div> 
                          
                            <h1 class="text-uppercase text-muted">USER<BR> PROFILE </h1>

                        </div>

                    </div></a>



                </div>

                <!--second col-->

                <div class="col-md-4">

                    <a href="cheqbook.jsp">
                    <div class="card text-center"               >

                        <div class="card-body" >

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid  " src="img/product.png" alt="user_icon">

                            </div> 

                            
                            <h1 class="text-uppercase text-muted">checkbook services
                            </h1>

                        </div>

                    </div></a>


                </div>


                <!--third col-->
                <div class="col-md-4">


                    <div class="card" data-toggle="modal" data-target="#trans-money-modal">

                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid  " src="img/add-friend.png" alt="user_icon">

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

                    <a href="depositmoney.jsp">
                    <div class="card" >

                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid  " src="img/minus.png" alt="user_icon">

                            </div> 

                            <p class="mt-2" style="color:#000">Click here to Deposit Money </p>
                            <h1 class="text-uppercase text-muted"> DEPOSIT MONEY </h1>

                        </div>

                    </div>
                    </a>
                </div>

                <!--second row : second col-->

                <div class="col-md-6">
                    <a href="balancesheet.jsp">
                    <div class="card" >

                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid  " src="img/keys.png" alt="user_icon">

                            </div> 

                            <p class="mt-2" style="color:#000">Click here to Check Balance Sheet </p>
                            <h1 class="text-uppercase text-muted">balance sheet</h1>

                        </div>

                    </div></a>

                </div>




            </div>



        </div>



        <!--add category modal-->



        <!-- Modal -->
      




       

        <!-- Modal -->
      
        
        
        <div class="modal fade" id="trans-money-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document" style="height:450px; width: 650px">
                <div class="modal-content">
                    <div class="modal-header  text-white" style="background: #0b2239">
                        <h5 class="modal-title" id="exampleModalLabel">Transfer Money from Primary Account</h5>
                        <button type="button" style="color: #fff" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ReqMServlet" method="post">
                             <div class="row " >
                            <%@include file="message.jsp" %>
     <%       for(PrimAcc primacc:plist)
                        { if(primacc.getPacct().getUserId()==useru.getUserId()){
            %>  
                        <input  name="pacc_id" type="hidden" class="form-control" id="pacc_id" value="<%=primacc.getPaccId()%>">

            <input  name="pacc_status" type="hidden" class="form-control" id="pacc_status" value="<%=primacc.getPaccStatus()%>">
            <input  name="pacc_bal" type="hidden" class="form-control" id="pacc_bal" value="<%=primacc.getPaccBal()%>">
<%
                }}
            %>
                                <div class="form-group" style="padding-left: 50px">
                                   
                                    <label for="transtt_user_id">Your User ID</label>
                                    <input  name="transt_user_id" type="text" class="form-control" id="transt_user_id" value="<%=useru.getUserId()%>"readonly>
                                    <small id="emailHelp" class="form-text text-muted">Do not change this ID.</small>
                                </div><br>
                                
                                
                                
                                <div class="form-group" style="padding-left: 50px">
                                   
                                    <label for="trans_Amt">Transaction Amount</label>
                                    <input  name="trans_Amt" type="text" class="form-control" id="trans_Amt" >
                                    <small id="emailHelp" class="form-text text-muted">Amount should be less than Primary Account Balance</small>
                                </div><br>
                                
                        </div>
                                    
                                    <div class="row " style="row-gap:100px">
                           
                            
                            
                                <div class="form-group" style="padding-left: 50px">
                                   
                                    <label for="trans_name">Beneficiary Name</label>
                                    <input  name="trans_name" type="text" class="form-control" id="trans_name" >
                                    <small id="emailHelp" class="form-text text-muted">Recepient Name.</small>
                                </div><br>
                                
                                
                                
                                <div class="form-group" style="padding-left: 50px">
                                   
                                    <label for="trans_ifsc">Beneficiary IFSC Code</label>
                                    <input  name="trans_ifsc" type="text" class="form-control" id="trans_ifsc" >
                                    <small id="emailHelp" class="form-text text-muted">Currency Indian National Rupee</small>
                                </div><br>
                                
                        </div>
                                    
                                    
                                    
                                    
                             <div class="row">
                                
                                
                                <div class="form-group" style="padding-left: 50px">
                                   
                                    <label for="acc_toacc">Account Number</label>
                                    <input  name="acc_toacc" type="text" class="form-control" id="acc_toacc" >
                                    <small id="emailHelp" class="form-text text-muted">Account Number of Recepient.</small>
                                </div><br>
                                <div class="form-group" style="padding-left: 50px">
                                   
                                    <label for="acc_tobank">Bank Name</label>
                                    <input  name="acc_tobank" type="text" class="form-control" id="acc_tobank" >
                                    <small id="emailHelp" class="form-text text-muted">Bank Name of Recepient.</small>
                                </div> <br><br> 

                        
                            

                                <div class="container text-center">
                                    <button type="submit" class="btn btn-primary border-0 " style="background:#0b2239">Transfer Now</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>

                               

                        </div>
                            </form> 

                            


                            


                            







                    </div>

                </div>
            </div>
        </div>
        <br><br><br><br>
          <%@include file="components/footer_1.jsp" %>
    </body>
</html>
