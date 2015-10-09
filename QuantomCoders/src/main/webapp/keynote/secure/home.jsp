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
    String action = request.getParameter("action");
    boolean isSkyLogged = false;
    HttpSession httpSession = request.getSession(false);
    Map<String,String> authMap = Collections.emptyMap(); 
    if (httpSession != null) {
		sessionId = httpSession.getId(); 
		isSkyLogged = Boolean.parseBoolean((String) httpSession	.getAttribute("isSkyLogin"));
		authMap =(Map<String,String>)httpSession.getAttribute("authMap");
     }    
%>
<!DOCTYPE html>
<html>
	  <head>
		<meta charset="utf-8"> 
		<meta name="viewport" content="width=device-width, initial-scale=1">
	    <title>Emirates iPAD App</title>
		<link rel="stylesheet" href="<%=resPath%>/css/bootstrap.css"  type="text/css"/>	
		<link rel="stylesheet" href="<%=resPath%>/css/bootstrap-theme.css"  type="text/css"/>	
		</head>
<body>
	<div class="container">
		<jsp:include page="header.jsp"></jsp:include>
		
		<div class="row">
			<div class="col-xs-12 col-sm-6 col-md-9">
			    <div class="alert alert-warning">Emirates Airlines</div>
				<!--  Tiles Start -->
				 <div class="row">
						<div class="col-sm-6 col-md-4">
							<div class="thumbnail">
								<img src="http://cdn.ek.aero/system/images/logos/logo_global.gif" alt="...">
								<div class="caption">
									<h3>Retrieve PNR</h3>
									<p>Emirates' booking management tools put you in control of your trip: 
											View, print or email your itinerary
											Select seats and submit dietary requirements
											Change your booking
											Upgrade flights using your Skywards Miles or credit card
									</p>
									<p align="center">
									<a href="<%=resPath%>/secure/pnrretrieve.jsp" class="btn btn-primary" role="button">Manage Booking</a>
									</p>
								</div>
							</div>
						</div>
					
						<!-- div class="col-sm-6 col-md-4">
							<div class="thumbnail">
								<img src="http://cdn.ek.aero/system/images/logos/logo_global.gif" alt="...">
								<div class="caption">
									<h3>Flight Search</h3>
									<p>Enter your travel details and select your search preferences below. Click Find Flights when you are done.</p>
									<p align="center">
										<a href="<%=resPath%>/secure/FlightSearchRequest.jsp" class="btn btn-primary" role="button">Find Flights</a> 
									</p>
								</div>
							</div>
						</div> -->
						<div class="col-sm-6 col-md-4">
							<div class="thumbnail">
								<img src="http://cdn.ek.aero/system/images/logos/logo_global.gif" alt="...">
								<div class="caption">
									<h3>Flexi Flight Search</h3>
									<p>Enter your travel details and select your search preferences below. Click Find Flights when you are done.</p>
									<p align="center">
										<a href="<%=resPath%>/secure/FlexiFlightSearchRequest.jsp" class="btn btn-primary" role="button">Find Flights</a> 
									</p>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-4">
							<div class="thumbnail">
								<img src="http://cdn.ek.aero/system/images/logos/logo_global.gif" alt="...">
								<div class="caption">
									<h3>Branded Power Flight Search</h3>
									<p>Enter your travel details and select your search preferences below. Click Find Flights when you are done.</p>
									<p align="center">
										<a href="<%=resPath%>/secure/BrandedPowerFlightSearchRequest.jsp" class="btn btn-primary" role="button">Find Flights</a> 
									</p>
								</div>
							</div>
						</div>
						
                </div>
                <div class="row">
                <div class="col-sm-6 col-md-4">
								<div class="thumbnail">
									<img src="http://cdn.ek.aero/system/images/logos/logo_global.gif" alt="...">
									<div class="caption">
										<h3> Retrieive Skywards </h3>
										<p>Check in online between 24 hours and 90 minutes before your flight's departure time.</p>
										<p align="center">
											<a href="<%=resPath%>/secure/RetrieveSkywardRequest.jsp" class="btn btn-primary" role="button">Retrive Skywards</a> 
										</p>
									</div>
								</div>
					</div>  
                <div class="col-sm-6 col-md-4">
							<div class="thumbnail">
								<img src="http://cdn.ek.aero/system/images/logos/logo_global.gif" alt="...">
								<div class="caption">
									<h3>Flight Status</h3>
									<p>Waiting for friends and relatives to arrive? Ask the app to send you status updates on your chosen flights so you know when and where the flight is and the time it's expected to land.</p>
									<p align="center">
										<a href="<%=resPath%>/secure/flightstatusrequest.jsp" class="btn btn-primary" role="button">Flight Status</a> 
									</p>
								</div>
							</div>
						</div>
						
						<div class="col-sm-6 col-md-4">
							<div class="thumbnail">
								<img src="http://cdn.ek.aero/system/images/logos/logo_global.gif" alt="...">
								<div class="caption">
									<h3>Live Flights</h3>
									<p>Follow our flights on the live interactive map and find updates on estimated arrival, altitude, speed, what's on the flights and more.</p>
									<p align="center">
										<a href="<%=resPath%>/secure/liveflightsreq.jsp" class="btn btn-primary" role="button">Live Flights</a> 
									</p>
								</div>
							</div>
						</div>                
                </div>
                <div class = "row">
                   <div class="col-sm-6 col-md-4">
							<div class="thumbnail">
								<img src="http://cdn.ek.aero/system/images/logos/logo_global.gif" alt="...">
								<div class="caption">
									<h3>Weather Forecast</h3>
									<p> Check Weather of destination </p>
									<p align="center">
										<a href="<%=resPath%>/secure/accuweatherreq.jsp" class="btn btn-primary" role="button">Forecast</a> 
									</p>
								</div>
							</div>
						</div>             
                 </div>
                 <div class="row">
                <!--                
                	<div class="col-sm-6 col-md-4">
							<div class="thumbnail">
								<img src="http://cdn.ek.aero/system/images/logos/logo_global.gif" alt="...">
								<div class="caption">
									<h3> Check IN Online</h3>
									<p>Check in online between 24 hours and 90 minutes before your flight's departure time.</p>
									<p align="center">
										<a href="<%=resPath%>/secure/checkinonlinerequest.jsp" class="btn btn-primary" role="button">Check-in</a> 
									</p>
								</div>
							</div>
						</div>                
                 </div>
                 -->
                </div>
                
				<!--  Tiles Ends -->
			</div>
			<jsp:include page="QuickLinks.jsp"></jsp:include>	
	   </div>
		<hr>
	<jsp:include page="footer.jsp"></jsp:include>
	</div>
	<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script src="<%=resPath%>/js/bootstrap.js"></script>
	
</body>
</html>