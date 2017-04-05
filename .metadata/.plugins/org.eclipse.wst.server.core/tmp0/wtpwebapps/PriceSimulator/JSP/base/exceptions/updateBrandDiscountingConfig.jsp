<%@page import="java.util.List"%>
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
<title>Snapdeal Price Simulator</title>
</head>

<div class="header"><%@include file="../../content/menubar.jsp"%></div>
<div class="filter"><%@include
		file="../../content/categoryfilter.jsp"%></div>
<body>
	<div class="content">
		<br> <br>
		<form action="uploadBrandDiscountingConfig.action"
			enctype="multipart/form-data" method="POST">

			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="file" name="file" class="btn btn-primary browse"
				style="display: inline; width: 250px" accept=".csv" /> <input
				type="submit" style="display: inline"
				class="brandDiscountingBtn btn btn-primary" value="Upload" /> <a
				class="btn btn-primary"
				href="/PriceSimulator/Temp/brandDiscountingTemp.csv"> Download
				Template </a>



		</form>
		<br> <br>
		<form action="downloadBrandDiscountingConfig.action"
			id="downloadBrandDiscountingForm" name="downloadBrandDiscountingForm"
			style="display: block" class="form" enctype="multipart/form-data"
			method="POST">


			<input type="submit" style="margin-left: 25%;"
				value="Download Current List"
				class="brandDiscountingBtn btn btn-primary">
		</form>



		<div class="report">
			<div class="bar">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<pre>
				<s:property value="%{#session.brandDiscountStatus}" />
				</pre>
			</div>
		</div>
	</div>

	<%
		session.setAttribute("brandDiscountStatus", "");
	%>

</body>
</html>

