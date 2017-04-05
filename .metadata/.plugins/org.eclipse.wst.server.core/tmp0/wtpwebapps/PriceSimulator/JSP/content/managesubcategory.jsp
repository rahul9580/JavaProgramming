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
</head>
<body ng-app="subcatConfApp">
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<form>
	 <label  style="position: relative;left: 100px;"><font size="3">Available Seller</font></label> <br>
	 <!-- <select style="position: relative;left: 100px;" class="SellerType  dropdown-toggle"  onchange="change()"> -->
	 <select style="position: relative;left: 100px;" class="SellerType  dropdown-toggle" >
  		<option value="0">No Seller</option>
	    <!-- <option value="1">Selected Sellers</option> -->
	</select>	
	<br>
	<br>
	<br>
	<!-- <table style="position: relative;left: 100px;display: none;">

		<td ng-controller="fetchSellerListCtrl">
			<label> <font size="5">Available Seller</font> </label>
			<br>
			<select id="SellerLeftList" style="width:300px;height:200px;" ng-model="selectedName"  multiple>
				<option ng-class="{true: 'hidden', false: 'notHidden'}[sellerType == '0']" ng-repeat='(key, val) in sellerList'  value="{{key}}">{{val}}</option>
			</select>
		</td>
							<td><br>
					<br>
						<table class="table">
							<tbody>
								<tr>
									<td><input type="button" onclick="move(1,0)"
										class="btn btn-primary" value="&gt;" style="width: 35px" /></td>
								</tr>
								<tr>
									<td><input type="button" onclick="move(1,1)"
										class="btn btn-primary" value="&gt;&gt;" style="width: 35px" /></td>
								</tr>
								<tr>
									<td><input type="button" onclick="move(0,0)"
										class="btn btn-primary" value="&lt;" style="width: 35px" /></td>
								</tr>
								<tr>
									<td><input type="button" onclick="move(0,1)"
										class="btn btn-primary" value="&lt;&lt;" style="width: 35px" /></td>
								</tr>
							</tbody>
						</table></td>
		<td ng-controller="fetchSelectedSellerCtrl">
			<label> <font size="5">Selected Seller</font> </label>
			<br>
			<select id="SellerRightList" style="width:300px;height:200px;" ng-model="selectedName"  multiple>
				<option ng-repeat='(key, val) in selectedSellerList' value="{{key}}">{{val}}</option>
			</select>
		</td>
	</table> -->
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
			<div ng-controller="updateDataCtrl">
				<button  ng-click="search()" class="btn btn-primary">Update</button>
			</div>
		</div>
	</form>	
</body>
</html>