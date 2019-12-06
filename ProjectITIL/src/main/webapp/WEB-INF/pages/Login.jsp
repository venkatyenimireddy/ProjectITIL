<!DOCTYPE html>
<html lang="en">
<head>
<title>Employee Login</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>
      $(document).ready(function() {
         function disablePrev() { window.history.forward() }
         window.onload = disablePrev();
         window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
      });
   </script>
<style>
body {
background-image: url("http://localhost:9061/images/login.jpg");
background-repeat: no-repeat;
height: 100%;
background-size: cover;
background-attachment: fixed;
background-position: center;
}

.checkbox {
color: white;
}

.form-group {
color: white;
}

.form-group {
color: white;
}

.container {
width: 400px;
margin-left: auto;
margin-right: auto;
margin-top: 100px;
margin-bottom: 100px;
color: white;
}
</style>
<script>
function validateForm() {
var x = document.forms["myForm"]["employeeName"].value;
var y = document.forms["myForm"]["password"].value;
if (x == "") {
alert("Name must be filled out");
return false;
}
else if(y.length<3)
{
alert("Password should be greater than 3 characters");
return false;
}
}
</script>
</head>
<body>

<div class="container">
<hr>
<h2 align="center">Login</h2>
<hr>
<form name="myForm" action="/loginForm" method="get"
modelAttribute="employee" onsubmit="return validateForm()">
<div class="form-group">
<label for="employeeName">Employee Name:</label> <input type="text"
class="form-control" id="employeeName"
placeholder="Enter your Name" name="employeeName">
</div>
<div class="form-group">
<label for="employeePassword">Password:</label> <input
type="password" class="form-control" id="password"
placeholder="Enter password" name="password">
</div>
<div class="checkbox">
<label><input type="checkbox" name="remember">
Remember me</label>
</div>
<button type="submit" class="btn btn-default">Submit</button>
</form>
</div>

</body>
</html>