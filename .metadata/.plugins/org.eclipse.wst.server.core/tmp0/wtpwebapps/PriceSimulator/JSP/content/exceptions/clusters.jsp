<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/content/exceptions/clusters.css" media="screen" />
	<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/loader.css" media="screen" />
	<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/buttons.css" media="screen" />
		<script type="text/javascript" src="/PriceSimulator/JS/utility/jquery-1.12.0.min.js"></script>
	<script type="text/javascript" src="/PriceSimulator/JS/content/exceptions/clusters.js"></script>
	<script type="text/javascript" src="/PriceSimulator/JS/utility/loader.js"></script>
</head>
<body>
	<script type="text/javascript">
	
		var obj="<%= session.getAttribute("report") %>";
		if(obj!= null && obj!=undefined && obj!='')
			if(obj=='Success' || obj=='Some Error Occurred')
				alert('<%= session.getAttribute("report") %>');
		
		</script>
	<div class="clusterleftpanel" style="width: 80px;height: 28px;float: right;">
		<span class="button button_red addbrand"  style="font: bold;font-size: 15px;" ><a href="/PriceSimulator/exceptions/createclusters.action">Create Cluster</a></span>
		
	</div>
		<div class="clusterleftpanel" style="display: none;">
		<div class="head"><h2>Manage Clusters</h2></div>
		<div class="createcluster">
			<span class="section">Create New Clusters</span>
			<hr>
			<span class="namehead">Cluster Name</span>
			<input type="text" class="name"/>
			<span class="button button_red create">Add Cluster</span>
			<span class="message">*by default SubCategory Level rules will be applied.</span>
		</div>
		<div class="actions">
			<span class="section">Add new SUPC's to Clusters</span>
			<hr>
			<span class="choosehead">Select a Cluster</span>
			<form method="post" action="/PriceSimulator/ajax/saveclustertemp.action" enctype="multipart/form-data">
				<select name="clusterid" class="choosecluster">
				   	<option value="-1">Select…</option>
			  		<s:iterator value="cluster" var="cl">
	        			<option value="<s:property value="#cl.getID()"/>"><s:property value="#cl.getName()"/></option>
        			</s:iterator>
      			</select>
      			<a><span class="button button_red downtemp">Download Template</span></a>
				<input type="file" name="file" class="button button_red browse" accept=".xlsx"/>
				<input type="submit" class="button button_red savetemp" value="Upload"/>
			</form>
		</div>
		<div class="report"><div class="bar"></div></div>
	</div>
	



	<div class="clusterrightpanel" style="float: left;">
		<s:iterator value="cluster" var="cl">
			<div id="<s:property value="#cl.getID()"/>" class="cluster">
				<div class="head">
					<h2><s:property value="#cl.getName()"/>
					<span class="button" style="text-align: center" onclick="exportData('supc',this)">
					SUPC
					</span>&nbsp; <span class="button" style="text-align: center" onclick="exportData('brands',this)">
					Brands
					</span>&nbsp;<span class="button" style="text-align: center" onclick="exportData('sellers',this)">
					Sellers
					</span>&nbsp;<%-- <span class="button" style="text-align: center">
					<a href="/PriceSimulator/exceptions/createclusters.action?clusterId=<s:property value="#cl.getID()"/>">Edit</a>
					</span> --%>
					</h2>
					<%-- <span class="button button_red delete" onclick="deleteCluster(this)">X</span> --%>
				</div>
				
				<div>
				<table>
				
				</table>
				
				</div>
				<div class="products">
				
					<table>
					<tr>
				
				<td>Discount:</td> <td><s:property value="#cl.getDiscountRange()"/></td>
				</tr>
				<tr>
				
				<td>Price:</td> <td><s:property value="#cl.getPriceRange()"/></td>
				</tr>
				<tr>
				
				<td>Seller Rating:</td> <td><s:property value="#cl.getSellerRatingRange()"/></td>
				</tr>
				<tr>
				
				<td>Fulfilment Type:</td> <td><s:property value="#cl.getFulfilmentType()"/></td>
				</tr>
						<s:iterator value="#cl.getSupcMap()" var="product">
						<tr>
        					<td>   <s:property value="#product.getPopularityRank()"/></td>
        					<td><s:property value="#product.getSupc()"/></td>
        					<td><s:property value="#product.getName()"/></td>
        					<td><span id="<s:property value="#product.getSupc()"/>" class="button button_red delete" onclick="deleteSUPC(this)">X</span></td>
						</tr>
						</s:iterator>
					</table>
				</div>
			</div>
		</s:iterator>
	</div>
	<div id="parentpopDiv" style="width: 100%;height: 100%;background-color: gray;opacity: .8;filter: alpha(opacity = 80);display: none;">
	<div id="popDiv" class="ontop" style="border:3px solid black; padding:25px; font-size:110%; text-align:center;overflow: auto;overflow: scroll;">
	
			<table id="popup" style="overflow: auto;overflow: scroll;border: 2px black;">
			<tr><td>SUPC List</td> </tr>
			</table>
		</div>
		
	</div>	
		<%
		session.setAttribute("report",""); 
		%>
</body>
</html>