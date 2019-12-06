
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns:th="http://www.thymeleaf.org" >
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

<h2 align="center" style="font-family:verdana;font-size:300%;color: white;">NEW TICKETS</h2>
<hr size="4" color="gray"/>
<table cellpadding="15" border="1" align="center">
<tr>
        <td><b>Ticket ID</b></td>
          <td><b>Employee Id</b></td>
        <td><b>Ticket Description</b></td>
        <td><b>Project Name</b></td>
        <td><b>Reporting manager</b></td>
        <td><b>Mobile Number</b></td>
        <td><b>Ticket Status</b></td>
        
   </tr>

    <c:forEach items="${newTicketList}" var="employee1">
        <tr>
            <td><a href="/complete/${employee1.ticketId}"> <c:out value="${employee1.ticketId}" /></a></td>
            <td><c:out value="${employee1.employeeId}"/></td>
            <td><c:out value="${employee1.description}"/></td>
            <td><c:out value="${employee1.projectName}"/></td>
            <td><c:out value="${employee1.reportingManager}"/></td>
            <td><c:out value="${employee1.mobileNumber}"/></td>
            <td><c:out value="${employee1.ticketType}"/></td>
           
            
            
        </tr>
    </c:forEach>
</table>
<marquee style="color: white;"><b>The above table shows the tickets raised by you,if the above tickets is not raised by you means visit-https://ITIL.com or try self service option or call 1800-266-7821(India)</b></marquee>
<hr size="4" color="gray"/>
</body>
</html>