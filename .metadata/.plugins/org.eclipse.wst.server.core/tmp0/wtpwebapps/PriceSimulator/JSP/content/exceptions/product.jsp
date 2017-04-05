<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/content/exceptions/product.css" media="screen"/>
	<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/buttons.css" media="screen"/>
	<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/loader.css" media="screen" />
	<script type="text/javascript" src="/PriceSimulator/JS/utility/jquery-1.12.0.min.js"></script>
	<script type="text/javascript" src="/PriceSimulator/JS/content/exceptions/product.js"></script>
	<script type="text/javascript" src="/PriceSimulator/JS/utility/loader.js"></script>
</head>
<body>
	<script type="text/javascript">
		var obj='<%= session.getAttribute("report") %>';
		if(obj!= null && obj!=undefined && obj!='')
			if(obj=='Success' || obj=='Some Error Occurred')
				alert('<%= session.getAttribute("report") %>');
		
		
		</script>
	<div class="expupleftpanel">
		<div class="head"><h2>Products in Exception</h2></div>
		<div class="content">
			<form method="post" action="/PriceSimulator/ajax/addproduct.action" enctype="multipart/form-data" style="display:inline;float:left">
				<label> SUPCs :</label><textarea name="supclist" class="manualinput" rows="" cols=""></textarea>
				<input type="submit" class="btn btn_primary addsupc" value="Add"/>
			</form>
		</div>
		<span class="message">* Please use semicolon(;) to separate multiple SUPC's</span>
		<a href="/PriceSimulator/Temp/product.xlsx"><span class="btn btn_primary downtemp">Download Template</span></a>
		<form method="post" action="/PriceSimulator/ajax/saveproducttemp.action" enctype="multipart/form-data">
			<input type="file" name="file" class="btn btn_primary browse" accept=".xlsx"/>
			<input type="submit" class="btn btn_primary savetemp" value="Upload"/>
		</form>
		<div class="report"><div class="bar"></div></div>
	</div>
	<div class="expuprightpanel">
		<table class="products">
    		<tr>
        	<th>PR.</th>        
        	<th>SUPC</th>
        	<th>Brand</th>
        	<th>Product Name</th>
        	<th><span class="btn btn_primary"></span></th>
    		</tr>
    	
    		<s:iterator value="product" var="prod">
			<tr id="<s:property value="#prod.getSupc()"/>">
        		<td><s:property value="#prod.getRank()"/></td>
        		<td><s:property value="#prod.getSupc()"/></td>
        		<td><s:property value="#prod.getBrand()"/></td>
        		<td><s:property value="#prod.getName()"/></td>
        		<td><span class="btn btn_primary delete" onclick="removeSUPC(this)">X</span></td>
			</tr>
			</s:iterator>
    	</table>
	</div>
	<%
	
	session.setAttribute("report",""); 
	%>
	
</body>
</html>