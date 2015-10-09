<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	HttpSession session = request.getSession(false);
    String msg = (String)request.getAttribute("errMsg");
    if (msg == null){
	  msg = "";
    }
   String action = request.getParameter("action");

    boolean isAuthorized= false;
     if (session != null ){
	 	isAuthorized = Boolean.parseBoolean((String)session.getAttribute("consoleAuth"));
	 	 if ("logout".equalsIgnoreCase(action)) {		
			    session.invalidate();
			    isAuthorized = false;
			    msg="Logged out Successfully";
			}
     }  
     //If user is logged in route to home page
     if (isAuthorized){
	    response.sendRedirect("secure/home.jsp");
     }	 
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
   <title>iPad App KeyNote Monitoring</title>
<link rel="stylesheet" href="css/bootstrap.css"  type="text/css"/>	
<link rel="stylesheet" href="css/bootstrap-theme.css"  type="text/css"/>	
<title>Login : iPAd Console</title>
</head>
<body>
 <div class="container" style="margin-top:30px">
    <h2 style="text-align:center">
			<a href="index.jsp">iPad App Keynote Monitoring</a>
	</h2>
	<br />
	<div class="col-md-4 col-md-offset-4">
	    <div class="panel panel-default">
	  <div class="panel-heading"><h3 class="panel-title"><strong>Skywards Login</strong> </h3></div>
	  <% if (!msg.isEmpty()){ %>
	  <div class="alert alert-danger" id="serviceFailure"><%=msg%></div>
	  <% } %>
	  <div class="panel-body">
	   <form role="form" action="login" method="post">
	  <div class="form-group">
	    <label for="exampleInputEmail1">Skywards ID</label>
	    <input type="text" class="form-control" style="border-radius:0px" id="SkywardsId" name="SkywardsId" placeholder="SkywardsId" value="00999000111" required>
	    
	  </div>
	  <div class="form-group">
	    <label for="exampleInputPassword1">Password</label>
	    <input type="password" class="form-control" style="border-radius:0px" id="password" name="password" placeholder="Password" value="a111111" required>
	  </div>
	  
	  <div class="form-group">
	  <div class="btn-group" data-toggle="buttons">
		  <label class="btn btn-sm btn-default active">
		    <input type="radio" name="endPoint" id="AKAMAI" checked value="1">AKAMAI
		  </label>
		  <label class="btn btn-sm btn-default">
		    <input type="radio" name="endPoint" id="EGTC" value="2">EGTC
		  </label>
		  <label class="btn btn-sm btn-default">
		    <input type="radio" name="endPoint" id="NTT" value="3">NTT
		  </label>
		</div>
		</div>
	  
	  <button type="submit" class="btn btn-primary">Sign in</button>
	</form>
	  </div>
	</div>
	</div>
</div>
	<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>