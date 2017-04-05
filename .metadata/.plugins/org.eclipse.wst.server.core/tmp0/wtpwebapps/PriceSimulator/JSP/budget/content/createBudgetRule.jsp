<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/bootstrap.min.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/bootstrap-datetimepicker.min.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/buttons.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/loader.css" media="screen" />

<script type="text/javascript" src="/PriceSimulator/JS/utility/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/utility/loader.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/utility/bootstrap.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.5.1/moment.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.4.0/lang/en-gb.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/utility/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/budget/createBudgetRule.js"></script>
</head>

<body>
	<div class="well well-sm">
	<div id="createPageTitle" style="text-align: center;"><h3><span>Create Monetization Budget Rule</span></h3></div>
	<br>
		<table class="table" style="width: 96%; margin: 10px 2%" id="budgetTable">
			<tbody>
				<tr>
					<td>
						<form action="" method="post">
						<table>
							<tr><th><span>Rule Type</span></th></tr>
							<tr>
								<td>							
									<input type="radio" id="SV"  value="SV" name="ruleTyp" checked="checked" onclick="showSupcBlock()" />Supc Vendor Rule
								&nbsp;&nbsp;&nbsp;
								</td>
								<td>
									<input type="radio" id="VB" value="VB" name="ruleTyp" onclick="showBrandBlock()" />Vendor Brand Rule
								</td>
							</tr>
						</table>
						</form>
					</td>
					<td>
						<form method="post" style="margin-left: 10%;"
							action="/PriceSimulator/budgetRule/createBudgetRule.action?ruleId=<s:property  value="ruleId"/>&ruleType=<s:property  value="ruleType"/>"
							enctype="multipart/form-data" onsubmit="return checkfile(this);">
							<table>
								<th><span>Upload RO/PRO File</span></th>
								<tr>
								<th><input type="file" name="file"
									id="file" class="btn btn-primary browse"
									style="display: inline; width: 250px" accept=".pdf" /> 
								<input type="submit" style="display: inline"
									class="savetemp btn btn-primary " value="Upload" />
									&nbsp;&nbsp;
								<s:if test="isRoFile">
								<a href="/PriceSimulator/budgetRule/createBudgetRule.action?userAction=download&ruleId=<s:property  value="ruleId"/>&ruleType=<s:property  value="ruleType"/>&name=<s:property  value="name"/>">
										Download RO/PRO File</a><label
									style="text-align: center;"> <s:property
											value="%{#session.bulkUploadStatus}" />
								</label>
								</s:if>
								</th>
								</tr>
								<tr>
									<td><label id="fileSuccessInfo">RO/PRO file uploaded successfully.</label></td>
								</tr>
							</table>
						</form>
					</td>
				</tr>
				<!-- Add hidden inputs here -->
				<tr>
					<td><input value="SV" type="hidden" class="ruleType" name="ruleType" ></input></td>
					<td class="ruleId"><input
						type="hidden" name="ruleId" id="ruleId"
						class="ruleId" /></td>
					<td class="status"><input
						type="hidden" name="status" id="status"
						class="status" /></td>
					<td class="fileName"><input
						type="hidden" name="fileName" id="fileName"
						class="fileName" value="<s:property value="fileName" />" /></td>
				</tr>
				
				<tr>
					<td class="name"><font color="red">*</font> <label>Monetization Name</label><input
						type="text" name="name" id="name"
						class="name form-control pull-right" 
						onkeypress="validateString(event)"/></td>
						
					<td class="pro"><font color="red">*</font> <label>RO/PRO Id</label><input
						type="text" name="pro" id="pro"
						class="pro form-control pull-right" 
						onkeypress="validateString(event)"/></td>
				</tr>

				<tr>
						<td class="supc" id="sv" style="display: block"><font color="red">*</font> <label>SUPC</label><input
							type="text" name="supc" id="supc"
							class="supc form-control pull-right" 
							onkeypress="validateNoSpecialCharacter(event)"/></td>
							
						<td class="brand" id="vb" style="display: none"><font color="red">*</font> <label>Brand Id</label><input
							type="text" name="brand" id="brand"
							class="brand form-control pull-right" 
							onkeypress="validateInt(event)" /></td>
												
					<td class="vendor"><font color="red">*</font> <label>Vendor Code List (comma separated)</label><input
						type="text" name="vendor" id="vendor"
						class="vendor form-control pull-right" 
						onkeypress="validateNoSpecialCharacterButComma(event)"/></td>
				</tr>

				<tr>
					<td class="budget"><font color="red">*</font> <label>Budget</label><input
						type="number" name="budget" id="budget" min="1"
						class="budget form-control pull-right" step="1000"
						onkeypress="validateInt(event)" /></td>
				</tr>
				<tr>
					<td class="saleTarget"><font color="red">*</font> <label>Sale Target</label><input
						type="number" name="saleTarget" id="saleTarget"
						class="saleTarget form-control pull-right" step="1000"
						onkeypress="validateInt(event)" /></td>
					<td class="gsvTarget"><font color="red">*</font> <label>GSV Target</label><input
						type="number" name="gsvTarget" id="gsvTarget"
						class="gsvTarget form-control pull-right" step="1000"
						onkeypress="validateInt(event)" /></td>
				</tr>

				<tr><td></td></tr>
				<tr><td></td></tr>
				<tr>
					<td class="startTime"><font color="red">*</font> <label>Start
							Time</label>
						<div class='input-group date datetimepicker startTime pull-right'
							style="width: 57%">
							<input type='text' id="startTime" class="form-control startTime"
								name="startTime" onkeypress="return false;" /> <span
								class="input-group-addon"> <span
								class="glyphicon glyphicon-calendar"> </span>
							</span>
						</div></td>
					<td class="endTime"><font color="red">*</font> <label>End
							Time</label>
						<div class='input-group date datetimepicker endTime pull-right'
							style="width: 52%">
							<input type='text' id="endTime" class="form-control endTime" name="endTime"
								onkeypress="return false;" /> <span class="input-group-addon">
								<span class="glyphicon glyphicon-calendar"> </span>
							</span>
						</div></td>
					<td></td>
				</tr>

				<tr>
					<s:if test="%{#session.mtzBudgetPrivilege == 'write'}">
					<td class="submit">
						<button type="button" style="margin-left: 10px;"
							id="createBudgetRuleButton" class="btn btn-primary action updatesubcat"
							onclick="createBudgetRule(this)">Submit</button>
					</td>
					</s:if>
					<td>
						<div id = "status">
						</div>
					</td>
				</tr>
					
			</tbody>
		</table>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Note: 1. End time must be of the same month as start time. 
		<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		2. Quotes are not allowed in any field.<br>
 	</div>
</body>

<script type="text/javascript">
function checkfile()
{
	var fup = document.getElementById('file');
	var fileName = fup.value;
	var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
	if(ext == "pdf" )
	{
		return true;
	} 
	else
	{
		alert("Upload pdf files only");
		fup.focus();
		return false;
	}
}
</script>

<script type="text/javascript">
	var dateToday = new Date();
	dateToday = dateToday - 86400000;
	$('.datetimepicker.startTime').datetimepicker({

		format : 'YYYY/MM/DD HH:mm:ss',
		orientation : 'top right',
		defaultTime : true,
		minuteStepping : 15,
		minDate : dateToday,
	});
	$('.datetimepicker.endTime').datetimepicker({

		format : 'YYYY/MM/DD HH:mm:ss',
		orientation : 'top right',
		defaultTime : true,
		minDate : dateToday,
	});

	
</script>

<script>
	var ruleId = "<s:property value="ruleId" />";
	if (ruleId == "") {		
		$("#ruleId").attr(("value"), "");
	} else {
		$("#createPageTitle").html("<h3><span>Edit Monetization Budget Rule</span></h3>");
		$("#ruleId").attr(("value"), ruleId);
	}
	
	var status = "<s:property value="status" />";
	if (status == "") {
		$("#status").attr(("status"), "");
	} else {
		$("#status").attr(("value"), status);
		if(status == 7) {
			document.getElementById('name').disabled = true;
			document.getElementById('pro').disabled = true;
			document.getElementById('supc').disabled = true;
			document.getElementById('vendor').disabled = true;
			document.getElementById('brand').disabled = true;
			document.getElementById('startTime').disabled = true;
		}
	}
	
	var ruleType = "<s:property value="ruleType" />";
	if (ruleType == "") {
		$(".ruleType").attr(("value"), "SV");
	} else {
		document.getElementById('SV').disabled = true;
		document.getElementById('VB').disabled = true;
		$(".ruleType").attr(("value"), ruleType);
		if (ruleType == "SV") {
			document.getElementById('SV').checked = true;
			document.getElementById('VB').checked = false;
			showSupcBlock();
		} else {
			document.getElementById('VB').checked = true;
			document.getElementById('SV').checked = false;
			showBrandBlock();
		}
	}

	var name = "<s:property value="name" />";
	if (name == "") {
		$("#name").attr(("value"), "");
	} else {
		$("#name").attr(("value"), name);
	}

	var pro = "<s:property value="pro" />";
	if (pro == "") {
		$("#pro").attr(("value"), "");
	} else {
		$("#pro").attr(("value"), pro);
	}
	
	var supc = "<s:property value="supc" />";
	if (supc == "") {
		$("#supc").attr(("value"), "");
	} else {
		$("#supc").attr(("value"), supc);
	}
	
	var vendor = "<s:property value="vendor" />";
	if (vendor == "") {
		$("#vendor").attr(("value"), "");
	} else {
		$("#vendor").attr(("value"), vendor);
	}
	
	var brand = "<s:property value="brand" />";
	if (brand == "") {
		$("#brand").attr(("value"), "");
	} else {
		$("#brand").attr(("value"), brand);
	}
	
	var budget = "<s:property value="budget" />";
	if (budget == "") {
		$("#budget").attr(("value"), "");
	} else {
		$("#budget").attr(("value"), budget);
	}
	
	var saleTarget = "<s:property value="saleTarget" />";
	if (saleTarget == "") {
		$("#saleTarget").attr(("value"), "");
	} else {
		$("#saleTarget").attr(("value"), saleTarget);
	}
	
	var gsvTarget = "<s:property value="gsvTarget" />";
	if (gsvTarget == "") {
		$("#gsvTarget").attr(("value"), "");
	} else {
		$("#gsvTarget").attr(("value"), gsvTarget);
	}
	
	var startTime = "<s:property value="startTime" />";
	if (startTime == "") {
		$("#startTime").attr(("value"), "");
	} else {
		$("#startTime").attr(("value"), startTime);
	}
	
	var endTime = "<s:property value="endTime" />";
	if (endTime == "") {
		$("#endTime").attr(("value"), "");
	} else {
		$("#endTime").attr(("value"), endTime);
	}
	
	var fileName = "<s:property value="fileName" />";
	if(fileName == "") {
		$("#fileSuccessInfo").hide();
	} else {
		$("#fileSuccessInfo").show();
	}
	
</script>