<%@page import="com.snapdeal.POJO.SellerRightList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link type="text/css" rel="stylesheet"
	href="/PriceSimulator/CSS/utility/bootstrap.min.css" media="screen" />
<link type="text/css" rel="stylesheet"
	href="/PriceSimulator/CSS/base/structure.css" media="screen" />
<title>Snapdeal Price Simulator</title>


<style>
#seller_multiselect, #multiselect, #multiselect_to,
	#seller_multiselect_to {
	width: 300px;
}
</style>
<div class="header"><%@include file="../../content/menubar.jsp"%></div>
<div class="filter"><%@include
		file="../../content/categoryfilter.jsp"%></div>
<%-- <script src="/../JS/content/fetchBrandList.js" type="text/javascript" charset="utf-8"></script> --%>




<script type="text/javascript">
	var request;

	function move(direction, all, type) {

		var src = document.getElementById(type + 'LeftList')
		var trg = document.getElementById(type + 'RightList')
		var tem

		if (direction) {
			tem = src
			src = trg
			trg = tem

			if (all)
				$('#' + type + 'RightList option').prop('selected', true);

		} else {
			if (all)
				$('#' + type + 'LeftList option').prop('selected', true);
		}

		var selected = []

		for ( var i in src.options) {
			if (src.options[i].selected) {
				trg.options.add(new Option(src.options[i].text,
						src.options[i].value));
				trg.options.selected = true;

				selected.unshift(i);
			}
		}

		for (i in selected)
			src.options.remove(selected[i]);
	}

	function fetchSellerList() {

		/* document.getElementById("brandType").disabled = true;
		document.getElementById("sellerType").disabled = true;
		 */
		//alert('fetchBrandList');
		document.getElementById("SellerLeftList").options.length = 0;
		var select = document.getElementById("SellerLeftList");
		option = document.createElement("option");
		option.innerHTML = "Fetching seller list...";
		select.appendChild(option);

		var url;
		url = "fetchData.action?sellerType=all&type=sellers";

		$.ajax({
			type : "GET",
			dataType : 'html',
			url : 'fetchData.action?sellerType=all&type=sellers',
			success : function(data) {

				if (data != -1) {
					$('#SellerLeftList option').each(function(index, option) {
						$(option).remove();
					});

					var list = data.split(";");
					var sellerArray = [];
					var selectobject = document.getElementById("SellerRightList")
					for (var i = 0; i < selectobject.length; i++) {
						try {
							sellerArray.push(selectobject.options[i].value
									.split("_")[0].trim());
						} catch (err) {

						}
					}
					$.each(list, function(idx, obj) {

						if (sellerArray.indexOf(obj.split(":")[1]) == -1) {
							
							var o = new Option(obj.split(":")[0], obj
									.split(":")[1]
									+ '_' + obj.split(":")[0]);
							$(o).html(obj.split(":")[0]);
							$("#SellerLeftList").append(o);
						}
						
						/*  $(".multiselect").prepend($("<option>")
						                           .val(obj.split(":")[1])       // Might have to use .attr("value", i) instead
						                           .html(obj.split(":")[0])); */
					});

				}

			}
		});
	}

	function updateList() {

		var select_to = document.getElementById("multiselect_to");
		//var length_to = select_to.options.length;
		var length_to = 10;
		for (var j = 0; j < length_to; j++) {
			//select_to.options[j] = null;
		}
		//length_to = select_to.options.length;

		for (var j = 0; j < length_to; j++) {
			//select_to.options[j] = null;
		}

		if (request.readyState == 4) {
			if (request.status == 200) {

				document.getElementById("brandType").disabled = false;
				document.getElementById("sellerType").disabled = false;
				document.getElementById("BrandLeftList").options.length = 0;

				var names = request.responseText;

				names = names.split(";");

				//alert("First : "+names[0]);
				if (names[0] != "brandList") {
					alert("Brand List didn't come please try again");
					//fetchBrandList();
				} else {

					//alert("names"+names);
					for (var i = 1; i < names.length - 1; i++) {
						var select = document.getElementById("BrandLeftList"), option = null;
						option = document.createElement("option");

						option.innerHTML = names[i];
						select.appendChild(option);
					}

				}

			}
		}
	}

	
	function setTypeAndSubmit(val) {
		
		$('#SellerRightList option').prop('selected', true);
		
		document.getElementById("type").value = val;
		var value = validate() ;
		if ( value == 0 ) return ;
		document.manageSubcatForm.submit();
	}


	$(document).ready(
			function() {
				var index = document.getElementById("cbOptionTxt").value ;
				if ( !index.localeCompare("0") ) index = "1" ;
				$("#mappedCBOption").prop('selectedIndex',
						index);

			});
</script>
</head>


<body>

	<script type="text/javascript">
		var obj='<%= session.getAttribute("report") %>';
		if(obj!= null && obj!=undefined && obj!='')
			{
			
			if(obj=='Success' || obj=='Some Error Occurred')
		alert('<%= session.getAttribute("report") %>');
			}
		
		
		</script>





	<div id="message" style="margin-left: 35%; color: green">
		<%
			Object object = request.getAttribute("message");

			if (object != null)
				out.println(object);
		%>
	</div>

	<div class="content" style="width: 70%;float:left">


		<form action="manageSubcatConf.action" id="manageSubcatForm"
			name="manageSubcatForm" style="display: block" class="form"
			method="POST" onsubmit="return validate()">

			<br> <br>

			<div class="errors">
				<s:property value="#session.message" />
			</div>


			<div class="errors">
				<%
					String isDeleted = request.getAttribute("isDeleted") != null ? (String) request
							.getAttribute("isDeleted") : null;
				%>
				<%
					if (isDeleted != null && isDeleted.equalsIgnoreCase("0")) {
				%>
				<span style="color: red">This configuration is either
					inactive or deleted. </span>
				<%
					}
				%>
			</div>

			<br> <br> <input type="hidden" id="type" name="type"
				value="1" />


			<table class="table">
				<tr>
					<td><h5><label>Select Big Seller</label> </h5><select id="sellerType"
						name="sellerType" class="form-control"
						onchange="fetchSellerList()" style="width:50%;display:inline">
							<option value="select">--Select--</option>
							<option value="all">All Sellers</option>
					</select></td>
				</tr>

				<tr>
					<td>
						<fieldset class="SelectManyControl_fieldset" style="width:150px">
							<legend class="SelectManyControl_legend">Available
								Seller</legend>
							<select id="SellerLeftList" name="SellerLeftList" size="12"
								multiple="multiple" class="form-control" style="width: 250px">
								<!-- <option value="0">item0</option><option value="2">item2</option><option value="4">item4</option><option value="5">item5</option><option value="6">item6</option><option value="7">item7</option> -->
							</select>
						</fieldset>
					</td>
					<td><br>
					<br>
						<table class="table">
							<tbody>
								<tr>
									<td><input type="button" onclick="move(0,0,'Seller')"
										class="btn btn-primary" value="&gt;" style="width: 35px" /></td>
								</tr>
								<tr>
									<td><input type="button" onclick="move(0,1,'Seller')"
										class="btn btn-primary" value="&gt;&gt;" style="width: 35px" /></td>
								</tr>
								<tr>
									<td><input type="button" onclick="move(1,0,'Seller')"
										class="btn btn-primary" value="&lt;" style="width: 35px" /></td>
								</tr>
								<tr>
									<td><input type="button" onclick="move(1,1,'Seller')"
										class="btn btn-primary" value="&lt;&lt;" style="width: 35px" /></td>
								</tr>
							</tbody>
						</table></td>
					<td>
						<fieldset class="SelectManyControl_fieldset" class="form-group">
							<legend class="SelectManyControl_legend">Selected Seller</legend>
							<select id="SellerRightList" name="SellerRightList" size="12"
								multiple="multiple" class="form-control" style="width: 250px;display:inline">
								<%
									List SellerList = request.getAttribute("SellerList") != null ? (List) request
											.getAttribute("SellerList") : null;
									String sellerRatingFrom = request.getAttribute("sellerRatingFrom") != null ? (String) request
											.getAttribute("sellerRatingFrom") : "";
									String sellerRatingTo = request.getAttribute("sellerRatingTo") != null ? (String) request
											.getAttribute("sellerRatingTo") : "";
									String diffPer = request.getAttribute("diffPer") != null ? (String) request
											.getAttribute("diffPer") : "";
									String nearShip = request.getAttribute("nearShip") != null ? (String) request
											.getAttribute("nearShip") : "";
									
									Integer selectOption = request.getAttribute("mappedCBOption") !=null ? (Integer) request
											.getAttribute("mappedCBOption") : 0;
									String sdPlusSellerRatingFrom = request.getAttribute("sdPlusSellerRatingFrom") != null ? (String) request
											.getAttribute("sdPlusSellerRatingFrom") : "";
									String sdPlusSellerRatingTo = request.getAttribute("sdPlusSellerRatingTo") != null ? (String) request
											.getAttribute("sdPlusSellerRatingTo") : "";
									String instantDiscountPercentage =request.getAttribute("instantDiscountPercentage")  !=null ? (String) request
											.getAttribute("instantDiscountPercentage") : ""; 
									if(instantDiscountPercentage.equals("-1"))
										instantDiscountPercentage="";
									String walletMinAbsolute=  request.getAttribute("walletMinAbsolute") !=null ? (String)request
											.getAttribute("walletMinAbsolute") : "";
									if(walletMinAbsolute.equals("-1"))
										walletMinAbsolute="";
									String walletMinPercentage =  request.getAttribute("walletMinPercentage") !=null ? (String) request
											.getAttribute("walletMinPercentage") : "";
										if(walletMinPercentage.equals("-1"))
											walletMinPercentage="";
									String walletRoundoffModValue =  request.getAttribute("walletRoundOffModValue") !=null ? (String) request
											.getAttribute("walletRoundOffModValue") : "";
										if(walletRoundoffModValue.equals("-1"))
											walletRoundoffModValue="";
									String o2oCMLimit = request.getAttribute("o2oCMLimit") !=null ? (String) request
											.getAttribute("o2oCMLimit") : ""; 
									
									String marketingFeeEnabled = request.getAttribute("marketingFeeEnabled") !=null ? (String) request
													.getAttribute("marketingFeeEnabled") : ""; 
									String tpThresholdPerc = request.getAttribute("tpThresholdPerc") !=null ? (String) request
													.getAttribute("tpThresholdPerc") : "";
									if(tpThresholdPerc.equals("-1"))
										tpThresholdPerc="";
									String tpPenaltyInterval = request.getAttribute("tpPenaltyInterval") !=null ? (String) request
													.getAttribute("tpPenaltyInterval") : "";
									String autoThresholdPerc = request.getAttribute("autoThresholdPerc") !=null ? (String) request
													.getAttribute("autoThresholdPerc") : "";
									if(autoThresholdPerc.equals("-1"))
										autoThresholdPerc="";
									if (SellerList != null) {
										for (int i = 0; i < SellerList.size(); i++) {
											SellerRightList option = (SellerRightList) SellerList
													.get(i);
								%>
								<option
									value="<%=option.getSellerCode() + "_"
							+ option.getSellerName()%>"><%=option.getSellerName()%></option>
								<%
									}
									}
								%>
								<!-- <option value="1">item1</option><option value="3">item3</option> -->
							</select> <input type="hidden" name="wooo" /> <input type="hidden"
								id="cbOptionTxt" value="<%=selectOption %>" />


						</fieldset>
					</td>
				</tr>

			</table>
			<br>
			<div>
				<br> <br>

				<div id="formPart2" style="display: block">
					<table id="Config" class="table">
						 					<tr>
	  						<td><label>SD + Seller Rating From</label></td>
							<td><input type="text" name="sdPlusSellerRatingFrom" type="number" class="form-control" onkeypress="validateInput(event)"
								id="sdPlusSellerRatingFrom" class="decimal"
								value="<%=sdPlusSellerRatingFrom%> " style="width:50%;display:inline" /></td>

							<td>&nbsp;&nbsp;&nbsp;<label>SD + Seller Rating To</label></td>
							<td><input type="text" name="sdPlusSellerRatingTo" class="form-control" type="number" onkeypress="validateInput(event)"
								id="sdPlusSellerRatingTo" class="decimal" style="width:50%;display:inline" value="<%=sdPlusSellerRatingTo%>"></td>
						</tr> 
						<tr>
							<td><label>Seller Rating From</label></td>
							<td><input type="text"
								name="sellerRatingFrom" type="number" class="form-control"
								id="sellerRatingFrom" class="decimal" style="width:50%;display:inline"
								onkeypress="validateInput(event)" value="<%=sellerRatingFrom%>" /></td>
							<td><label>Seller Rating To</label></td>
							<td><input type="text"
								name="sellerRatingTo" type="number"
								onkeypress="validateInput(event)" id="sellerRatingTo" style="width:50%;display:inline"
								class="decimal form-control" value="<%=sellerRatingTo%>" /></td>
						</tr>
						<tr>
							<td><label>SD + differential % </label></td>
							<td><input type="text" name="differential" id="differential" type="number" onkeypress="validateInput(event)"
								class="decimal form-control" style="width:50%;display:inline" value="<%=diffPer%>" /></td>
							
						<tr>
						<td><label>Ship Near Boost %</label></td>
								<td><input type="text"
								name="nearShip" id="nearShip" type="number"
								onkeypress="validateInput(event)" class="decimal form-control" style="width:50%;display:inline"
								value="<%=nearShip%>" /></td>
						</tr>
						<tr>
						<td><label>Instant Discount %</label></td>
								<td><input type="text"
								name="instantDiscountPercentage" id="instantDiscountPercentage"
								type="number" style="width:50%;display:inline" onkeypress="validateInput(event)"
								class="decimal form-control"
								value="<%=instantDiscountPercentage%>" /></td>
						</tr>
						<tr><td><label>Wallet Min Absolute</label></td>
								<td><input type="text"
								name="walletMinAbsolute" style="width:50%;display:inline" id="walletMinAbsolute" type="number"
								onkeypress="validateInput(event)" class="decimal form-control"
								value="<%=walletMinAbsolute%>" /></td>
						</tr>
						<tr>
						<td><label>Wallet Min  %</label></td>
								<td><input type="text"
								name="walletMinPercentage" type="number" style="width:50%;display:inline"
								onkeypress="validateInput(event)" id="walletMinPercentage"
								class="decimal form-control" value="<%=walletMinPercentage%>" /></td>
						</tr>
						<tr>
						<td><label>Wallet Roundoff Mod Value</label></td>
								<td><input type="text"
								name="walletRoundOffModValue" type="number" style="width:50%;display:inline"
								onkeypress="validateInput(event)" id="walletRoundoffModValue"
								class="decimal form-control" value="<%=walletRoundoffModValue%>" /></td>
						</tr>
						<tr>
						<td><label>O2O CM Limit</label></td>
								<td><input type="text"
								name="o2oCMLimit" type="number" style="width:50%;display:inline"
								onkeypress="validateInput(event)" id="o2oCMLimit"
								class="decimal form-control" value="<%=o2oCMLimit%>" /></td>
						</tr>
						<%-- <tr>
								<td>&nbsp;&nbsp;&nbsp;Wallet Mod Round Off</td>
								<td><input type="text" name="walletRoundOffModValue" id="walletRoundOffModValue"
								class="decimal" value="<%=walletModRoundOff%>" /></td>
						</tr>--%>
						<tr><td><label>Marketing Fee Enabled</label></td>
								<td><input type="text"
								name="marketingFeeEnabled" onkeypress="validateInput(event)" id="marketingFeeEnabled" style="width:50%;display:inline"
								class="decimal form-control" value="<%=marketingFeeEnabled%>" /></td>
						</tr> 
							<tr>
						<td><label>TP Threshold Percentage</label></td>
								<td><input type="text"
								name="tpThresholdPerc" type="number" style="width:50%;display:inline"
								onkeypress="validateInput(event)" id="tpThresholdPerc"
								class="decimal form-control" value="<%=tpThresholdPerc%>" /></td>
						</tr>
							<tr>
						<td><label>TP Penalty Interval(In Hrs.)</label></td>
								<td><input type="text"
								name="tpPenaltyInterval" type="number" style="width:50%;display:inline"
								onkeypress="validateIntegerInput(event)" id="tpPenaltyInterval"
								class="decimal form-control" value="<%=tpPenaltyInterval%>" /></td>
						</tr>
							<tr>
						<td><label>Auto Threshold Percentage</label></td>
								<td><input type="text"
								name="autoThresholdPerc" type="number" style="width:50%;display:inline"
								onkeypress="validateInput(event)" id="autoThresholdPerc"
								class="decimal form-control" value="<%=autoThresholdPerc%>" /></td>
						</tr>
						<tr>
							<td><label>OP Decision Rule<br>(Can't beat competition)</label></td>
							<td><select
								required name="mappedCBOption" id="mappedCBOption" style="width:50%;display:inline"
								class="decimal form-control">
							
                                    <option value=""> Select option </option>
									<option value='1'>SP</option>
									<option value='2'>Max of CM, GM, MOP</option>
									<option value='3'>Max of CM=0, GM=0, MOP</option>
							</select>
						
						</tr>
					</table>
					<button class="btn btn-primary" style="margin:8%;margin-top:1%" onclick="setTypeAndSubmit(1);"
						value="Delete">Update
					</button>
					<!-- <button class="btn btn-primary" style="margin:8%;margin-top:1%" onclick="setTypeAndSubmit(0);"
						value="Delete">Delete
					</button> -->
				</div>
			</div>
			<br> <br>
		</form>
		<%
		session.setAttribute("report",""); 
		%>
	</div>
	<script type="text/javascript">
	function validateInput(evt)
	{
		var theEvent = evt || window.event;
		var key = theEvent.keyCode || theEvent.which;
		if (key == 8 ) {
			theEvent.returnValue = true ;
			return;
		}
		key = String.fromCharCode( key );
		 var regex = /[0-9-]|\./;
		if(!regex.test(key))
		{
			theEvent.returnValue = false;
			if(theEvent.preventDefault) theEvent.preventDefault();
		}   
		
	}
	
	function validateIntegerInput(evt)
	{
		var theEvent = evt || window.event;
		var key = theEvent.keyCode || theEvent.which;
		if (key == 8 ) {
			theEvent.returnValue = true ;
			return;
		}
		key = String.fromCharCode( key );
		 var regex = /[0-9-]/;
		if(!regex.test(key))
		{
			theEvent.returnValue = false;
			if(theEvent.preventDefault) theEvent.preventDefault();
		}   
		
	}
	</script>	
</body>
</html>