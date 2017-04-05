<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/content/rules/clustertab.css" media="screen" />
	<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/buttons.css" media="screen" />
	<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/loader.css" media="screen" />
	<script type="text/javascript" src="/PriceSimulator/JS/content/rules/cluster.js"></script>
	<script type="text/javascript" src="/PriceSimulator/JS/utility/loader.js"></script>
</head>
<body>
	<table class="clusterrules table" style="width:70%;">
		<tr>
  			<th class="nobg">Clusters</th>
  			<th>CM Rule (%)</th>
  			<th>GM Rule (%)</th>
  			<th>Competitor Difference (%)</th>
  			<th>Max Competitor Difference (Rs.)</th>
  			<th>CM Rule No Competition (%)</th>
  			<th>GM Rule No Competition (%)</th>
  			<th>Actions</th>
  			<th>Status</th>
		</tr>
		<s:iterator value="cluster" var="cl">
			<tr id="<s:property value="#cl.getID()"/>">
				<th><s:property value="#cl.getName()"/></th>
				<td class="CM"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="#cl.getParameterValue(\"CM\")"/>"/></td>
				<td class="GM"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="#cl.getParameterValue(\"GM\")"/>"/></td>
				<td class="CD"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="#cl.getParameterValue(\"CD\")"/>"/></td>
				<td class="MD"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="#cl.getParameterValue(\"MD\")"/>"/></td>
				<td class="NC"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="#cl.getParameterValue(\"NC\")"/>"/></td>
			<td class="NCGM"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="#cl.getParameterValue(\"NCGM\")"/>"/></td>
				<td>
					<span class="btn btn-primary updatecluster" style="width:20%;" onclick="updateCluster(this)">Update</span>
					<span class="btn btn-primary deletecluster" style="width:20%;" onclick="deleteCluster(this)">X</span>
				</td>
				<td></td>
			</tr>
		</s:iterator>	
	</table>
	<span class="btn btn-primary updateallcluster" onclick="updateAllCluster()" style="width:20%;">Update All</span>
</body>
</html>