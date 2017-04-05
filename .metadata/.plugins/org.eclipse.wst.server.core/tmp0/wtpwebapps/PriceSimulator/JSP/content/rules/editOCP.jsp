<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/bootstrap-datetimepicker.min.css" media="screen" />

<link type="text/css" rel="stylesheet"
	href="/PriceSimulator/CSS/utility/bootstrap.min.css" media="screen" />
<link type="text/css" rel="stylesheet"
	href="/PriceSimulator/CSS/content/rules/brandtab.css" media="screen" />
<link type="text/css" rel="stylesheet"
	href="/PriceSimulator/CSS/utility/buttons.css" media="screen" />
<link type="text/css" rel="stylesheet"
	href="/PriceSimulator/CSS/utility/loader.css" media="screen" />
<link type="text/css" rel="stylesheet"
	href="/PriceSimulator/CSS/content/exceptions/mop.css" media="screen" />
<script type="text/javascript"
	src="/PriceSimulator/JS/utility/jquery-1.12.0.min.js"></script>


<script type="text/javascript"
	src="/PriceSimulator/JS/utility/loader.js"></script>
<script type="text/javascript"
	src="/PriceSimulator/JS/content/exceptions/ocp.js"></script>
<script type="text/javascript"
	src="/PriceSimulator/JS/utility/bootstrap.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.5.1/moment.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.4.0/lang/en-gb.js"></script>
<script type="text/javascript"
	src="/PriceSimulator/JS/utility/datetimepicker.js"></script>

<title>OCP</title>
</head>
<body>
	<div>
		<%-- <div class="pad_top_50" style="display:inline;> --%>
	<div class="pricing" style="margin-bottom: 0px;">
	
	<table class=" hidden heading">
					<tr>
						<td><h6 style="color: red;">
								<b>Add new SUPC</b>
							</h6></td>
					</tr>
				</table>
	<br><br>
	<form method="post" action="/PriceSimulator/ajax/addproductOCP.action" enctype="multipart/form-data" class="form-inline">
			&nbsp;<label>SUPC :</label>&nbsp;<input type="text" name="supclist" class="manualinput form-control" class="form-control" required/>
			&nbsp;<input type="submit" class="btn btn-primary addsupc form-control" value="Add" style="margin-left:2%;margin-right:2%"/>
	</div>
	</form>
	<!-- </div> -->
	<br><br>
	<form class="form" action="../exceptions/ocp.action" name="fetchVendor"method="POST">
	<div style="background-color: none; border: none; margin-left: 0">
		<div class="panel panel-default" style="border: none; margin-left: 0">
			<div class="panel-body" style="margin-left: 0">
				<div class="dataTable_wrapper" style="margin-left: 0">
					<div class="box-content box-table" style="margin-left: 0">
						<table id="one" class="product table table-bordered">
							<thead>
								<tr>
									<th style="text-align: center;padding: 4px;">
									<input name="mainToggle" type="checkbox" onClick="toggle(this,'all')" /></th>
									<th>SUPC</th>
									<th>Seller Code</th>
									<th>Seller Name</th>
									<th>Seller Zone</th>
									<th>SP</th>
									<th>Inventory</th>
									
									
							</thead>
							<s:iterator value="%{#session.ocpList}" var="ocp" status="counter">
								<tr id="<s:property value="getSupc()"/>">
									<td><input class="checkClass" type="checkbox" name="all" value="<s:property value='#ocp.getSupc()'/>##<s:property value='#ocp.getVendorCode()' />" /></td>
									<td><s:property value="getSupc()" /></td>
									<td><s:property value="getVendorCode()" /></td>
									<td><s:property value="getVendorName()" /></td>
									<td><s:property value="getVendorZone()" /></td>
									<td><s:property value="getSp()" /></td>
									<td><s:property value="getInventory()"/></td>
									
								</tr>
							</s:iterator>
						</table>
						<input type="hidden" name="ocpList" value="#ocp"/>
						<input type="hidden" id="operationType" name="operationType" value="1" />
						<span class="btn btn-primary" onclick="setTypeAndSubmit(1);">Add</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	</form> 
	
	<div class="row" style="width: 100%; margin-left: 1%; border: none;">
		<div class="col-sm-12" style="background-color: none;padding-left:10px;">
			<div class="panel panel-default">

				<!-- <div class="dataTable_wrapper"> -->
				<!-- <div class="box-content box-table container"> -->
				<div class="" style="overflow-x: auto;padding:0">
					<table class="products table table-bordered dataTable text-center" id=products >
						<thead>
								<tr>
									<th style="text-align: center;padding: 4px;">
									<input id="Toggle" class="Toggle" name="Toggle" type="checkbox" onClick="toggle(this,'ocp')" /></th> 
									<th>Product Name</th>
									<th>SUPC</th>
									<th>Seller Name</th>
									<th>Seller Zone</th>
									<th>SP</th>
									<th>MOP</th>
									<th>OP</th>
									<th>Seller Funded CB</th>
									<th>Inventory </th>
									<th>Discount Type</th>
									<th>Instant</th>
									<th>Wallet</th>
									<th>Effective Price</th>
									<th>CM%</th>
									<th>CMPU</th>
									<th>Start Date</th>
									<th>End Date</th>
									<th>Status</th>		
							</thead>
							<s:iterator value="%{#session.ocpDBList}" var="ocpObj" status="counter">
								<tr id="<s:property value="getVendorName()"/>">
									<td><input class="checkClass" type="checkbox" name="ocp" value="<s:property value='#ocp.getSupc()'/>##<s:property value='#ocp.getVendorCode()' />" /></td> 
									<td><s:property value="getName()" /></td>
									<td><span class="supc"><s:property value="getSupc()" /></span></td>
									<td><s:property value="getVendorName()" />
									<span class="hidden vendorCode"><s:property value="getVendorCode()" /></span></td>
									<td><s:property value="getVendorZone()" /></td>
									<td>
									<!-- <span class="hidden TP"><s:property value="getTransferPrice()" /></span> -->
									<span class="hidden MarginType"><s:property value="getMarginType()" /></span>
									<span class="hidden Margin"><s:property value="getMargin()" /></span> 
									<span class="hidden OverheadCharges"><s:property value="getOverhead_charges()" /></span> 
									<span class="hidden PaymentCharges"><s:property value="getPayment_charges()" /></span> 
									<span class="hidden shippingCharges"><s:property value="getShippingCharges()" /></span> 
									<span class="hidden VP"><s:property value="getSellerPrice()" /></span> 
									<span class="SP"><s:property value="getSp()" /></span>
									</td>
									<td><span class="MOP"><s:property value="getMop()"/></span></td>
									<td><span class="OP"><s:property value="getOp()"/></span></td>
									<td><span class="Int_cb_v"><s:property value="getInt_cb_v()" /></span></td>
									<td><span class="Inventory"><s:property value="getInventory()" /></span></td>
									<!-- <td class="col-md-2 "><label> </label></td> -->
							<td class="discountType"><select  class="discountType" id="discountType" name="discountType" class="form-control" onchange="updateData(this)" >
									<option value="0">PCT</option>
									<option value="1">ABS</option>
							</select></td>
									<td>
									
									<input style="width: 60px" class="instant" type="number" step="10" onchange="updateData(this)" onkeypress="validate(event)"
									value="<s:property value="getParameterValueFromType(\"INC\")"/>"></td>
									<td>
									<input style="width: 60px" class="wallet" type="number" step="10" onchange="updateData(this)" onkeypress="validate(event)"
									value="<s:property value="getParameterValueFromType(\"WCB\")"/>"></td>
									<td><span class="detailvalue EP"><s:property value="getEffectivePrice()" /></td>
									<td><span class="detailvalue CM"><s:property value="getCm()" />
									<input type="hidden" id="isRemove" name="isRemove" /></td>
									
									<td><span class="detailvalue CMPU"> <s:property value="getCmpu()"/></span></td>
									<td class="startTime col-sm-3 form-group">
									<div style="width: 200px" class='input-group date datetimepicker startTime'>
										<input type='text' class="form-control startTime" value="<s:property value="#prod.getStartTime()"/>" onkeypress="return false;"/> <span
											class="input-group-addon"> <span class="glyphicon glyphicon-calendar"> </span>
										</span>
									</div></td>
								<td class="endTime col-sm-3 form-group">
									<div style="width: 200px" class='input-group date datetimepicker endTime'>
										<input value="<s:property value="#prod.getEndTime()"/>" type='text' class="form-control endTime" onkeypress="return false;" /> <span class="input-group-addon">
											<span class="glyphicon glyphicon-calendar"> </span>
										</span>
									</div></td>
									<td> </td>
								</tr>
							</s:iterator>
						</table>
						
					</div>
				</div>
			</div>
		</div>
	&nbsp;&nbsp;&nbsp;&nbsp;<span class="btn btn-primary" onclick="updateAllProduct()">Update</span>
	&nbsp;&nbsp;&nbsp;&nbsp;<span class="btn btn-primary" onclick="removeProduct()"> Remove</span>
	
	</div>
	</div>
	<script type="text/javascript">
							$('.datetimepicker.startTime').datetimepicker({

								format : 'YYYY/MM/DD HH:mm:ss',
								orientation : 'top right'
							});
							$('.datetimepicker.endTime').datetimepicker({

								format : 'YYYY/MM/DD HH:mm:ss',
								orientation : 'top right'
							});
							
							function toggle(source, type) {
								
								checkboxes = document.getElementsByName(type);

								for (var i = 0, n = checkboxes.length; i < n; i++) {
									checkboxes[i].checked = source.checked;

								}
							}
						</script>

</body>

</html>