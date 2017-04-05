<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 	<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/bootstrap-combined.min.css" media="screen" /> -->
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/bootstrap.min.css" media="screen" />
	<!-- <link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/bootstrap-datetimepicker.min.css" media="screen" /> -->
	<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/content/rules/producttab.css" media="screen" />
	<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/buttons.css" media="screen" />
	<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/loader.css" media="screen" />
	<script type="text/javascript" src="/PriceSimulator/JS/utility/jquery-1.12.0.min.js"></script>
	<script type="text/javascript" src="/PriceSimulator/JS/utility/bootstrap.min.js"></script>
	<%-- <script type="text/javascript" src="/PriceSimulator/JS/utility/bootstrap-datetimepicker.min.js"></script> --%>
	<%-- <script type="text/javascript" src="/PriceSimulator/JS/bootstrap-datetimepicker.pt-BR.js"></script>  --%>
	<script type="text/javascript" src="/PriceSimulator/JS/content/rules/product.js"></script>
	<script type="text/javascript" src="/PriceSimulator/JS/utility/loader.js"></script>
 	
	
</head>
<body>

		
		<div class="expupleftpanel well well-md" style="margin-top:2%">
		<!-- <div class="head"><h4>Products in Exception</h4></div> -->
		<div class="content" style="display:inline;float:left;width:40%">
			<form method="post" action="/PriceSimulator/ajax/addproduct.action" enctype="multipart/form-data" class="form-inline">
				<label>SUPCs :</label><input type="text" name="supclist" class="manualinput form-control" class="form-control" required/>
				<input type="submit" class="btn btn-primary addsupc form-control" value="Add" style="margin-left:2%;margin-right:2%"/>
						<span class="message">*Please use semicolon(;) to separate multiple SUPC's</span>
			</form>
		</div>
		<div class="txt" style="display:inline;float:left;font-size:20px;width:10%">  OR</div>
		<form class="form-inline" role="form" method="post" action="/PriceSimulator/ajax/saveproducttemp.action" enctype="multipart/form-data">
			<input type="file" name="file" class="btn btn-default btn-file browse form-control" accept=".xlsx" style="width:25%">
			<input type="submit" class="btn btn-primary form-control savetemp" value="Upload"/>
			<a href="/PriceSimulator/Temp/product.xlsx" style="color:#0645AD">Download Template</a>
		</form>

		<div class="report"><div class="bar"></div></div>
	</div>
 <br><br>
	<div style="margin-left: 40%;" id="message">
		<font color='green'></font>
	</div>
</body>
</html>