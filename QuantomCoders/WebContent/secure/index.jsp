<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.emirates.mobile.wadl.ws.MobilAppRestServiceMeta,com.emirates.mobile.WebServiceMetaDataUtil,java.util.List,com.emirates.mobile.wadl.bean.*" session="false"%>
									
<%
    String resPath = request.getContextPath();
    MobilAppRestServiceMeta restServiceMeta = null;
    List<RestServices> serviceList = null;
    String sessionId = null;
    
    try{
		restServiceMeta = WebServiceMetaDataUtil.getMetaData();
		serviceList = restServiceMeta.getServiceList();
    }catch(Exception e){
	 	out.print("IPAD Config are Not yet loaded.You will be redirected to config page... wait for a while things will be done for you ");
	 	response.sendRedirect("secure/config");
	 }
    
    Collections.sort(serviceList);
    String action = request.getParameter("action");
    boolean isSkyLogged = false;
    HttpSession httpSession = request.getSession(false);    
    if (httpSession != null) {
		sessionId = httpSession.getId(); 
		isSkyLogged = Boolean.parseBoolean((String) httpSession	.getAttribute("isSkyLogin"));
     }
    if ("logout".equalsIgnoreCase(action)) {		
		if (httpSession != null) {
		    isSkyLogged = false;
		    httpSession.invalidate();
		}
    }
%>
<!DOCTYPE html>
<html>
	  <head>
		<meta charset="utf-8"> 
		<meta name="viewport" content="width=device-width, initial-scale=1">
	    <title>EK App Console : Service List</title>
		<link rel="stylesheet" href="<%=resPath%>/css/bootstrap.css"  type="text/css"/>	
		<link rel="stylesheet" href="<%=resPath%>/css/bootstrap-theme.css"  type="text/css"/>	
		<script type="text/javascript"> 
			var prefix = "localStorageDemo-";
			var $buoop = {vs:{i:9,f:15,o:15,s:5.1,n:9}}; 
			$buoop.ol = window.onload; 
			window.onload=function(){ 
			 try {if ($buoop.ol) $buoop.ol();}catch (e) {} 
			 var e = document.createElement("script"); 
			 e.setAttribute("type", "text/javascript"); 
			 e.setAttribute("src", "//browser-update.org/update.js"); 
			 document.body.appendChild(e); 
			 writeFromStorage();
			} 		
						
			function writeFromStorage() {
			    $("#favs").empty();	    	  
			    if(localStorage.length<1)
			    	{			    	
			    	$("#favDiv").css("display","none");
			    	}
			    else{
			    	$("#favDiv").css("display","");
			    	for(var i = 0; i < localStorage.length; i++)    
				    {
				        var key = localStorage.key(i);              
				        if(key.indexOf(prefix) == 0) {
				            var value = localStorage.getItem(key);  
				            var shortkey = key.replace(prefix, "");
				            $("#favs").append($("<div class='list-group'>").html('<a href='+'\"'+shortkey+'\"' +' class='+'\"'+"list-group-item"+'\" >' +value+'</a>'));
				        }
				    }
			    }
			    
			}
		</script>
	</head>
<body>
	<div class="container">
		<h2>
			<a href="index.jsp">EK App Console</a>
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
						<li><a href="<%=resPath%>/secure/meta/index.html" target="_blank">Service Doc</a>
						</li>
						<li><a href="http://dolnxprodvm563:8081/ek-app" target="_blank">Mobility Wiki</a></li>
					</ul>
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Search">
						</div>
						<!-- <button type="submit" class="btn btn-default">Submit</button>-->
					</form>
					<%
						if (isSkyLogged) {
					%>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="<%=resPath%>/secure/index.jsp?action=logout">Logout</a></li>
					</ul>
					<%
						}
					%>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>

		<div class="row">
			<div class="col-xs-12 col-sm-6 col-md-8">
			    <div class="alert alert-success">Available Services for iPAD</div>
				<div class="panel-group" id="accordion">
				<%
				    int maxElement = serviceList.size();
				    for (int i = 0; i < maxElement; i++) {
						RestServices services = serviceList.get(i);
						boolean isSecure = services.isSecure();
				%>
				
				<!--  Loop Here -->
					<div class="panel panel-info">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapse<%=i%>"><%=services.getPath()%></a>
							</h4>
						</div>
						<div id="collapse<%=i%>" class="panel-collapse collapse">
							<div class="panel-body">
								<div class="list-group">
								  <%
								      List<WebResource> webResourceList = services
 								  			.getWebResourceList();
								  		for (int j = 0; j < webResourceList.size(); j++) {
								  		    WebResource webResource = webResourceList.get(j);
								  %>
									<a href="service.jsp?ws=<%=services.getPath()%>&wm=<%=webResource.getPath()%>&secure=<%=Boolean.toString(isSecure)%>" class="list-group-item"><%=webResource.getPath()%></a> 
								  <%
 								      }
 								  %>
								</div>
							</div>
						</div>
					</div>
			  <!--  Loop End -->
			  <%
			      }
			  %>
					
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-4">
			   <div class="alert alert-success">Quick Link</div>
			   			<div class="panel-group" id="accordion">
					<div id="favDiv" class="panel panel-info">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseFav">Favorite</a>
							</h4>
						</div>
						<div id="collapseFav" class="panel-collapse">
							<div id="favs" class="panel-body">								
							</div>
						</div>
					</div>
				</div>
				
			   	   <div class="panel-group" id="accordion">
					<div class="panel panel-info">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseRcnt">Recent Service</a>
							</h4>
						</div>
						<div id="collapseRcnt" class="panel-collapse">
							<div class="panel-body">
								<div class="list-group">
									<a href="service.jsp?ws=OpenServices&amp;wm=/retrieveAccountInfo.json&secure=false" class="list-group-item">Login</a> 

								</div>
							</div>
						</div>
					</div>
				</div>
			
			</div>
		</div>
		<hr>
		<div class="footer">
			<p>EK App Console v2.0.0 &copy; 2014</p>
		</div>	
		<div class="alert alert-warning">
			Debug Info
			<ul>
				<li>Session : <%=sessionId%></li>
			</ul>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script src="<%=resPath%>/js/bootstrap.js"></script>
</body>
</html>