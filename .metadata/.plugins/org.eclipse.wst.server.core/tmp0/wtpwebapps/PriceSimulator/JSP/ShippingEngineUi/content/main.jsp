<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="/PriceSimulator/JS/utility/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/ShippingEngineUI/main.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Shipping Engine</title>
<script type="text/javascript">
	function remove () {
		$(".ruleList").addClass ("hidden") ;
		$(".fileLink").addClass ("hidden") ;
		
	}
</script>
</head>
<body>

	<h4 class = "mainHeader" align="center">Shipping Engine Rules</h4>
		
		<select id="options" style="position: relative;left: 100px;" onChange="change()">
			<option value = "select" >Select</option>
			<option value = "exception" >Seller-Supc</option>
			<option value = "vendorBrandSubcat">Vendor-Brand-Subcat</option> 
			<option value = "SubcatBrand">Subcat-Brand-Price (OP)</option>
			<option value = "PreCB">PreCB Margin</option>
			<option value = "Subcat" >Subcat Level (OP)</option>
		</select>
		<div id="rules" >
			<div id="exception" style="display: none" ><%@include file="/JSP/ShippingEngineUi/content/exception.jsp"%></div>
			<div id="vendorBrandSubcat" style="display: none"><%@include file="/JSP/ShippingEngineUi/content/vendorBrandSubcat.jsp"%></div>
			<div id="SubcatBrand" style="display: none"><%@include file="/JSP/ShippingEngineUi/content/SubcatBrand.jsp"%></div>
			<div id="PreCB" style="display: none"><%@include file="/JSP/ShippingEngineUi/content/PreCB.jsp"%></div>
			<div id="Subcat" style="display: none"><%@include file="/JSP/ShippingEngineUi/content/Subcat.jsp"%></div>
		</div>
</body>
</html>