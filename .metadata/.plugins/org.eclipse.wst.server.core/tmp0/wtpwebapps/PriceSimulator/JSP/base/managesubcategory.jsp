<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/base/structure.css" media="screen" />
<script type="text/javascript" src="/PriceSimulator/JS/utility/jquery-1.12.0.min.js"></script>
<title>Snapdeal Price Simulator</title>
</head>
<body>
<div class="header"><%@include file="/JSP/content/menubar.jsp"%></div>
	<div class="content">
		<s:if test="%{#session.selcategory==null}"><span class="error">Please Select a Sub Category from Category Filter</span></s:if>
		<s:else><%@include file="/JSP/content/managesubcategory.jsp"%></s:else>
	</div>
	<div class="filter"><%@include file="/JSP/content/categoryfilter.jsp"%></div>

</body>
</html>