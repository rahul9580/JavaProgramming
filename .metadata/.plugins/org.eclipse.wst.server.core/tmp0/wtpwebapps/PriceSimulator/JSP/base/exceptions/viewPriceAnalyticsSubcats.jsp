<%@page import="com.snapdeal.POJO.SellerRightList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Snapdeal Price Simulator</title>
<link type="text/css" rel="stylesheet"
	href="/PriceSimulator/CSS/base/structure.css" media="screen" />



<style>
#seller_multiselect, #multiselect, #multiselect_to,
	#seller_multiselect_to {
	width: 300px;
}
</style>
<div class="header"><%@include file="../../content/menubar.jsp"%></div>
<div class="filter"><%@include
		file="../../content/categoryfilter.jsp"%></div>
<%-- <script src="/../JS/content/fetchBrandList.js" type="text/javascript" charset="utf-8"></script> --%>

</head>


<body>

 	<div><h2><br></br><hr> </hr>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Active Sub-Categories on Price Analytics</h2></div>
	<div class="content" style="width: 70%;">

	<s:iterator value="activeSubcats">
		<li><s:property /></li>
	</s:iterator>
	</div>
	
	
	

	
	
	
</body>
</html>