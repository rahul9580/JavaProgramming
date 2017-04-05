
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link type="text/css" rel="stylesheet"
	href="/PriceSimulator/CSS/utility/bootstrap.min.css" media="screen" />
<link type="text/css" rel="stylesheet"
	href="/PriceSimulator/CSS/base/structure.css" media="screen" />
<title>Shipping Engine</title>
</head>
<body>
	<div class="header"><%@include file="/JSP/content/menubar.jsp"%></div>
	<div class="filter"><%@include
		file="../../content/categoryfilter.jsp"%></div>
	<div class="content"><%@include file="/JSP/ShippingEngineUi/content/main.jsp"%></div>

</body>
</html>