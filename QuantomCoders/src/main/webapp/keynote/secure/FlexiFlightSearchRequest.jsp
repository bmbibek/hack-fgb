<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.emirates.mobile.wadl.ws.MobilAppRestServiceMeta,com.emirates.mobile.WebServiceMetaDataUtil,
	java.util.*,java.text.*,com.emirates.mobile.wadl.bean.*,com.emirates.mobile.util.Constants" session="false"%>
									
<%
    String resPath = request.getContextPath();
    MobilAppRestServiceMeta restServiceMeta = null;
    List<RestServices> serviceList = null;
    String sessionId = null;    
    String action = request.getParameter("action");
    boolean isSkyLogged = false;
    HttpSession httpSession = request.getSession(false);
    Map<String,String> authMap = Collections.emptyMap();
   	//SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat df=new SimpleDateFormat("dd-MM-yyyy");
    String futureDepDate= null;
    String futureRetDate=null;
    
    
    Calendar c = Calendar.getInstance();
    c.setTime(new Date());
    c.add(Calendar.DATE, 10);  // number of days to add
    futureDepDate = df.format(c.getTime()); 
    c.add(Calendar.DATE, 20);
    futureRetDate=df.format(c.getTime());
    
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
			    <div class="alert alert-warning">Emirates : Flexi Flight Search</div>
				<form class="form-horizontal" role="form" action="<%=resPath%>/secure/action" method="post">
				<input type="hidden" value="<%=Constants.FLEXI_FLIGHT_SEARCH%>" name="action"/>

		<div class="form-group">			
		<div class="col-sm-offset-0 col-sm-10">			
		<div class="btn-group" data-toggle="buttons">
		  <label class="btn btn-sm btn-default">
		    <input type="radio" name="searchOrigin" id="return" value="RE" /> Return
		  </label>
		  <label class="btn btn-sm btn-default active">
		    <input type="radio" name="searchOrigin" id="oneWay" checked value="ON"> One Way
		  </label>
		 </div>
		</div>
					
	</div>
					<div class="form-group">
						
						<div class="col-sm-10 col-md-2">From</div>
						<div class="col-sm-10 col-md-2">
							<input type="text" class="form-control" id="origin"
								placeholder="From" name="origin"
								value="DXB">
						</div>
						<div class="col-sm-10 col-md-1">Depart</div>
						<div class="col-sm-10 col-md-3">
							<input type="text" class="form-control" id="depDate"
								placeholder="<%=futureDepDate%>" name="depDate" value="<%=futureDepDate%>">
						</div>
						
						<div class="col-sm-10 col-md-1">Class</div>
						<div class="col-sm-10 col-md-2">
							<select class="form-control" id="depCabin"
								 name="depCabin">
							<option value="Y">Economic</option> 
							<option value="J">Business</option>
							<option value="F">First</option>  
								</select>
						</div>
					</div>

					<div class="form-group">
						
						<div class="col-sm-10 col-md-2">To
						</div>
						<div class="col-sm-10 col-md-2">
							<input type="text" class="form-control" id="destination"
								placeholder="To" name="destination"
								value="LHR">
						</div>
						<div class="col-sm-10 col-md-1">Return
						</div>
						<div class="col-sm-10 col-md-3">
							<input type="text" class="form-control" id="arriveDate"
								placeholder="<%=futureRetDate %>" name="arriveDate" value="<%=futureRetDate %>">
						</div>
						
						<div class="col-sm-10 col-md-1">Class
						</div>
						<div class="col-sm-10 col-md-2">
							<select class="form-control" id="arriveCabin"
								 name="arriveCabin">
							<option value="Y">Economic</option> 
							<option value="J">Business</option>
							<option value="F">First</option>  
								</select>
						</div>
					</div>
					
					
					<div class="form-group">
					<div class="col-sm-10 col-md-2">Adults
						</div>
						<div class="col-sm-10 col-md-2">
							<select   class="form-control" id="noOfAdults"
								 name="noOfAdults">
									<option>1</option>	
							<option>2</option>
							<option>3</option>
							</select>	
						</div>
					<div class="col-sm-10 col-md-2">Children
						</div>
						<div class="col-sm-10 col-md-2">
							<select   class="form-control" id="noOfChild"
								 name="noOfChild">
							<option>0</option>	
							<option>1</option>	
							<option>2</option>
							<option>3</option>
							</select>	
						</div>
						<div class="col-sm-10 col-md-1">Infants
						</div>
						<div class="col-sm-10 col-md-2">
							<select   class="form-control" id="noOfInfants"
								 name="noOfInfants">
							<option>0</option>	
							<option>1</option>	
							<option>2</option>
							<option>3</option>
							</select>	
						</div>
					</div>
					<div class="form-group">
					<div class="col-sm-10 col-md-2">Flexi Date Plus
						</div>
						<div class="col-sm-10 col-md-2">
							<select   class="form-control" id="flexDaysPlusCount"
								 name="flexDaysPlusCount">
							<option>1</option>	
							<option>2</option>	
							<option>3</option>
							</select>	
						</div>
						<div class="col-sm-10 col-md-2">Flexi Date Minus
						</div>
						<div class="col-sm-10 col-md-2">
							<select   class="form-control" id="flexDaysMinusCount"
								 name="flexDaysMinusCount">
							<option>1</option>	
							<option>2</option>	
							<option>3</option>
							</select>	
						</div>
						<div class="col-sm-10 col-md-1">Search Type</div>
						<div class="col-sm-10 col-md-2">
							<input type="text" class="form-control" id="searchType"
								placeholder="Search Type" name="searchType"
								value="Revenue">
						</div>
					</div>
						<div class="form-group">
					<div class="col-sm-10 col-md-2">Interline
						</div>
						<div class="col-sm-10 col-md-2">
							<input type="text" class="form-control" id="interline"
								placeholder="Interline" name="interline"
								value="">
						</div>
					</div>
				<!--div class="form-group">
				<div class="col-sm-10 col-md-2">Search By
						</div>
					<div class="btn-group" data-toggle="buttons">
		  <  
		  <label class="btn btn-sm btn-default">
		    <input type="radio" name="scheduleType" id="option1" value="FlexibleData"> Flexible Date
		  </label>
		  
		  <label class="btn btn-sm btn-default active">
		    <input type="radio" name="scheduleType" id="option2" checked  value="0"> Price
		  </label>
		  <label class="btn btn-sm btn-default">
		    <input type="radio" name="scheduleType" id="option3" value="1"> Schedule
		  </label>
		</div>
		
					</div>		
					-->	
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