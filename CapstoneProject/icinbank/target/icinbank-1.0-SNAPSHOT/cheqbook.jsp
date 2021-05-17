<%@page import="java.util.List"%>
<%@page import="com.learn.icinbank.entities.Cheq"%>
<%@page import="com.learn.icinbank.dao.ReqCheqDao"%>
<%@page import="com.learn.icinbank.helper.FactoryProvider"%>
<%@page import="com.learn.icinbank.entities.User"%>
<%

    User userc = (User) session.getAttribute("current-user");
    if (userc == null) {

        session.setAttribute("message", "You are not logged in !! Login first to access checkbook page");
        response.sendRedirect("login.jsp");
        return;

    }
    
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> <%=userc.getUserName()%>'s Checkbook Details</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body style="background: #0b2239">
        <%@include file="components/navbar.jsp" %>
         <%
                                                ReqCheqDao dao=new ReqCheqDao(FactoryProvider.getFactory());
                                                List<Cheq> list = dao.getAllCheq();
          %>
          <%  int cunt=0;
                                                    for(Cheq cheq:list)
                                                {    if(cheq.getCheqt().getUserId()==userc.getUserId())
                                                {  cunt++;}}%>
        <div class="container">
            <div class="row mt-5">                

                <div class="col-md-5">
                    <!--form details-->
                    <!--card-->
                    <div class="card">
                        <div class="card-body">
<%@include file="message.jsp" %>
                            
                            <form action="ReqChServlet" method="post">
                                <div class="form-group">
                                   <h3 class="text-center mb-5">Request a New Checkbook</h3>
                                    <label for="cheqt_user_id">User ID</label>
                                    <input  name="cheqt_user_id" type="text" class="form-control" id="cheqt_user_id" value="<%=userc.getUserId()%>" readonly>
                                    <small id="emailHelp" class="form-text text-muted">This is your unique ICIN user ID.</small>
                                </div>
                                


                                <div class="form-group">
                                    <label for="cheq_connum">Your contact</label>
                                    <input name ="cheq_connum" type="text" class="form-control" id="cheq_connum" value="<%=userc.getUserPhone()%>" readonly  >
                                </div>


                                <div class="form-group">
                                    <label for="cheq_add" >Your shipping address</label>
                                    <textarea name ="cheq_add" class="form-control" id="exampleFormControlTextarea1" placeholder="Enter your shipping address" rows="1"></textarea>
                                </div>

                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Request Now</button>
                                    
                                </div>

                            </form>    

                        </div>
                    </div>
                </div>
                                    
                                    
                                    <div class="col-md-7">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="form-group" style="padding-left: 30px; padding-right: 30px">
                                            
                                            <h3 class="text-center " >Checkbook Status Sheet</h3>
                                            <small id="emailHelp" class="form-text text-muted text-center">You have <%=cunt%> checkbooks </small><br>
                                         
                                                
                                                
                                               <table class="table">
                                                <thead  style="background:#0b2239; color:#fff">   
                                                <tr>
                                                    <th scope="col">#</th>
                                                     <th scope="col"> Checkbook ID</th>
                                                    <th scope="col">Status</th>
                                                     <th scope="col">Address</th>
                                                </tr>    
                                                </thead>
                                               
                                                <tbody>              
                                                <%  int count=0;
                                                String s;
                                                    for(Cheq cheq:list)
                                                {    if(cheq.getCheqt().getUserId()==userc.getUserId())
                                                {  count++;
                                                %>
                                                <tr>
                                                    <td><%=count%></td>
                                                    <% if(cheq.getCheqStatus()==1)
                                                       s= "In Process";
                                                    else if(cheq.getCheqStatus()==2) s="Issued";
                                                    else
                                                    s="Rejected";
                                                    %>
                                                    <td><%=cheq.getCheqId()%> </td>
                                                    <td><%=s%> </td>
                                                    <td><%=cheq.getCheqAdd()%> </td>
                                                    
                                                </tr>
                                              
                                                
                                              <%  } }
                                                    %>
                                                </tbody>
                                                
                                                
                                               </table>
                                                    
                                              
                                                                                                                                         
                                                
                                            
                                            
                                        
                                            </div></div></div></div></div>

        </div><br><br>
        <%@include file="components/footer_1.jsp" %>
    </body>
</html>
