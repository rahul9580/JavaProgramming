<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page import="action.Action"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/bootstrap.min.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/bootstrap-datetimepicker.min.css" media="screen" />
<!-- <link href="/PriceSimulator/CSS/content/summary/dataTables.responsive.css" rel="stylesheet"> -->

<!-- <link type="text/css" rel="stylesheet"
	href="/PriceSimulator/CSS/content/rules/brandtab.css" media="screen" /> -->
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/buttons.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/loader.css" media="screen" />
<!-- <link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/bootstrap-combined.min.css" media="screen" /> -->

<script type="text/javascript" src="/PriceSimulator/JS/utility/jquery-1.12.0.min.js"></script>


<script type="text/javascript" src="/PriceSimulator/JS/utility/loader.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/content/rules/product.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/utility/bootstrap.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.5.1/moment.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.4.0/lang/en-gb.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/utility/bootstrap-datetimepicker.min.js"></script>
</head>
<body>
<script type="text/javascript">
function updateRuleIdHTML(){
var object ='<%=request.getAttribute("message") %>';
document.getElementsByClassName("ruleId")[0].innerHTML=object;
}
</script>
<script type="text/javascript">

var state = { 'page_id': 1, 'user_id': 5 };
var title = 'Rules';
var currurl = window.location.href;
var tokens = currurl.split('/');
var url = tokens[0]+'//'+tokens[2]+'/'+tokens[3]+'/rules.action';

history.pushState(state, title, url);
       
		var obj="<%= session.getAttribute("report")%>";
		
		if(obj==""){
			
		}else{
			var obj1=obj.replace(/#/g, '\n');
			alert(obj1);
		}
		
		/* if ( obj == "Failed" ) {
			alert ( obj ) ;
		}
		else if ( obj == "All SUPCs added successfully") {
			console.log (obj);
		}
		else if ( obj.startsWith("The vendor for this SUPC")) {
			alert (obj) ;
		}
		else if (obj.startsWith("Existing SUPCs:")){
			obj = obj.substring (16,obj.length-1) ;
			supcArray = obj.split(",");
			var result = "List of SUPCs that could not be added because rules already exist for them. You can edit it from View Summary Page.\n";
						
			for ( var i = 0 ; i < supcArray.length ; i++) {
				result = result + supcArray [ i ] + "\n";
			}
			alert (result);
		
		}
	 */
		</script>
<div class="hidden taxFactor"><s:property value="getTaxFactor()"/></div>
<div>
	<div class="expupleftpanel well well-md" style="margin:2%;margin-right:1%">
		<!-- <div class="head"><h4>Products in Exception</h4></div> -->
		<div class="content" style="display: inline; float: left; width: 35%">
			<form method="post" action="/PriceSimulator/ajax/addproduct.action" enctype="multipart/form-data" class="form-inline">
				<label>SUPCs :</label>
				<textarea name="supclist" class="manualinput form-control" class="form-control" rows="1" cols="20" required></textarea>
				<input type="submit" class="btn btn-primary addsupc form-control" value="Add" style="margin-left:2%;margin-right:2%"/> <span class="message">*Please use semicolon(;) to
					separate multiple SUPC's</span>
			</form>
		</div> 
	
		<div class="txt" style="display:inline;float:left;font-size:20px;width:10%">  OR</div>
		<form class="form-inline" role="form" method="post" action="/PriceSimulator/ajax/saveproducttemp.action" enctype="multipart/form-data">
			<input type="file" name="file" class="btn btn-default btn-file browse form-control" accept=".xlsx" style="width:25%">
			<input type="submit" class="btn btn-primary form-control savetemp" value="Upload"/>
			<a href="/PriceSimulator/Temp/product.xlsx" style="color:#0645AD">Download Template</a>
		</form>

		<div class="report4">
			<div class="bar"></div>
		</div>
	</div>
	<br>
	<br>
	<div style="margin-left: 40%;" id="message">
		<font color='green'></font>
	</div>
	</div>
	<%-- <s:set var="counter" value="1"></s:set> --%>
	<div class="row" style="width: 100%; margin-left: 1%; border: none;">
		<div class="col-sm-12" style="background-color: none;padding-left:10px;">
			<div class="panel panel-default">

				<!-- <div class="dataTable_wrapper"> -->
				<!-- <div class="box-content box-table container"> -->
				<div class="" style="overflow-x: auto;padding:0">
				<table class="productrules table table-bordered dataTable" id=productrules >
					<thead>
						<tr>
							<th class="table_gray hidden">ruleID</th>
							<th class="table_gray">SUPC</th>
							<th class="table_gray">Product Name</th>
							<th class="table_gray">Information</th>
							<th class="table_gray"><div style="width:200px">Cashback Details</div></th>
							<th class="table_gray"><font color="red">*</font>Dates</th>
							<th class="table_gray"><div style="width:150px">Match Competitor</div></th>
							<th class="table_gray">Comment</th>
							<th class="table_gray">Action</th>
							<th class="table_gray">Status</th>
						</tr>
					</thead>
					<tbody>
					<s:iterator value="product" var="prod" status="counter">
						<tr id=<s:property value="#prod.getSupc()"/> >
							<td class="hidden"><span class="ruleId"><s:property value="#prod.getRuleId()"/></span></td>
							<td><s:property value="#prod.getSupc()" /></td>
							<td><s:property value="#prod.getName()" /></td>
							<td>
								<span><b>Competitor(Name:Price:Shipping): </b></span><span class="detailvalue Name" ><s:property value="#prod.getCompetitorName()"/></span><br>
								<span><b>Min VP Seller: </b></span><span class="detailvalue vendorCode"><s:property value="#prod.getVendorCode()"/></span><br>
								<span><b>Seller Override Type: </b></span><span class="detailvalue vendorCodeOverride"><s:property value="#prod.getVendorOverrideType()"/></span><br>
								<span><b>VP: </b></span><span class="hidden TP"><s:property value="#prod.getTransferPrice()" /></span>
								<span class="hidden MarginType"><s:property value="#prod.getMarginType()" /></span>
								<span class="hidden Margin"><s:property value="#prod.getMargin()" /></span> 
								<span class="hidden OverheadCharges"><s:property value="#prod.getOverhead_charges()" /></span> 
								<span class="hidden PaymentCharges"><s:property value="#prod.getPayment_charges()" /></span> 
								<span class="hidden Int_cb_v"><s:property value="#prod.getInt_cb_v()" /></span> 
								<span class="hidden exceptionLowerLimit"><s:property value="#prod.getExceptionLowerLimit()" /></span> 
								<span class="hidden shippingCharges"><s:property value="#prod.getShippingCharges()" /></span> 
								<span class="hidden GM"><s:property value="#prod.getParameterValueFromType(\"GM\")" /></span>
								<span class="VP"><s:property value="#prod.getSellerPrice()" /></span><br>
								<span><b>SP: </b></span><span class="detailvalue SP"><s:property value="#prod.getSellingPrice()" /></span><br>
								<span><b>Inventory: </b></span><span style="width: 60px" class="detailvalue"><s:property value="#prod.getInventory()" /></span><br>
								<span><b>Shipping Charges: </b></span><span class="detailvalue"><s:property value="#prod.getShippingCharges()" /></span><br>
							</td>
							<td>
								<span><b>Offer Price: </b><input class="OP" style="width:110px" onchange="updateData(this)" type="number" step="10" onkeypress="validate(event)"
									value="<s:property value="#prod.getParameterValueFromType(\"OP\")"/>"></span><br><br>
								<span><b>CMPU Limit: </b><input class="CMPU" style="width:110px" type="number" step="10" onkeypress="validate(event)"
									value="<s:property value="#prod.getParameterValueFromType(\"CMPU\")"/>"></span><br><br>
								<span><b>CM%: </b></span><span class="detailvalue CM"><s:property value="#prod.getComputedCm()" /></span><br><br>
								<span><b>CMPU: </b></span><span class="detailvalue CmpuComputed"><s:property value="#prod.getComputedCmpu()" /></span><br>
								<span><b>Seller Funded CB: </b><s:property value="#prod.getInt_cb_v()" /></span><br><br>
								<span><b>Instant Discount%: </b></span><input class="IDP" type="number" step="10" onkeypress="validate(event)"
									value="<s:property value="#prod.getParameterValueFromType(\"IDP\")"/>"><br><br>
								<span><b>Wallet Min Abs: </b></span><input class="WMA" type="number"  step="10" onkeypress="validate(event)"
									value="<s:property value="#prod.getParameterValueFromType(\"WMA\")"/>"><br><br>
							</td>
							<td class="startTime col-sm-5 form-group">
								<span><b>Start Time: </b></span>
								<div style="width: 200px" class='input-group date datetimepicker startTime'>
									<input type='text' class="form-control startTime" value="<s:property value="#prod.getStartTime()"/>" onkeypress="return false;" />
									<span class="input-group-addon"> <span class="glyphicon glyphicon-calendar"> </span> </span>
								</div>
								<span><b>End Time: </b></span>
								<div style="width: 200px" class='input-group date datetimepicker endTime'>
									<input value="<s:property value="#prod.getEndTime()"/>" type='text' class="form-control endTime" onkeypress="return false;" /> 
									<span class="input-group-addon"> <span class="glyphicon glyphicon-calendar"> </span> </span>
								</div>
							</td>
							<td class="form-group">
								<div><center><input type="checkbox" class="matchCompCheckBox" onchange="validateMatchComp(this)"/></center></div><br><br>
								<div class="matchComp">
									<span>CM: <input type="number" class="matchCompCM" style="width:100px;" value="<s:property value="#prod.getParameterValueFromType(\"CM\")"/>" /></span><br><br>
									<span>GM: <input type="number" class="matchCompGM" style="width:100px;" value="<s:property value="#prod.getParameterValueFromType(\"GM\")"/>" /></span><br><br>
									<span>ValueOfX: <input type="number" class="matchCompValueOfX" style="width:70px;" value="<s:property value="#prod.getParameterValueFromType(\"CD\")"/>" /></span><br><br>
									<span>ValueOfXAbs: <input type="number" class="matchCompValueOfXAbs" style="width:50px;" value="<s:property value="#prod.getParameterValueFromType(\"MD\")"/>" /></span>
								</div>
							</td>
							<td>
								<input value="<s:property value="#prod.getComment()"/>" class="comment" name="comment" type="text" maxlength="100">
							</td>
							<td>
								<span class="btn btn-primary updateproduct" onclick="updateProduct(this)">Update</span></td>
							<td>
						</tr>
					</s:iterator>
					</tbody>
				</table>
				</div>
			</div>
		</div>
	</div>
	<p>
	*Note : - <br>

    1. Shipping charges are not included in Offer Price.<br>
    2. CMPU Limit is the min absolute cm limit per unit to be achieved including shipping charges.<br>
    3. CM % is profit/loss achieved including shipping charges.<br>
    4. CMPU is the cm achieved by entered offer price including shipping charges.<br>
    5. Instant Discount % is percent of cashback generated given as insta cashback. Rest % will go in wallet.<br>
    6. Wallet Min abs is min cashback to be given in wallet.<br> 
    7. If walletCB generated as per instant discount % is less than this value, it will go as instant discount. <br>
    <br>

**Note : Exceptions created may not be visible here for setting OP due to following reasons:<br>

    1. Inventory stock out <br>
    2. Seller Rating <br>
    3. Seller not available <br>
	
	</p>
	
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
	
</body>
</html>