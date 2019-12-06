<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<title>Raise A Ticket</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.container
{
 width: 400px;
    margin-left: auto;
    margin-right: auto;
     margin-top: 70px;
    margin-bottom: 60px;
      color: white;
}
</style>
<script>
      $(document).ready(function() {
         function disablePrev() { window.history.forward() }
         window.onload = disablePrev();
         window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
      });
   </script>
</head>
<body>

<div class="container">
<div class="w3-card-4">
  <div class="w3-container w3-brown">
    <h2 align="center">My Ticket</h2>
  </div>
  <form method="post" action="teamMembers/${ticketId }" class="w3-container">
    <p>      
    <label class="w3-text-brown"><b>Employee Id</b></label>
    <input class="w3-input w3-border w3-sand" name="employeeId" type="text" value="${ticketDetails.employeeId }" readonly></p>
    <p>      
    <label class="w3-text-brown"><b>Project Name</b></label>
    <input class="w3-input w3-border w3-sand" name="projectName" type="text" value="${ticketDetails.projectName }" readonly></p>
    <p>      
    <label class="w3-text-brown"><b>Reporting Manager</b></label>
    <input class="w3-input w3-border w3-sand" name="reportingManager" type="text" value="${ticketDetails.reportingManager }" readonly></p>
    <p>      
    <label class="w3-text-brown"><b>Contact Number</b></label>
    <input class="w3-input w3-border w3-sand" name="mobileNumber" type="text" value="${ticketDetails.mobileNumber }" readonly></p>
    <p>      
    <label class="w3-text-brown"><b>Ticket Description</b></label>
    <input class="w3-input w3-border w3-sand" name="description" value="${ticketDetails.description}" readonly></p>
    <p>
    <select class="w3-input w3-border w3-sand"  id="teamMember" name="teamMember"> 
<c:forEach items="${teamMembers}" var="choic">
<option name="teamMember" value="${choic.employeeName}">${choic.employeeName} </option>
</c:forEach>
</select>
    <p>
    <button class="w3-btn w3-brown">Submit</button></p>
  </form>
</div>
</div>

</body>
</html> 


