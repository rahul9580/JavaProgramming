<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/content/rules/tabs.css" media="screen" />
<script type="text/javascript" src="/PriceSimulator/JS/utility/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/content/rules/tabs.js"></script>
</head>
<body>
	<div class="pad_top_10">
		<form class="form-inline">
			<div class="pricing" style="margin-bottom: 0px;">

				<input id='mv' type='hidden' value='${session.current}' />
				<!-- style="margin-left: 50px" -->
				<select id="options" class="form-control" name="options" style="width: 15%;" onChange="change()">
					<option rel="select" value="select">---Select---</option>
					<option rel="Subcat" value="Subcat">Subcategory</option>
					<option rel="Brand" value="Brand">Brand</option>
					<option rel="cluster" value="cluster">Cluster</option>
					<option rel="Exception" value="Exception">Exception</option>
<%-- 					<s:if test="%{#session.adminPrivilege == 'admin'}">
						<option rel="Scheduled CB" value="Scheduled CB">Scheduled CB</option>
					</s:if> --%>
				</select>
				<table class="heading">
					<tr>
						<td><h6 style="color: red;">
								<b>*Please select option to create rule</b>
							</h6></td>
					</tr>
				</table>
				<div id="Brand" style="display: none"><%@include file="brandtab.jsp"%></div>
				<div id="Subcat" style="display: none"><%@include file="categorytab.jsp"%></div>
				<div id="Exception" style="display: none"><%@include file="producttab.jsp"%></div>
				<%-- <s:if test="%{#session.adminPrivilege == 'admin'}">
					<div id="Scheduled CB" style="display: none"><%@include file="../../content/rules/bulkupload.jsp"%></div>
				</s:if> --%>
				<div id="cluster" style="display: none"><%@include file="../../base/exceptions/createclusters.jsp"%></div>

			</div>
</body>
</html>