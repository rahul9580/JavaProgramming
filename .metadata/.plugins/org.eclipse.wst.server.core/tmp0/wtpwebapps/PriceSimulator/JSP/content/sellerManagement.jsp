 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/bootstrap.min.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/bootstrap-datetimepicker.min.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/buttons.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/loader.css" media="screen" />
<!-- <link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/bootstrap-combined.min.css" media="screen" /> -->


<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600' rel='stylesheet' type='text/css'>
<link href="/PriceSimulator/CSS/content/sellerManagement/jquery.bdt.css" type="text/css" rel="stylesheet">
<link href="/PriceSimulator/CSS/content/sellerManagement/style.css" type="text/css" rel="stylesheet">


<script type="text/javascript" src="/PriceSimulator/JS/utility/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/utility/loader.js"></script>

<script type="text/javascript" src="/PriceSimulator/JS/utility/bootstrap.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.5.1/moment.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.4.0/lang/en-gb.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/utility/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/content/sellerManagement.js"></script>

</head>
<body>

	<table class="brandNames dropdown" style=""></table>
	<h4 style="padding: 10px 0; border-top: 1px solid #efefef; border-bottom: 1px solid #efefef; margin-bottom: 20px;">
		<b>Manage Seller Page</b>
	</h4>
	<form method="post" action="sellerManagement.action" name="filterDetails" id="filterDetails">
		<div class="well well-sm">
			<table class="table" style="width: 96%; margin: 10px 2%">
				<tbody>
					<tr>
						<td class="startTime "><label>Start Time</label>
							<div class='input-group date datetimepicker startTime pull-right' style="width: 30%">
								<input type='text' class="form-control startTime" name="startTime" id="startTime" value='<s:property value="getStartTime()" />' /> <span
									class="input-group-addon"> <span class="glyphicon glyphicon-calendar"> </span>
								</span>
							</div></td>
						<td class="endTime "><label>End Time</label>
							<div class='input-group date datetimepicker endTime pull-right' style="width: 30%">
								<input type='text' class="form-control endTime" name="endTime" id="endTime" value='<s:property value="getEndTime()" />' /> <span
									class="input-group-addon"> <span class="glyphicon glyphicon-calendar"> </span>
								</span>
							</div></td>
					</tr>

					<tr>

						<td class="spChangeFrom"><label>TP fluctuation From</label><input type="number" name="spChangeFrom" id="spChangeFrom"
							class="spChangeFrom form-control pull-right" step="0.1" onkeypress="validate(event)" style="width: 30%"
							value='<s:property value="getSpChangeFrom()" />' /></td>
						<td class="spChangeTo"><label>TP fluctuation To</label><input type="number" id="spChangeTo" name="spChangeTo"
							class="spChangeTo form-control pull-right" step="0.1" onkeypress="validate(event)" style="width: 30%"
							value='<s:property value="getSpChangeTo()" />' /></td>

					</tr>
					<tr>
					<td class="supcToBeSearched"><label>SUPC</label><input type="text" name="supcToBeSearched" id="supcToBeSearched"
                         class = "supcToBeSearched form-control pull-right" style="width: 30%"
                         value='<s:property value="getSupcToBeSearched()"/>' /></td>
                    <td class="vendorCodeToBeSearched"><label>Vendor</label><input type="text" name="vendorCodeToBeSearched" id="vendorCodeToBeSearched"
                         class = "vendorCodeToBeSearched form-control pull-right" style="width: 30%"
                        value='<s:property value="getVendorCodeToBeSearched()"/>' /></td>
                    <td></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
	<div class="action">
		<button type="button" style="margin-left: 10px;" id="updatebrandBtn1" class="btn btn-primary action updatesubcat" onclick="searchList()">Search</button>
		<button type="button" style="margin-left: 80%;" id="updatebrandBtn1" class="btn btn-primary action updatesubcat" onclick="downloadSheet()">Download</button>
		<!-- <a href="sellerManagement.action?actionType=download"></a> -->
		<div class="report1" style="margin-left: 10px">
			<div class="bar"></div>
		</div>
	</div>
	<div class="load"></div>

	<br>

	<script type="text/javascript">
		$('.datetimepicker.startTime').datetimepicker({

			format : 'YYYY/MM/DD HH:mm:ss',
			orientation : 'top right'
		});
		$('.datetimepicker.endTime').datetimepicker({

			format : 'YYYY/MM/DD HH:mm:ss',
			orientation : 'top right'
		});
	</script>

	<form method="post" action="sellerManagement.action" name="sellerManagementForm">
		<div class="container" id="container">
			<div class="row">
				<div class="box clearfix">
					<!-- <h3>Seller Management Table</h3>
					<p>Details</p> -->
					<br>
					<table class="table table-hover" id="bootstrap-table">
						<thead>
							<tr>
								<th style="text-align: center;"><input name="mainToggle" type="checkbox" onClick="toggle(this)" /></th>
								<th>Seller</th>
								<th>Seller ID</th>
								<th>SUPC</th>
								<!-- <th>Subcat</th> -->
								<th>D7-TP</th>
								<th>Max TP</th>
								<th>Time TP Changed</th>
								<th>% TP Changed</th>
								<th>Date</th>
								<!-- <th>CB</th> -->
							</tr>
						</thead>
						<tbody>
							<s:iterator value="getList()" var="group" status="counter">
								<s:if test="rfsSupc!=null">
									<tr style="background: #F2DEDE" class='reject'>
								</s:if>
								<s:else>
									<tr style="background: #fff" class='reject'>
								</s:else>
								<s:if test="rfsSupc!=null">
									<td><label>Penalized</label></td>
								</s:if>
								<s:else>
									<td style="text-align: center;"><input type="checkbox" name="listForPenalty" class="listForPenalty"
										value="<s:property  value='supc'/>##<s:property  value="vendor_code"/>"></td>
								</s:else>
								<td><s:property value="vendor_name" /></td>
								<td><s:property value="vendor_code" /></td>
								<td><s:property value="supc" /></td>
								<%-- <td><s:property value="subcategory_id" /></td> --%>
								<td><s:property value="avg_tp" /></td>
								<td><s:property value="max_tp" /></td>
								<td style="text-align: center;"><s:property value="tp_fluctuation_count" /></td>
								<td><s:property value="diff_per" /></td> 
								<td><s:property value="update_time" /></td>
								<%-- <td><s:property value="status" /></td> --%>
								</tr>
							</s:iterator>
						</tbody>
					</table>

					<input type="hidden" id="actionType" name="actionType" value="penalty"> 
					<input type="hidden" id="penaltyDays" name="penaltyDays">
					<input type="hidden" name="spChangeFrom" value="<s:property value="getSpChangeFrom()"/>">
					 <input type="hidden" name="spChangeTo" value="<s:property value="getSpChangeTo()"/>"> <input type="hidden" name="startTime" value="<s:property value="getStartTime()"/>">
					<input type="hidden" name="endTime" value="<s:property value="getEndTime()"/>">
					<input type="hidden" name="supcToBeSearched" value="<s:property value="getSupcToBeSearched()"/>">
					<input type="hidden" name="vendorCodeToBeSearched" value="<s:property value="getVendorCodeToBeSearched()"/>">
					 <input type="hidden" name="pageNo" value="<s:property value="getPageNo()"/>">
						<div style="margin-left: 50%">
						<input type="button" class="btn btn-primary action updatesubcat" id="previousPage" name="Page" value="<" onclick="movePage('previous' ,<s:property value='getPageNo()'/>)"> 
						<input type="button" class="btn btn-primary action updatesubcat" id="nextPage" name="Page" value=">" onclick="movePage('next',<s:property value='getPageNo()'/>)">
						</div>	
				</div>
			</div>
		</div>
		<div>
			<br>
			<div class="action">
				<button type="button" style="margin-left: 10px;" id="updatebrandBtn1" class="btn btn-primary action updatesubcat" onclick="rfsMoveList()">Penalize</button>
			</div>

		</div>
		<div class="report11" style="margin-left: 10px">
			<div class="bar"></div>
		</div>
	</form>
	<input type="hidden" id="pageNo">


	<script src="http://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
	<script src="/PriceSimulator/JS/content/sellerManagement/bootstrap.min.js" type="text/javascript"></script>
	<%-- <script src="/PriceSimulator/JS/content/sellerManagement/jquery.sortelements.js" type="text/javascript"></script> --%>
	<script src="/PriceSimulator/JS/content/sellerManagement/jquery.bdt.js" type="text/javascript"></script>

</body>
</html>








