<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.emirates.mobile.wadl.ws.MobilAppRestServiceMeta,com.emirates.mobile.WebServiceMetaDataUtil,
	java.util.*,com.emirates.mobile.wadl.bean.*" session="false"%>
<%
    String resPath = request.getContextPath();


    String sessionId = null; 
    String rootUrl = "";
 
    boolean isSkyLogged = false;
    HttpSession httpSession = request.getSession(false);
    Map<String,String> authMap = Collections.emptyMap(); 
    if (httpSession != null) {
		sessionId = httpSession.getId(); 
		isSkyLogged = Boolean.parseBoolean((String) httpSession	.getAttribute("isSkyLogin"));
		authMap =(Map<String,String>)httpSession.getAttribute("authMap");
		rootUrl = (String)httpSession.getAttribute("rootUrl");
     }    
%>


<div class="footer">
			<p>iPad App Keynote v1.2.0 &copy; 2014</p>
		</div>	
		<div class="alert alert-info">
			Debug Info
			<ul class="list-group">
				<li class="list-group-item" style="word-wrap: break-word">KeyNote Session : <%=sessionId%></li>
				<li class="list-group-item" style="word-wrap: break-word">iPAD Session : <%=authMap.get("sessionId")%></li>
				<li class="list-group-item" style="word-wrap: break-word">Cookie : <%=authMap.get("cookie")%></li>
				<li class="list-group-item" style="word-wrap: break-word">URL  : <%=rootUrl%></li>
			</ul>
		</div>
	</div>