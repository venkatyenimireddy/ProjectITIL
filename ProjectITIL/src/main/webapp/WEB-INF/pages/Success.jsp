<!DOCTYPE html>
<html>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script>
      $(document).ready(function() {
         function disablePrev() { window.history.forward() }
         window.onload = disablePrev();
         window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
      });
   </script>
<body>
<div>
   <a href="" class="ui-btn ui-shadow ui-corner-all ui-btn-inline ui-mini" style="color:black;">back</a>
         <a href="first" class="ui-btn ui-shadow ui-corner-all ui-btn-inline ui-mini" style="float:right;color:black;">Logout</a>  
</div>
<div class="w3-container w3-center w3-animate-left">
<br><br><br><br><br><br><br><br><br>
  <h2 align="center">Your Ticket has been raised Successfully!</h2>
  <p></p>
</div>

</body>
</html>