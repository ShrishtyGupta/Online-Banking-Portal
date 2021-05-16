<%@page import="java.util.List"%>
<%@page import="com.learn.icinbank.entities.Cheq"%>
<%@page import="com.learn.icinbank.dao.ReqCheqDao"%>
<%@page import="com.learn.icinbank.helper.FactoryProvider"%>
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
        <title><%=user.getUserName()%>'s Panel</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body style="background: #0b2239">
    <%@include file="components/navbar.jsp" %>
    <%
      ReqCheqDao dao=new ReqCheqDao(FactoryProvider.getFactory());
      List<Cheq> list = dao.getAllCheq();
    %>
    <%  
     int cunt=0;
     for(Cheq cheq:list)
     {    if(cheq.getCheqStatus()==1)
           cunt++;}
    %>
    <div class="container">
    <div class="row mt-5">                

    <div class="col-md-5">
    <!--form details-->
                   <!--card-->
        <div class="card">
        <div class="card-body">
        <%@include file="message.jsp" %>
                            
        <form action="UpdateStatusServlet" method="post">
        <div class="form-group">
        <h3 class="text-center mb-5">Approve Checkbook Requests</h3>
        <label for="cheqt_user_id">User ID</label>
        <input  name="cheqt_user_id" type="text" class="form-control" id="cheqt_user_id"  >
        <small id="emailHelp" class="form-text text-muted">Enter ID of User</small>
        </div>
                                


        <div class="form-group">
        <label for="cheq_id">Checkbook ID</label>
        <input name ="cheq_id" type="text" class="form-control" id="cheq_id"  >
        <small id="emailHelp" class="form-text text-muted">Enter Checkbook ID</small>
        </div>


        <div class="form-group">
        <label for="cheq_status" >Update Status</label>
        <select class="form-control" id="cheq_statuss" name="cheq_status">
  <option value="1">1-Pending</option>
  <option value="2">2-Approved</option>
  <option value="3">3-Rejected</option>
    
</select>
        <small id="emailHelp" class="form-text text-muted">1-Pending, 2-Approved, 3-Rejected</small>
        </div>

        <div class="container text-center">
        <button class="btn btn-outline-success">Update Status</button>
                                
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
                                            <small id="emailHelp" class="form-text text-muted text-center">Total <%=cunt%> New Checkbook Requests  </small><br>
                                         
                                                
                                                
                                               <table class="table">
                                                <thead  style="background:#0b2239; color:#fff">   
                                                <tr>
                                                    <th scope="col">#</th>
                                                     <th scope="col">User Name</th>
                                                     <th scope="col"> User ID</th>
                                                     
                                                    <th scope="col">Checkbook ID</th>
                                                     <th scope="col">Approval Status</th>
                                                </tr>    
                                                </thead>
                                               
                                                <tbody>              
                                                <%  int count=0;
                                                String s;
                                                    for(Cheq cheq:list)
                                                {    
                                                 count++;
                                                %>
                                                
                                                <% if( cheq.getCheqStatus()==1  )
                                                { %>
                                                
                                                <tr style="font-weight:bold">
                                                    <td><%=count%></td>
                                                    <td><%=cheq.getCheqt().getUserName()%> </td>
                                                    <td><%=cheq.getCheqt().getUserId()%> </td>
                                                    
                                                    <td><%=cheq.getCheqId()%> </td>
                                                    <% if(cheq.getCheqStatus()==1)
                                                       s= "Pending";
                                                    else if(cheq.getCheqStatus()==2) s="Approved";
                                                    else
                                                    s="Rejected";
                                                    %>
                                                    <td><%=s%> </td>
                                                </tr>
                                                
                                                
                                                <%}
                                                else
                                                {%>
                                                
                                                <tr>
                                                    <td><%=count%></td>
                                                    <td><%=cheq.getCheqt().getUserName()%> </td>
                                                    <td><%=cheq.getCheqt().getUserId()%> </td>
                                                    
                                                    <td><%=cheq.getCheqId()%> </td>
                                                    <% if(cheq.getCheqStatus()==1)
                                                       s= "Pending";
                                                    else if(cheq.getCheqStatus()==2) s="Approved";
                                                    else
                                                    s="Rejected";
                                                    %>
                                                    <td><%=s%> </td>
                                                </tr>
                                                <%}%>
                                                
                                              
                                                
                                              <%   }
                                                    %>
                                                </tbody>
                                                
                                                
                                               </table>
                                                    
                                              
                                                                                                                                         
                                                
                                            
                                            
                                        
                                            </div></div></div></div></div>

        </div><br><br>
        <%@include file="components/footer_1.jsp" %>    
        
        
        
    </body>
</html>
