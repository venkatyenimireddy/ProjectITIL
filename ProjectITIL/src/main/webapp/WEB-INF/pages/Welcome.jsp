<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <style>
 body {
  background-image: url("http://localhost:9061/images/welcome4.jpg");
 
  background-repeat: no-repeat;
  height: 100%;
  background-size: cover; 
  background-attachment: fixed;
  background-position: center;
  color: white;
} 
footer {
    clear: both;
    position: relative;
    height: 200px;
    margin-top: -200px;
    text-align: center;
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

<h1 align="center" style="font-family:verdana;font-size:300%;">ITIL - TICKETING SYSTEM</h1>
<h5 align="center"><b>Raise all your IT tickets in one place</b></h5>
<div>
   <a href="#Equipment" class="ui-btn ui-shadow ui-corner-all ui-btn-inline ui-mini" style="color:white;">MENU</a>
         <a href="login" class="ui-btn ui-shadow ui-corner-all ui-btn-inline ui-mini" style="float:right;color:white;">LOGIN</a>  
</div>




<div class="container">
  <h2>About ITIL - TICKETING SYSTEM</h2>
  <a href="#demo" class="btn btn-info" data-toggle="collapse">Read More...</a>
  <div id="demo" class="collapse">
    A service desk is a communications center that provides a single point of contact (SPOC) between a company and its customers, employees and business partners. The purpose of a service desk is to ensure that users receive appropriate help in a timely manner.
  </div>
</div>

<div class="container">
  <h2>Get your Tickets</h2>
  <a href="#demo1" class="btn btn-info" data-toggle="collapse">Read More...</a>
  <div id="demo1" class="collapse">
    Zendesk Support puts all your customer information in one place, providing your help or service desk with everything it needs from a single point. Communication between you and your users is efficient, relevant, and personal. Customizable views let agents see their queue based on ticket status, assignee, group, or other conditions. Dynamic request forms quickly give agents the right context, so they’re prepared to offer personalized customer support.
  </div>
</div>
  <div class="container">
    <h2>Have any Queries?</h2>
  <a href="#demo3" class="btn btn-info" data-toggle="collapse">Read More...</a>
  <div id="demo3" class="collapse">
  Yet people often apologize for — or don’t bother — asking them. What’s more, we malign basic questions as dumb or stupid. Inquiries so simple, it’s a waste of time to contemplate them. That’s prompted the popular defense of the basic question, which is the aphorism “There’s no such thing as a stupid question.”
  </div>
  
  </div>

 <div class="footer" align="center">© 2019 Copyright:
    <a href="https://mdbootstrap.com/education/bootstrap/"> ITIL.com</a>
    </div>
</body>
</html>
</html>