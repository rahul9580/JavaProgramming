<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/bootstrap.min.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/content/rules/brandtab.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/buttons.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/loader.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/content/exceptions/mop.css" media="screen" />

<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/content/rules/producttab.css" media="screen" />
<!-- <link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/bootstrap-combined.min.css" media="screen" /> -->

<script type="text/javascript" src="/PriceSimulator/JS/utility/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/content/rules/brand.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/utility/loader.js"></script>

<script type="text/javascript" src="/PriceSimulator/JS/utility/bootstrap.min.js"></script>

<script type="text/javascript" src="/PriceSimulator/JS/content/exceptions/mop.js"></script>
<style type="text/css">
table th {
	background-color: #f5f5f5;
	color: black;
}
</style>
</head>
<body>
	<!-- <div class="expmopleftpanel"> -->
	<!-- <div class="head"><h2>Products MOP</h2></div> -->
	<%-- <div class="content">
		</div>
		<a href="/PriceSimulator/Temp/mop.xlsx"><span class="button button_red downtemp">Download Template</span></a>
		<form method="post" action="/PriceSimulator/ajax/savemoptemp.action" enctype="multipart/form-data">
			<input type="file" name="file" class="button button_red browse" accept=".xlsx"/>
			<input type="submit" class="button button_red savetemp" value="Upload"/>
		</form>
		<div class="report"><div class="bar"></div></div> --%>
	<script type="text/javascript">
		var obj='<%=session.getAttribute("report")%>';
		if(obj!= null && obj!=undefined && obj!='')
			if(obj=='Success' || obj=='Some Error Occurred')
				alert('<%=session.getAttribute("report")%>');
	</script>
	<br>
	<!-- <div class="row" style="width: 100%; margin-left: 40px; border: none;"> -->
	<div style="background-color: none; border: none; margin-left: 0">
		<div class="panel panel-default" style="border: none; margin-left: 0">
			<div class="panel-body" style="margin-left: 0">
				<div class="dataTable_wrapper" style="margin-left: 0">
					<div class="box-content box-table" style="margin-left: 0">
						<table class="products table table-bordered">
							<thead>
								<tr>
									<%-- <th >PR.</th>
									<th style="text-align: center;" ><span class="button button_red deleteall">Remove</span></th> --%>
									<th>PR.</th>
									<th>SUPC</th>
									<th>Brand</th>
									<th>Product Name</th>
									<th>MOP</th>
									<th>Remove</th>
							</thead>
							<s:iterator value="product" var="prod">
								<tr id="<s:property value="#prod.getSupc()"/>">
									<td><s:property value="#prod.getRank()" /></td>
									<td><s:property value="#prod.getSupc()" /></td>
									<td><s:property value="#prod.getBrand()" /></td>
									<td><s:property value="#prod.getName()" /></td>
									<td><s:property value="#prod.getMop()" /></td>
									<td><span class="btn btn-primary delete" onclick="ConfirmDelete(this)">X</span></td>
								</tr>
							</s:iterator>
						</table>
						<input type="button" style="float: right; width: 120px;" class="deleteall btn btn-primary" id="deleteall" value="Delete All" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="content">
		<form method="post" action="/PriceSimulator/ajax/savemoptemp.action" enctype="multipart/form-data">

			<input type="file" name="file" class="btn btn-primary browse" style="display: inline; width: 250px" accept=".xlsx" /> <input type="submit"
				style="display: inline" class="savetemp btn btn-primary " value="Upload" /> &nbsp;&nbsp; <a href="/PriceSimulator/Temp/mop.xlsx"> <%-- <span class="btn btn-primary downtemp"> --%>Download
				Template</span>
			</a>
		</form>
	</div>
	<div class="report">
		<div class="bar"></div>
	</div>
	<%
		session.setAttribute("report",""); 
		%>
</body>
</html>