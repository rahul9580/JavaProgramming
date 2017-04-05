<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
			.ontop {
				z-index: 999;
				width: 305px;
				height: 205px;
				top: 50%;
				left: 50%;
				display: none;
				position: absolute;				
				background-color: gray;
				color: white;
				opacity: .8;
				filter: alpha(opacity = 80);
			}
			#popup {
				width: 300px;
				height: 200px;
				position: absolute;
				color: #000000;
				background-color: white;
				/* To align popup window at the center of screen*/
				top: 50%;
				left: 50%;
				margin-top: -100px;
				margin-left: -150px;
			}
		</style> 
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Snapdeal Price Simulator</title>
	<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/base/structure.css" media="screen" />
</head>
<body>
	<div class="header"><%@include file="../../content/menubar.jsp"%></div>
	<div class="content">
		<s:if test="%{#session.selcategory==null}"><span class="error">Please Select a Sub Category from Category Filter</span></s:if>
		<s:else><%@include file="../../content/exceptions/clusters.jsp"%></s:else>
	</div>
	<div class="filter"><%@include file="../../content/categoryfilter.jsp"%></div>
</body>
</html>