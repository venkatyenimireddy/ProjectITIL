<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>GateKeeper Page</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script>
      $(document).ready(function() {
         function disablePrev() { window.history.forward() }
         window.onload = disablePrev();
         window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
      });
   </script>
</head>
<body>
<div class="jumbotron jumbotron-fluid">
<div class="container">
<hr>
<h1 align="center">Welcome to Gatekeeper Portal!</h1>
<hr>
<p align="center">This portal helps you to view new  tickets and assign it to the teammenbers and also track Ticket status and make your work more easier. Feel free to contact us.</p>
</div>
</div>
<br>
<div class="container">
<a href="viewnew">View New Tickets</a>
<br>
</div>
<br>
<div class="container">  
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="http://localhost:9061/images/dafds.jpg" alt="one" style="width:100%;">
          <div class="carousel-caption">
          <h3>ITIL</h3>
          <p>Information Technology Infrastructure Library</p>
        </div>
      </div>

      <div class="item">
        <img src="http://localhost:9061/images/six.jpg" alt="two" style="width:100%;">
	  <div class="carousel-caption">
          <p>Any IT issues! One Solution!</p>
        </div>
      </div>
    
      <div class="item">
        <img src="http://localhost:9061/images/hghfg.jpg" alt="three" style="width:100%;">
	  <div class="carousel-caption">
          <p>Feel free to Contact Us</p>
        </div>
      </div>

    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
<br>

</body>
</html>
