<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.emirates.mobile.wadl.ws.MobilAppRestServiceMeta,com.emirates.mobile.WebServiceMetaDataUtil,
	java.util.*,com.emirates.mobile.wadl.bean.*,com.emirates.mobile.util.Constants" session="false"%>
									
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
		isSkyLogged = Boolean.parseBoolean((String) httpSession	.getAttribute("isSkyLogin"));
		authMap =(Map<String,String>)httpSession.getAttribute("authMap");
     }   
    java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd"); 
	Calendar c = Calendar.getInstance();
	c.setTime(new Date()); // Now use today date.
	c.add(Calendar.DATE, 0);
	String todaysDate = df.format(c.getTime());
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
			    <div class="alert alert-warning">Weather Forecast</div>
				<form class="form-horizontal" role="form" action="<%=resPath%>/secure/action" method="post">
				<input type="hidden" value="<%=Constants.ACCU_WEATHER%>" name="action"/>

					<div class="form-group">
						<div class="col-sm-10">
							<input type="text" class="form-control" id="todaysDate"
								placeholder="Todays Date" name="todaysDate" title="Todays Date"
								value="<%=todaysDate%>" />
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-10">
							<input type="text" class="form-control" id="destinationAirportICAO"
								placeholder="Destination AirportICAO" name="destinationAirportICAO" value="VIDP" title="Destination AirportICAO" />
						</div>
					</div>
						
						
					<div class="form-group">
						<div class="col-sm-offset-0 col-sm-10">
						  <button type="submit" class="btn btn-danger">Execute Service</button>
						</div>
				    </div>	


				</form>
				
				
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