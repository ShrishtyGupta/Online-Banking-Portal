<%@page import="com.learn.icinbank.entities.User"%>
<%

    User user1 = (User) session.getAttribute("current-user");
    
    
    
%>

<nav class="navbar navbar-expand-lg navbar-light bg-light  " style="background: #4b4a67" >
    <div class ="container" ><a class="navbar-brand" href="index.jsp">I C I N   &nbsp;&nbsp; B A N K</a>
  
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent" >
   <ul class="navbar-nav ml-auto ">
       
   <% if(user1==null)
        {
   %>
            <li class="nav-item active">
        <a class="nav-link" href="index.jsp">HOME &nbsp;&nbsp;<span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item active">
        <a class="nav-link" href="services.jsp">SERVICES &nbsp;&nbsp;<span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item active">
        <a class="nav-link" href="register.jsp">REGISTRATION &nbsp;&nbsp;<span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item active">
        <a class="nav-link" href="login.jsp">LOGIN <span class="sr-only">(current)</span></a>
      </li>
      
      <%
          }
else if (user1.getUserType().equals("normal")) {
%>

                    <li class="nav-item active">
        <a class="nav-link" href="index.jsp">HOME &nbsp;&nbsp;&nbsp;<span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item active">
        <a class="nav-link text-uppercase" href="userservices.jsp"> <%= user1.getUserName()%>'S  SERVICES &nbsp;&nbsp;<span class="sr-only">(current)</span></a>
      </li>
      
      
      
      <li class="nav-item active">
        <a class="nav-link" href="LogoutServlet">LOGOUT <span class="sr-only">(current)</span></a>
      </li>


      <%        
          }
else if (user1.getUserType().equals("admin"))
{ %>
 <li class="nav-item active">
        <a class="nav-link" href="index.jsp">HOME &nbsp;&nbsp;&nbsp;<span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item active">
        <a class="nav-link text-uppercase" href="adminservices.jsp"> <%= user1.getUserName()%>'S  SERVICES &nbsp;&nbsp;<span class="sr-only">(current)</span></a>
      </li>
      
      
      
      <li class="nav-item active">
        <a class="nav-link" href="LogoutServlet">LOGOUT <span class="sr-only">(current)</span></a>
      </li>
<%
}
%>
       
   
     
   
      
      
      </ul>
     
      
    
  </div>
        </div>
</nav>