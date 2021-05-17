<%
    String message_1 = (String) session.getAttribute("message_1");
    if (message_1 != null) {

        //prints
        // out.println(message);

%>


<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong><%= message_1%></strong> 
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button><br>
</div>


<%            session.removeAttribute("message_1");

    }


%>