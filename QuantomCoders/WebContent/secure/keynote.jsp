<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.emirates.mobile.wadl.ws.MobilAppRestServiceMeta,com.emirates.mobile.WebServiceMetaDataUtil,java.util.List,com.emirates.mobile.wadl.bean.*" session="false"%>
									
<%
    String resPath = request.getContextPath();    
%>
<!DOCTYPE html>
<html>
	  <head>
		<meta charset="utf-8"> 
		<meta name="viewport" content="width=device-width, initial-scale=1">
	    <title>EK App : Keynote Monitoring</title>
		<link rel="stylesheet" href="<%=resPath%>/css/bootstrap.css"  type="text/css"/>	
		<link rel="stylesheet" href="<%=resPath%>/css/bootstrap-theme.css"  type="text/css"/>	
	</head>
<body>
	<div class="container">
		<h2>
			<a href="index.jsp">EK App : KeyNote Monitoring</a>
		</h2>
		<nav class="navbar navbar-default" role="navigation">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Home</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="meta/" target="_blank">Service Doc</a>
						</li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Server <b class="caret"></b> </a>
							<ul class="dropdown-menu">
								<li><a href="#">Status</a>
								</li>								
								<li class="divider"></li>
								<li><a href="#">Admin</a>
								</li>							
							</ul></li>
					</ul>
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Search">
						</div>
						<!-- <button type="submit" class="btn btn-default">Submit</button>-->
					</form>
			    </div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>

		<div class="row">
			<div class="col-xs-12 col-sm-6 col-md-8">
			    <div class="alert alert-success">Available Services for iPAD</div>
			    
			    <form class="form-horizontal" role="form" action="<%=resPath%>/secure/keynote" method="post" target="_blank">
			       <button type="button" class="btn btn-primary">Save changes</button>
			    
			    </form>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-4">
				
			</div>
		</div>
		<hr>
		<div class="footer">
			<p>EK App : Keynote </p>
		</div>	
	</div>
	<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script src="<%=resPath%>/js/bootstrap.js"></script>
</body>
</html>