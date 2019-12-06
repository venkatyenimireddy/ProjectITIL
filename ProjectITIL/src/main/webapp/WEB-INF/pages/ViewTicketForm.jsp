<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Details</title>
<script>
      $(document).ready(function() {
         function disablePrev() { window.history.forward() }
         window.onload = disablePrev();
         window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
      });
   </script>
<style>
body {
  background-image: url("http://localhost:9061/images/table1.jpg");
 
  background-repeat: no-repeat;
  height: 100%;
  background-size: cover; 
  background-attachment: fixed;
  background-position: center;
} 
table{
  margin-top: 100px;
  margin-bottom: 100px;  
}
th
{
  background-color:  #98e3ab;
 
 
}
td
{
color: white;
}

/* tr:nth-child(even) {
  background-color: #98c7e3;
} */
</style>
</head>
<body>
<div>
   <a href="" class="ui-btn ui-shadow ui-corner-all ui-btn-inline ui-mini" style="color:white;">back</a>
         <a href="first" class="ui-btn ui-shadow ui-corner-all ui-btn-inline ui-mini" style="float:right;color:white;">Logout</a>  
</div>
<h2 align="center" style="font-family:verdana;font-size:300%;color: white;">RAISED TICKETS</h2>
<hr size="4" color="gray"/>
<table cellpadding="15" border="1" align="center">
<tr>
        <td style="color: white;"><b>Ticket ID</b></td>
        <td style="color: white;"><b>Ticket Description</b></td>
        <td style="color: white;"><b>Status</b></td>
        <td style="color: white;"><b>Project Name</b></td>
        <td style="color: white;"><b>Reporting Manager</b></td>
        <td style="color: white;"><b>Mobile Number</b></td>
       
   </tr>
<%-- <%=eList%> --%>
    <c:forEach items="${ticketList}" var="employee">
        <tr>
          <td><c:out value="${employee.ticketId}"/></td>
            <td><c:out value="${employee.description}"/></td>
            <td><c:out value="${employee.ticketType}"/></td>
            <td><c:out value="${employee.projectName}"/></td>  
            <td><c:out value="${employee.reportingManager}"/></td>  
            <td><c:out value="${employee.mobileNumber}"/></td>  
        </tr>
    </c:forEach>
</table>
<marquee style="color: white;"><b>The above table shows the tickets raised by you,if the above tickets is not raised by you means visit-https://ITIL.com or try self service option or call 1800-266-7821(India)</b></marquee>
<hr size="4" color="gray"/>
</body>
</html>