<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.emirates.mobile.wadl.ws.MobilAppRestServiceMeta,com.emirates.mobile.WebServiceMetaDataUtil,
	java.util.*,com.emirates.mobile.wadl.bean.*" session="false"%>

<%
    String resPath = request.getContextPath();
    MobilAppRestServiceMeta restServiceMeta = null;
    List<RestServices> serviceList = null;
    String sessionId = null;    
    boolean isSkyLogged = false;
    HttpSession httpSession = request.getSession(false);
    Map<String,String> authMap = Collections.emptyMap(); 
    if (httpSession != null) {
		sessionId = httpSession.getId(); 
		String status=null;
		status=(String) httpSession	.getAttribute("isSkyLogin");
		if(status!=null){
			isSkyLogged = Boolean.parseBoolean((String) httpSession	.getAttribute("isSkyLogin"));
		}		
		authMap =(Map<String,String>)httpSession.getAttribute("authMap");
     }    
%>
	<h4>	<% 
			if(isSkyLogged){
				%>
			<a href="home.jsp">Welcome : <%=httpSession.getAttribute("skywardId")%></a>
			<%}%>
	</h4>
<nav class="navbar navbar-default" role="navigation">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span><span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="home.jsp">Home</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="<%=resPath%>/secure/pnrretrieve.jsp">Retrieve PNR</a></li>
						<!--<li><a href="<%=resPath%>/secure/FlightSearchRequest.jsp">Flight Search</a></li>-->
						<li><a href="<%=resPath%>/secure/FlexiFlightSearchRequest.jsp">Flexi Flight Search</a></li>
						<li><a href="<%=resPath%>/secure/BrandedPowerFlightSearchRequest.jsp">Branded Power Flight Search</a></li>
						<li><a href="<%=resPath%>/secure/liveflightsreq.jsp">Live Flights</a></li>
						<li><a href="<%=resPath%>/secure/accuweatherreq.jsp">Accuweather</a></li>
						<li><a href="<%=resPath%>/secure/flightstatusrequest.jsp">Flight Status</a></li>
						<!--  <li><a href="<%=resPath%>/secure/checkinonlinerequest.jsp">Check-in</a></li>-->
						<li><a href="<%=resPath%>/secure/RetrieveSkywardRequest.jsp">My Skywards</a></li>
					
					</ul>	
					<%
						if (isSkyLogged) {
					%>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="<%=resPath%>/index.jsp?action=logout">Logout</a></li>
					</ul>
					<%
						}
					%>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
		