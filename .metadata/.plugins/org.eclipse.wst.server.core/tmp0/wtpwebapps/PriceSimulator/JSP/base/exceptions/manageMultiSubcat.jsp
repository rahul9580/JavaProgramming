<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Snapdeal Price Simulator</title>
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/bootstrap.min.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/base/structure.css" media="screen" />
<link type="text/js" rel="stylesheet" href="/PriceSimulator/JS/utility/bootstrap.min.js" media="screen" />
<script src="/PriceSimulator/JS/jquery.js" type="text/javascript" charset="utf-8"></script> 
<script src="/PriceSimulator/JS/angular.js" type="text/javascript" charset="utf-8"></script> 
<script src="/PriceSimulator/JS/route.js" type="text/javascript" charset="utf-8"></script> 
<script src="/PriceSimulator/JS/content/managesubcat.js" type="text/javascript" charset="utf-8"></script> 
<%@include file="../../utility/multipleSubcatTags.jsp" %>
</head>

<body>
		<br>

	<div class="header"><%@include file="/JSP/content/menubar.jsp"%></div>
	<div class="content" ng-app="subcatConfApp">
		<input type="hidden" id="subcatName">

	<input type="hidden" id="txtSubcatName"
		value="<s:property value="%{#session.subcatNameArray}" />" />
	<form>
		<input name="tags" id="singleFieldTags2">
	</form>
	
		<form >
	<div class="automationSOIData" ng-controller="fetchAutomationSOIDataCtrl">
		<table class="automationSOIData table" style="position: relative;left: 100px;">
			<tr   ng-repeat='(key, val) in automationSOIData'>
			<td style="width:150px;">
				<label class="key">{{key}}</label>
			</td>
      
			<td>
				<input style="width:200px;" type="text" name= "{{key}}" id="{{key}}" type="number" style="width:50%;display:inline" onkeypress="validateInput(event)"
								class="decimal form-control value" value="{{val}}" />
			</td>
			</tr>
		</table>
	</div>
	<div class="configurationData" ng-controller="fetchSubcatConfigurationDataCtrl">
		<table class="configurationData table" style="position: relative;left: 100px;" >
			<tr   ng-repeat='(key, val) in subcatConfigurationData' >
			<td style="width:150px;">
				<label class="key">{{key}}</label>
			</td>
			<td ng-if="key == 'OP Decision Rule (Can\'t beat competition)'">
				<select required class="mappedCBOption">
					<option value="" ng-selected="val==''"> Select option </option>
					<option value='1' ng-selected="val=='1'">SP</option>
					<option value='2' ng-selected="val=='2'">Max of CM, GM, MOP</option>
					<option value='3' ng-selected="val=='3'">Max of CM=0, GM=0, MOP</option>
				</select>
			</td>
			<td ng-if="key != 'OP Decision Rule (Can\'t beat competition)'">
			<input style="width:200px;" type="text" name= "{{key}}" id="{{key}}" type="number" style="width:50%;display:inline" onkeypress="validateInput(event)"
								class="decimal form-control value" value="{{val}}" />
			</td>
			</tr>
		</table>
		</div>


		<div style="position: relative;left: 100px;">
			<div class="automationSOIData"></div>
			<div ng-init="id='1';">
			<div ng-controller="updateDataCtrl">
				<button  ng-click="search()" class="btn btn-primary">Update</button>
			</div>
			</div>
		</div>
	</form>	
	
	</div>
	
	
	<div class="filter"><%@include file="/JSP/content/categoryfilter.jsp"%></div>
		
</body>
</html>