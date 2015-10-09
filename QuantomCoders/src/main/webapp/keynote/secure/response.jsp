<%@page import="com.emirates.mobile.util.EmiratesAppHelper"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.emirates.mobile.wadl.ws.MobilAppRestServiceMeta,com.emirates.mobile.WebServiceMetaDataUtil,java.util.List,com.emirates.mobile.wadl.bean.*" session="false"%>

<%
    String rootUrl = "http://localhost:8080/EmiratesAppProxy/restful/";
    String webService = request.getParameter("ws");
    String webMethod = request.getParameter("wm");
    String sessionID = null;
    String resouceLocatorKey = webService + "#" + webMethod;
    WebResource resource = WebServiceMetaDataUtil.webServiceParams()
		    .get(resouceLocatorKey);
    List<String> param = resource.getParams();
    String secure = request.getParameter("secure");
    boolean isSecure = Boolean.parseBoolean(secure);
    HttpSession session = request.getSession(false);
    String skywardId = "";
    boolean isSkyLogged = false;
    if (session != null) {
		sessionID = session.getId(); 
		isSkyLogged = Boolean.parseBoolean((String) session
			.getAttribute("isSkyLogin"));
		rootUrl = (String) session.getAttribute("rootUrl");
    }
    //out.print("isSkyLogged " + isSkyLogged);
    boolean isLoginRequest = false;

    if (!isSecure && webMethod.contains("retrieveAccountInfo.json")) {
		isLoginRequest = true;
    }
    Properties sampleData = EmiratesAppHelper.getSampleRequest(
		    webService, webMethod);
%>
<!DOCTYPE html>
<html>
	  <head>
		<meta charset="utf-8"> 
		<meta name="viewport" content="width=device-width, initial-scale=1">
	    <title>iPad App Console : WebService Response </title>
		<link rel="stylesheet" href="css/bootstrap.css"  type="text/css"/>	
		<link rel="stylesheet" href="css/bootstrap-theme.css"  type="text/css"/>	
	</head>
<body>
	<div class="container">
		<h2>
			<a href="index.jsp">iPad App Console</a>
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
					<a class="navbar-brand" href="index.jsp">Home</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="meta/" target="_blank">Service Doc</a>
						</li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Admin <b class="caret"></b> </a>
							<ul class="dropdown-menu">
								<li><a href="#">Action</a>
								</li>
								<li><a href="#">Another action</a>
								</li>
								<li><a href="#">Something else here</a>
								</li>
								<li class="divider"></li>
								<li><a href="#">Separated link</a>
								</li>
								<li class="divider"></li>
								<li><a href="#">One more separated link</a>
								</li>
							</ul></li>
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
						<li><a href="index.jsp?action=logout">Logout</a></li>
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
			       <form class="form-horizontal" role="form" action="console" method="post" target="_blank">
			       <!-- If not Logged in -->
			           <%
			               if (!isSkyLogged) {
			           %>
			            <p>
							<div class="btn-group">
								  <button type="button" class="btn btn-primary btnenv" title="http://lnxdevvm140:8080/EmiratesAppProxy/restful/">DEV</button>
								  <button type="button" class="btn btn-primary btnenv" title="https://ekmobileapp.emirates.com/EmiratesAppProxy/restful/">STG</button>
								  <button type="button" class="btn btn-primary btnenv" title="https://mobileappstg1.emirates.com/EmiratesAppProxy/restful/">PREPROD</button>
								  <button type="button" class="btn btn-primary btnenv" title="https://mobileapp.emirates.com/EmiratesAppProxy/restful/">PROD</button>
							</div>								
								<div class="form-group">
									<div class="col-sm-10">
									  <input type="text" value="<%=rootUrl%>" name="rootUrl" placeholder="End Point" class="form-control" id="endPoint"/>
									</div>
								  </div>
						</p>	
						<%
							    } else {
							%>
					
					<!--  If logged in -->
					  <div class="alert alert-info"> End Point : <%=rootUrl%></div>
				      <input type="hidden" value="<%=rootUrl%>" name="rootUrl"	/>
					<%
					    }

					   if (isSecure) {
							if (isSkyLogged) {
							    skywardId = (String) request.getSession().getAttribute("skywardId");
					%>
					<div class="alert alert-info">
						Logged-in Skyward ID : <%=skywardId%> .. 
						<a href="index.jsp?action=logout">Logout</a>
					</div>
					<%
					    } else {
					%>				
					<div class="form-group">
						<div class="col-sm-10">
						   <input type="text" class="form-control" id="skywardId" placeholder="Enter Skyward Id" name="skywardId" value="00999000111">
						</div>
				  </div>
				  
				  <div class="form-group">
						<div class="col-sm-10">
						   <input type="password" class="form-control" id="password" placeholder="Enter Password" name="password" value="a111111">
						</div>
				  </div>
					<%
					    }
					    }
					%>
					
				<h4>Input Details to execute <%=webService%><%=webMethod%></h4>
			  	<hr />
			  	<input type="hidden" value="<%=webService%>" name="webService"	/>
				<input type="hidden" value="<%=webMethod%>" name="webMethod"	/>				
				<input type="hidden" value="<%=secure%>" name="isSecure"	/>
				<input type="hidden" value="<%=isLoginRequest%>" name="isLoginRequest"	/>
					
				<!-- Service Params   -->
					<%
					    for (int i = 0; i <= param.size() - 1; i++) {
							String parm = param.get(i);
							if (isSkyLogged && isLoginRequest)
							    break;

							String sampleValue = "";
							if (sampleData != null) {
							    sampleValue = sampleData.getProperty(parm);
							    if (sampleValue == null) {
								sampleValue = sampleData.getProperty(Character
									.toUpperCase(parm.charAt(0))
									+ parm.substring(1));
							    }
							    if (sampleValue == null) {
								sampleValue = "";
							    }
							}
					%>
					<div class="form-group">
					<div class="col-sm-10">
					   <div class="input-group">
					  <span class="input-group-addon">
						<input type="checkbox" name="<%=parm%>_checked" title="Mark if sensitive">
					  </span>
					  <input type="text" class="form-control" id="<%=parm%>" placeholder="<%=parm%>" name="<%=parm%>" value="<%=sampleValue%>" title="<%=parm%>">
					</div>
					</div>
				  </div>

					<%
					    }

					    if (isSkyLogged && isLoginRequest) {
					%>
					     <div class="alert alert-error"> You are Logged in as <%=(String) request.getSession().getAttribute("skywardId")%> . 
					     <a href="index.jsp?action=logout">Logout</a> to execute this service again.</div>
					    <%
					        } else {
					    %>
					<!-- Service Params   -->										
					<div class="form-group">
						<div class="col-sm-offset-0 col-sm-10">
						  <button type="submit" class="btn btn-danger">Execute Service</button>
						</div>
				  </div>
					<%
					    }
					%>
				</form>
			</div>
			<div class="col-xs-6 col-md-4"></div>
		</div>
		<hr>
		<div class="footer">
			<p>iPad App Console v1.2.0 &copy; 2014</p>
		</div>	
		<div class="alert alert-warning">
			Debug Info
			<ul>
				<li>Session : <%=sessionID%></li>
			</ul>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
	<script>
	  $('.btnenv').click(function () {
	    var btn = $(this);
	    var endPoint = btn.attr("title");
	    $('#endPoint').val(endPoint);
	  });
	</script>	
</body>
</html>