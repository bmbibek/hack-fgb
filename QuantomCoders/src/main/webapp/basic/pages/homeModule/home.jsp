<?xml version="1.0" encoding="utf-8" ?>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="/WEB-INF/taglib.tld" prefix="ibe"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../ip.jsp"%>
<%@page import="com.mercator.ibe.common.mobile.util.CommonConstants"%>
<html class="no-js">
<c:set var="pageIdentifier" value="hom_hom" />
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<%@ include file="../com_head_title.jsp" %>


<c:if test="${!model.hideIPhoneAppBanner}">
	<c:set var="IPhoneAppBannerInfo" value="${ibe:getMessage('IPhoneAppBannerInfo','config.home.i18n.home','',pageContext)}" />
	<c:if test="${IPhoneAppBannerInfo != 'IPhoneAppBannerInfo' && IPhoneAppBannerInfo != ''}">
		<meta name="apple-itunes-app" content="${IPhoneAppBannerInfo}"/>
	</c:if>
</c:if>

<c:if test="${!model.hideAndroidAppBanner}">
	<c:set var="AndroidAppBannerInfo" value="${ibe:getMessage('AndroidAppBannerInfo','config.home.i18n.home','',pageContext)}" />
	<c:if test="${AndroidAppBannerInfo != 'AndroidAppBannerInfo' && AndroidAppBannerInfo != ''}">
		<meta name="google-play-app" content="${AndroidAppBannerInfo}"/>
		<c:set var="AndroidAppBannerViewed" value="true" /> 
	</c:if>
</c:if>


<link rel="stylesheet" type="text/css"
	href="${contextPath}/css/smartbanner.css<ibe:VersionControl groupName='css'/>">
	
<link rel="stylesheet" type="text/css" href="${contextPath}/js/vendor/jquery.smartbanner.css<ibe:VersionControl groupName='css'/>" />

<%@ include file="../header.jsp"%>

</head>
<body >
	<c:set var="errorBuilder" value=""/>
	<c:set var="operationAlert" value=""/>
	<!-- Start Of Google Tag Manager -->
	<%@ include file="../ga_gtm.jsp" %>
	<%@ include file="../ga_gtm_container.jsp"%>
	
	
	<!-- End Google Tag Manager -->
	<form id="form1" action="">
		<div class="no-scroll-hack">
			<div class="wrapper">
				<%@ include file="../loading.jsp"%>
				<c:if test="${model.SKYWARD_LOGGED_IN == true}">
					<%@ include file="../navigation.jsp"%>
				</c:if>
				<div class="nav-overlay"></div>

				<div class="musthead " role="banner">
					
					<c:if test="${model.SKYWARD_LOGGED_IN != true}">
							<a id="${pageIdentifier}_logo" href="/">
								<div class="brand-logo ir">
									<ibe:I18N baseName="config.home.i18n.home" key="label.logo.title" />
								</div>
							</a>
					</c:if>
					<c:choose>
					<c:when test="${not empty model.incidentText}">
					<div class="dark-site cf">
		                        <div class="dark-content">
		                           ${model.incidentText}
		                           <c:if test="${model.isIncidentWithButton}">
		                           <a href="${model.incidentWebLink}" id="${pageIdentifier}_dark_site_readMore" title="Read More"><ibe:I18N baseName="config.home.i18n.home" key="label.header.read.more" /></a>
		                           </c:if>
		                        </div>
		             </div>
					</c:when>
					<c:otherwise>
					<img src="${contextPath}/img/header.jpg" alt="Emirates.com"/>
					</c:otherwise>
					</c:choose>
					<div class="alert-bar">
						<%-- <c:if test="${(model.incidentLevel != null && (model.incidentLevel == '1' || model.incidentLevel == '3' || model.incidentLevel == '4')) && model.incidentText != null}">
							<c:if test="${fn:length(model.incidentText) gt 0}">
								<div class="alert-message cf">
									<i class="el icon-alert"></i>
									<p>
										<a id="${pageIdentifier}_opUpdtI" onclick="location.href='<ibe:I18NURL baseName="config.home.i18n.url" key="flight.incident" />'">${model.incidentText}</a>
										<c:set var="operationAlert" value="${model.incidentText}"/>
									</p>
									<i class="el alert-close icon-ex"
										data-action="close.alert-message"></i>
								</div>
							</c:if>
						</c:if> --%>
						<c:if test="${model.title != null}">
						<c:set var="operationAlert" value="${model.title}"/>
							<c:if test="${model.category !=null && model.category == 'Urgent'}">
								<div class="alert-message cf">
									<i class="el icon-alert"></i>
									<p>
										<a id="${pageIdentifier}_opUpdtU" href="<ibe:getSiteURL mappingName="OPERATION_UPDATE" />" >
											${model.title}</a>
											
									</p>
									<i class="el alert-close icon-ex"
										data-action="close.alert-message"></i>
								</div>


							</c:if>

							<c:if
								test="${model.category !=null && model.category == 'Announcement'}">
								<div class="alert-message cf">
									<i class="el icon-alert"></i>
									<p>
										<a id="${pageIdentifier}_opUpdtA"  href="<ibe:getSiteURL mappingName="OPERATION_UPDATE" />">${model.title}</a>
									</p>
									<i class="el alert-close icon-ex"
										data-action="close.alert-message"></i>
								</div>
							</c:if>

							<c:if test="${model.category ==null || model.category == ''}">
								<div class="alert-message cf">
									<i class="el icon-alert"></i>
									<p>
										<a id="${pageIdentifier}_opUpdtD"  href="<ibe:getSiteURL mappingName="OPERATION_UPDATE" />">${model.title}</a>
									</p>
									<i class="el alert-close icon-ex"
										data-action="close.alert-message"></i>
								</div>
							</c:if>
						</c:if>
					</div>
					
					<c:if test="${model.SKYWARD_LOGGED_IN == true}">
					<div id="loginMessage" class="user-bar welcome-bar">
						<div class="container cf">
							<div class="user-info">
								<ibe:I18N baseName="config.home.i18n.home" key="message.welcome" />
								<strong id="skywardsname"> ${model.SKYWARD_DETAILS.FirstName} ${model.SKYWARD_DETAILS.LastName}</strong>
								<ibe:I18N baseName="config.home.i18n.home"
									key="message.you.have" />
								<span id="miles"><ibe:NumberFormatter noOfDecimals="0" currency="${model.SKYWARD_DETAILS.Miles}"/></span>
								<span style="display: block"><ibe:I18N
										baseName="config.home.i18n.home" key="message.miles" /></span>
							</div>

							<div class="account-info">
								<a id="${pageIdentifier}_myAcDet" href="<ibe:getSiteURL mappingName="MY_ACCOUNT_DETAILS" />" title="My Account" ><ibe:I18N
										baseName="config.home.i18n.home" key="label.account.title" /></a>
							</div>
						</div>
					</div>
					</c:if>
				</div>

				<div class="main" role="main">
					<c:if test="${model.SKYWARD_LOGGED_IN != true}">
					<div id="notloginMessage" style="display: block;"
						class="welcome-bar">
						<div class="container cf">
							<div class="welcome-bar-msg">
								<p>
									<ibe:I18N baseName="config.home.i18n.home" key="label.title" />
								</p>
							</div>
							<div class="welcome-bar-btn">								
								<p>
									<span id="${pageIdentifier}_logLink" onclick="goToLoginURL(CONFIG.get('LOGIN'),'HOME')">
										<ibe:I18N baseName="config.home.i18n.home" key="label.login" />
									</span>
								</p>								
							</div>
						</div>
					</div>
					</c:if>

					<div class="btn-group">
						<div class="btn-row cf">
							<div id="${pageIdentifier}_bookFlt" title="Book A Flight" class="custom-font link-alt cf" 
								onclick="goToURL(CONFIG.get('BOOK_A_FLIGHT'));"><i
								class="el icon-flight"></i> <span><ibe:I18N
										baseName="config.home.i18n.home" key="label.makebooking.link" /></span>
							</div> 
							<div id="${pageIdentifier}_fltStus" title="Flight Status"
								onclick="goToURL(CONFIG.get('FLIGHT_SEARCH'));"
								class="custom-font link-alt cf"
								data-analyticskey="homeFlightStatusClick"
								data-analyticsvalue="dataLayer.pageTitle:/MobileFlightStatus:FlightStatus"
								><i class="el icon-stats"></i>
								<span><ibe:I18N baseName="config.home.i18n.home"
										key="label.flightstatus.link" /></span> </div>
						</div>
						<div class="btn-row cf">
							<div id="${pageIdentifier}_olci" title="Flight Check-In" 
								onclick="goToOLCILoginUrl(CONFIG.get('ONLINE_CHECKIN'));"
								class="custom-font link-alt cf">
								<i class="el icon-case"></i> 
								<span><ibe:I18N	baseName="config.home.i18n.home" key="label.checkin.link" /></span>
							</div> 
							<div id="${pageIdentifier}_mngBk" title="Manage Booking"
								onclick="goToMYBLoginUrl(CONFIG.get('MYB_LOGIN'));"
							 	class="custom-font link-alt cf">
							 	<i class="el icon-doc"></i><span><ibe:I18N	baseName="config.home.i18n.home"
										key="label.managebooking.link" /></span> 
							</div>
						</div>
						
						<!--commenting the  following options as they are not part of phase 1 -->
						<!-- <div class="btn-row cf">
							<a id="${pageIdentifier}_splOfr" href="#" title="Special Offers" class="custom-font link-alt cf"><i
								class="el icon-tag"></i> <span><ibe:I18N
										baseName="config.home.i18n.home"
										key="label.specialoffers.link" /></span> </a> 
										<a id="${pageIdentifier}_dscvrDubai" href="#"
											title="Discover Dubai"
											class="custom-font link-alt cf"><i class="el icon-city"></i>
								<span><ibe:I18N baseName="config.home.i18n.home"
										key="label.discoverdubai.link" /></span> </a>
						</div> -->
					</div>

					<div class="more-options accordion-container">
						<div class="container">
							<span id="${pageIdentifier}_morOptn" data-accordion="expandable-menu" 
								data-open-scroll="end" class="btn-more link-alt fs-30"><i></i>
							<ibe:I18N baseName="config.home.i18n.home"
									key="label.moreoptions.link" /></span>
						</div>
						<div class="expandable-menu">
							
							<!--<c:if test="${model.SKYWARD_LOGGED_IN != true}">
							<span id="${pageIdentifier}_jnSkywds" class="arrow-btn link-alt">
								<ibe:I18N baseName="config.home.i18n.home"
									key="label.joinskywards.link" />
							</span> 
							
							</c:if>-->
							
							<!-- <span id="${pageIdentifier}_emExp" class="arrow-btn link-alt"> <ibe:I18N
									baseName="config.home.i18n.home" key="label.experience.link" />
							</span>  -->
							<span id="${pageIdentifier}_timTble" class="arrow-btn link-alt" onclick="goToURL(CONFIG.get('TIME_TABLE'));"
								title="See Timetables">
								<ibe:I18N baseName="config.home.i18n.home"
									key="label.timetable.link" />
							</span>
							
							<%-- Show car hire link only if it is present from DB --%>
							<c:if test="${not empty model.carHireURL}">
								<span id="${pageIdentifier}_carHire" class="arrow-btn link-alt" onclick="openNewWindow('${model.carHireURL}');" title="Car Hire">
									<ibe:I18N baseName="config.home.i18n.home" key="label.carHire.link" />
								</span>
							</c:if>
							
							<!-- data-modal = URL TO REQUEST MODAL FROM -->
							<span id="${pageIdentifier}_selLang" class="arrow-btn link-alt" onclick="setWindowLocation(CONFIG.get('FROM_LANGUAGE_SELECTION'))"
							data-analyticskey="homeMoreSelectLanguage"
							data-analyticsvalue="dataLayer.pageTitle:/:FlightStatus"
								title="Select Language"> <ibe:I18N
									baseName="config.home.i18n.home"
									key="label.languageselect.link" />
							</span> 
							<span id="${pageIdentifier}_abtEm" class="arrow-btn link-alt" onclick="goToAboutEmirates()">
								<ibe:I18N baseName="config.home.i18n.home"
									key="label.aboutemirates.link" />
							</span> 
							<span id="${pageIdentifier}_cntUs" class="arrow-btn link-alt" onclick="goToURL(CONFIG.get('LOCAL_EMIRATES_OFFICE'))"> <ibe:I18N
									baseName="config.home.i18n.home" key="label.contactus.link" />
							</span>
							<!-- <span id="${pageIdentifier}_hlpFaq" class="arrow-btn link-alt"> <ibe:I18N
									baseName="config.home.i18n.home" key="label.helpfaq.link" /> -->
							</span> 
							
							<span id="${pageIdentifier}_trmsCndtn" class="arrow-btn link-alt" onclick="goToTermsCondition()"> <ibe:I18N
									baseName="config.home.i18n.home"
									key="label.termsconditions.link" />
							</span> 
							<span id="${pageIdentifier}_pvcyPol" class="arrow-btn link-alt" onclick="goToPrivacyPolicy('PrivacyPolicyFromHome')">
								<ibe:I18N baseName="config.home.i18n.home"
									key="label.privacypolicy.link" />
							</span>
							<span id="${pageIdentifier}_fullSite" class="arrow-btn link-alt" onClick="gotoMainSite('',false);">
								 <ibe:I18N
									baseName="config.home.i18n.home" key="label.viewhtml.link" />
							</span> 
						</div>
					</div>

				</div>
				<!-- END .main -->
				<%@ include file="../footer.jsp" %>
			</div>
			<!-- #wrapper -->
		</div>
		<!-- /.no-scroll-hack -->
	</form>
	
	
</body>
<%@ include	file="../jsInclusion.jsp"%>
<c:choose>
	<c:when test="${minifyFlag==true}">
		<script src="${contextPath}/js/min/home.js<ibe:VersionControl groupName='js.home'/>"></script>
	</c:when>
	<c:otherwise>
		<script src="${contextPath}/js/home.js<ibe:VersionControl groupName='js.home'/>"></script>
	</c:otherwise>
</c:choose>
<script>
    $(document).ready(function() {
        setTimeout(function() {
            if($('.wrapper ').height() - 15 <= window.innerHeight && $('.wrapper ').height() >= window.innerHeight) {
                $('.main').css('margin-bottom', '40px');
            }
        }, 25);
    });
</script>
<%@ include	file="../jsInclusionBottom.jsp"%>
<script>
	addEventListener("load", onPageLoad, false);
	window.addEventListener("orientationchange", hideURLbar);
	var tierStatus= '${model.SKYWARD_DETAILS.TierStatus}';
	var langgCode = '${langCode}';

	var countryLang = '${model.countryCodeLanguage}';
	
	function onPageLoad() { 
		
		if (langgCode!=''&& langgCode!=null && langgCode!=undefined){
				var oprtnUpdate = "${operationAlert}";
				
				// Changes for lang specific font sizes etc
				
				/*if(langgCode == "ru")
				{
					$(".btn-row .cf span").addClass("fs-32");
				}
				
				if(navigator.userAgent.match(/iPhone/i) != null)
				{
					// for iphone, russian and french should be 24,
					if(langgCode == "ru" || langgCode == "fr")
					{
						$(".btn-row .cf span").addClass("fs-24");
					}
					
				}*/
				
				
			}
		
		//var miles = '${model.SKYWARD_DETAILS.Miles}';
		
		//$("#miles").text(commaSeparateNumber(miles));
		
		setTimeout(hideURLbar, 0);
		
		setLocaleStorage(countryLang,langgCode);
		
		switch(tierStatus){
			case 'SKYWARDS' :	$(".musthead").addClass("blue-member");
								break;
								
			case 'SILVER' :		$(".musthead").addClass("silver-member");
								break;
								
			case 'GOLD' :		$(".musthead").addClass("gold-member");
								break;
								
			case 'PLATINUM' : 	$(".musthead").addClass("platinum-member");
								break;
								
			case 'IO' : 		$(".musthead").addClass("io-member");
								break;
								
			default: break;
		}
		
		if(oprtnUpdate!=undefined && oprtnUpdate!=''){
			var val=['EventTrigger','Homepage Interaction','Operational Alerts','operationalAlert'];
			analyticsPushMultipleEventValue(val);
		}
		
	}
	function hideURLbar(){
		// Conditions copied from hideAddressbar.js
		if(navigator.userAgent.toLowerCase().indexOf('blackberry')>0)
		{
			window.scrollTo(0,40);
		}
		if(navigator.userAgent.match(/Android/i)) 
		{
			window.scrollTo(0,1);		
		}		
	}
	
</script>
<%@ include file="../ga_gtm_def.jsp"%>
</html>