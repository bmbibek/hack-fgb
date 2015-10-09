<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.emirates.mobile.wadl.ws.MobilAppRestServiceMeta,com.emirates.mobile.WebServiceMetaDataUtil,
	java.util.*,com.emirates.mobile.wadl.bean.*,com.emirates.mobile.util.Constants,com.google.gson.*" session="false"%>
									
<%
    String resPath = request.getContextPath();
    MobilAppRestServiceMeta restServiceMeta = null;
    List<RestServices> serviceList = null;
    String sessionId = null;    
    boolean isSkyLogged = false;
    String msg = "";
    HttpSession httpSession = request.getSession(false);
    Map<String,String> authMap = Collections.emptyMap(); 
    if (httpSession != null) {
		sessionId = httpSession.getId(); 
		isSkyLogged = Boolean.parseBoolean((String) httpSession	.getAttribute("isSkyLogin"));
		authMap =(Map<String,String>)httpSession.getAttribute("authMap");
     }  
    Map<String,Object> webResponse = Collections.emptyMap();
    webResponse = (Map<String,Object>)request.getAttribute("webResponse");
    String httpStatusCode = (String)webResponse.get("status");
    Double executionTime = (Double)webResponse.get("time");
    
    if(!"200".equalsIgnoreCase(httpStatusCode)){
	  msg = "WebService Request for Retrieve PNR failed with status code "+httpStatusCode;
    }else{
	    JsonParser parser = new JsonParser();
	    JsonObject rootObj = parser.parse((String)webResponse.get("response")).getAsJsonObject();
	    
		if (!"success".equalsIgnoreCase(rootObj.get("status").getAsString())){        
		    msg = rootObj.get("error").toString();
		}
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
			    <div class="alert alert-warning">Emirates : Flight Status</div>
				 <div class="alert alert-info" id="httpStatusCode">HTTP Status Code : <%=httpStatusCode%></div>
			    <div class="alert alert-info" id="executionTime">Request Processing Time : <span><%=executionTime%></span></div>				
				
				<h2> Response </h2>
					  <% if (!msg.isEmpty()){ %>
				  <div class="alert alert-danger" id="serviceFailure"><%=msg%></div>
				  <% } %>
				
				<%
				  out.print(webResponse.get("response"));
				%>				
				
			</div>
			
		<jsp:include page="QuickLinks.jsp"></jsp:include>	
		</div>
		<hr>
	<jsp:include page="footer.jsp"></jsp:include>	</div>
	
	
	<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script src="<%=resPath%>/js/bootstrap.js"></script>
	
</body>
</html>