<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<html>
<title>Raise A Ticket</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<head>
<style>
.container {
width: 400px;
margin-left: auto;
margin-right: auto;
margin-top: 70px;
margin-bottom: 60px;
color: white;
}
</style>

<script>
function validateForm() {
var number = /^[0-9]+$/;
var alphabet = /^[a-zA-Z]+$/;
var x = document.forms["myForm"]["projectName"].value;
var y = document.forms["myForm"]["reportingManager"].value;
var z = document.forms["myForm"]["mobileNumber"].value;
if (x == "") {
alert("Project Name must be filled out");
return false;
}

else if (x.match(number)) {
alert("Project Name can't have Numbers");
return false;
}

else if (y == "") {
alert("Reporting Manager must be filled out");
return false;
}

else if (z == "") {
alert("Mobile Number must be filled out");
return false;
}

else if (z.match(alphabet)) {
alert("Mobile Number can't have Alphabets");
return false;
}

}
</script>
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
<form name="myForm" action="/NewTickets" modelAttribute="tickets"
class="w3-container" onsubmit="return validateForm()">
<p>
<label class="w3-text-brown"><b>Employee Id</b></label> <input
class="w3-input w3-border w3-sand" name="employeeId" type="text"
value="${employeeId }" readonly>
</p>
<p>
<label class="w3-text-brown"><b>Project Name</b></label> <input
class="w3-input w3-border w3-sand" name="projectName" type="text"
id="projectName" placeholder="Your Project">
</p>
<p>
<label class="w3-text-brown"><b>Reporting Manager</b></label> <input
class="w3-input w3-border w3-sand" name="reportingManager"
type="text" id="reportingManager" placeholder="Your RM">
</p>
<p>
<label class="w3-text-brown"><b>Contact Number</b></label> <input
class="w3-input w3-border w3-sand" name="mobileNumber" type="text"
id="mobileNumber" placeholder="Contact Number">
</p>
<p>
<label class="w3-text-brown"><b>Ticket Description</b></label> <input
class="w3-input w3-border w3-sand" name="description" type="text"
placeholder="Tell us your issue">
</p>
<p>
<button class="w3-btn w3-brown">Book It</button>
</p>
</form>
</div>
</div>

</body>
</html>