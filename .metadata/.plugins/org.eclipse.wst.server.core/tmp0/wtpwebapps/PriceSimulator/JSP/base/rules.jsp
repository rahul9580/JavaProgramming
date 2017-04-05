<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Snapdeal Price Simulator</title>

	<%-- <script type="text/javascript" src="/PriceSimulator/JS/utility/jquery-1.12.0.min.js"></script> --%>
	<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/base/structure.css" media="screen" /> 
	<link type="text/css" rel="stylesheet"
	href="/PriceSimulator/CSS/utility/buttons.css" media="screen" />
<link type="text/css" rel="stylesheet"
	href="/PriceSimulator/CSS/utility/loader.css" media="screen" />

<link type="text/css" rel="stylesheet"
	href="/PriceSimulator/CSS/utility/bootstrap.min.css" media="screen" />
<link type="text/css" rel="stylesheet"
	href="/PriceSimulator/CSS/utility/bootstrap-datetimepicker.min.css"
	media="screen" />
<script type="text/javascript"
	src="/PriceSimulator/JS/utility/jquery-1.12.0.min.js"></script>
<%-- <script type="text/javascript"
	src="/PriceSimulator/JS/content/rules/category.js"></script> --%>
<script type="text/javascript"
	src="/PriceSimulator/JS/utility/loader.js"></script>

<script type="text/javascript"
	src="/PriceSimulator/JS/utility/bootstrap.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.5.1/moment.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.4.0/lang/en-gb.js"></script>
<script type="text/javascript"
	src="/PriceSimulator/JS/utility/bootstrap-datetimepicker.min.js"></script>
</head>
<body>
	<div class="header"><%@include file="../content/menubar.jsp"%></div>
	<div class="filter"><%@include file="../content/categoryfilter.jsp"%></div>
	<div class="content">
		<s:if test="%{#session.selcategory==null}"><span class="error">Please Select a Sub Category from Category Filter</span></s:if>
		<s:else><%@include file="../content/rules/tabs.jsp"%></s:else>
	</div>
	
	</body>
</html>