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
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/content/exceptions/removeproduct.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/content/rules/producttab.css" media="screen" />
<!-- <link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/bootstrap-combined.min.css" media="screen" /> -->

<script type="text/javascript" src="/PriceSimulator/JS/utility/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/content/rules/brand.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/utility/loader.js"></script>

<script type="text/javascript" src="/PriceSimulator/JS/utility/bootstrap.min.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/content/exceptions/removeproduct.js"></script>

<style type="text/css">
table th {
	background-color: #f5f5f5;
	color: black;
}

.panel {
	margin: 0;
	padding: 0;
	border: none;
}
</style>
</head>
<body>
	<script type="text/javascript">
	showloader("div.report > div.bar");
		var obj='<%=session.getAttribute("report")%>';
		if(obj!= null && obj!=undefined && obj!='')
			if(obj=='Success' || obj=='Some Error Occurred' || obj.indexOf("receive")>=0){
				alert(obj);
		
		<%session.setAttribute("report", "");%>
			}
	
		</script>
		<br><br><br>
<input class="nplUser hidden" value="<s:property value="IPS_USER" />"></input>
<input class="ipsUser hidden" value="<s:property value="NPL_USER" />"></input>
<form action="exceptions/removeproduct.action" class="search">
	&nbsp;&nbsp;&nbsp;&nbsp;<input name="supcSearch" id="supcSearch" placeholder="SUPC Search" class="supcSearch" type="text" value="<s:property value="supcSearch" />">
	<input name="vendorSearch" class="vendorSearch" id="vendorSearch" placeholder="Vendor Search" value="<s:property value="vendorSearch" />" type="text">
	<button class="buttonSearch" value="Search" >Search</button>
</form>
	<br>
	<div style="">
		<div class="panel panel-default" style="">
			<div class="panel-body" style="">
				<div class="dataTable_wrapper" style="">
					<div class="box-content box-table" style="">
						<table class="products table table-bordered">
							<thead>
								<tr>
									<%-- <th >PR.</th>
									<th style="text-align: center;" ><span class="button button_red deleteall">Remove</span></th> --%>
									<th class="hidden">ID</th>
									<th>PR.</th>
									<th>SUPC</th>
									<th>Brand</th>
									<th>Product Name</th>
									<th>Seller</th>
									<th>Source</th>
									<th>Source Code</th>
									<th>Start Time</th>
									<th>End Time</th>
									<th style="display: none;">user</th>
									<s:if test="session.subcatAccess == 'read' && session.adminPrivilege!='admin'">
									</s:if>
									<s:else>
										<th>Remove</th>
									</s:else>
							</thead>
							<s:iterator value="product" var="prod">
								<tr id="<s:property value="#prod.getSupc()"/>">
									<td type="hidden" class="id hidden" id="<s:property value="#prod.getId()"/>"><s:property value="#prod.getId()" /></td>
									<td class = "popularityRank"><s:property value="#prod.getRank()" /></td>
									<td class="supc"><s:property value="#prod.getSupc()" /></td>
									<td class="Brand"><s:property value="#prod.getBrand()" /></td>
									<td class="Name"><s:property value="#prod.getName()" /></td>
									<td class="seller" id="<s:property value="#prod.getVendorCode()"/>"><s:property value="#prod.getVendorCode()" /></td>
									<td class="source" id="<s:property value="#prod.getSource()"/>"><s:property value="#prod.getSource()" /></td>
									<td class="sourceCode" id="<s:property value="#prod.getSourceCode()"/>"><s:property value="#prod.getSourceCode()" /></td>
									<td class="startTime" id="<s:property value="#prod.getStartTime()"/>"><s:property value="#prod.getStartTime()" /></td>
									<td class="endTime" id="<s:property value="#prod.getEndTime()"/>"><s:property value="#prod.getEndTime()" /></td>
									<td class="username" style="display: none;" id="<s:property value="#prod.getUsername()"/>"><s:property value="#prod.getUsername()" /></td>
									<s:if test="session.subcatAccess =='read' && session.adminPrivilege!='admin'">
									
									</s:if>
									<s:else>
										<td><span class="btn btn-primary delete" onclick="ConfirmDelete(this)">X</span></td>
									</s:else>
								</tr>
							</s:iterator>
						</table>
					<div class="Pagination">
						<s:if test="getPageNum() > 1">
							<input type="button" class="btn btn-primary action updatesubcat" id="previousPage" name="Page" value="<" onclick="movePage('previous' ,<s:property value='getPageNum()'/>)">
						</s:if>
						<label>Page No. : <s:property value="getPageNum()" /></label>
						<s:if test="getLastPage()=='false'">
							<input type="button" class="btn btn-primary action updatesubcat" id="nextPage" name="Page" value=">"
								onclick="movePage('next',<s:property value='getPageNum()'/>)">
						</s:if>
					</div>
							<input type="hidden" id="usernameTxt" value="<s:property value="#session.user.getEmail()"/>">
					
						<s:if test="session.subcatAccess == 'read' && session.adminPrivilege!='admin'">

						</s:if>
						<s:else>
							<input type="button" style="float: right; width: 120px;" class="deleteall btn btn-primary" id="deleteall" value="Delete All" />
							
						</s:else>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="content">

		<form method="post" class="form" action="/PriceSimulator/ajax/saveremoveproducttemp.action" enctype="multipart/form-data">

			<input type="file" name="file" class="btn btn-primary browse" style="display: inline; width: 250px" accept=".xlsx" /> <input type="submit"
				style="display: inline" class="savetemp btn btn-primary " value="Upload" /> &nbsp;&nbsp; <a style="font: italic;">Download:</a> <a href="/PriceSimulator/Temp/rfs.xlsx" style="text-decoration: underline;"> <%-- <span
				class="btn btn-primary downtemp"> --%>Template</span>
			</a>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<a onclick="this.href='/PriceSimulator/exceptions/removeproduct.action?type=download&supcSearch=' + document.getElementById('supcSearch').value+'&vendorSearch=' + document.getElementById('vendorSearch').value;" href="" style="text-decoration: underline;"> <%-- <span
				class="btn btn-primary downtemp"> --%>RFS Data</span>
			</a>

		</form>

	</div>
	<div class="report">
		<div class="bar"></div>
	</div>
</body>
</html>