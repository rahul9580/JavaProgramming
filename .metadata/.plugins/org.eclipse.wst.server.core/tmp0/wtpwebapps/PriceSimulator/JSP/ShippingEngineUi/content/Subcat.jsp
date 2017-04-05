<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet"
	href="/PriceSimulator/CSS/utility/bootstrap.min.css" media="screen" />
<link href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
      <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
      <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/ShippingEngineUI/subcat.js"></script>
<style type="text/css">
     .autocomplete-suggestions { border: 1px solid #999; background: #fff; cursor: default; overflow: auto; }
.autocomplete-suggestion { padding: 10px 5px; font-size: 1.2em; white-space: nowrap; overflow: hidden; }
.autocomplete-selected { background: #f0f0f0; }
.autocomplete-suggestions strong { font-weight: normal; color: #3399ff; }

.ui-menu .ui-menu-item a.ui-corner-all:hover, .ui-menu .ui-menu-item a.ui-corner-all:focus, .ui-menu .ui-menu-item a.ui-corner-all:active {
    background:#ffffff;
    color:black;
    border-radius:0;
}

      </style>
<script type="text/javascript">

$( document ).ready(function() {
	var obj="<%=session.getAttribute("report")%>";

	if(obj!=null &&  obj.startsWith("Email will be sent regarding")){
		var obj1=obj.replace(/#/g, '\n');
		alert(obj1);
		obj1 = "";
		obj = "";
		<%session.setAttribute("report",  "");%>;
	}
});


function setSubcategory() {
	var subcatName = $(".subcategorySR").val();
	$(".subcatSR").val(subcatMapping[subcatName]);
	fetchExistingRule();
}

function fetchExistingSubcatRule() {
	var subcatName = $(".subcategorySR").val();
	var subcatId = subcatMapping[subcatName];
	$(".subcatSR").val(subcatMapping[subcatName]);
	if (subcatId.length === 0) {
		return ;
	}
	$.ajax({
		type : "POST",
		dataType : 'json',
		async : false,
		url : 'subcatShipping.action?action=fetchSubcatRules&subcat=' + subcatId ,
		success : function(data) {

			if (data != -1) {
				$(".ruleList").text ("There are " + data + " rules in this Subcategory.") ;
				if (data != "0") {
				$(".ruleList").append("You can get the list by clicking <a class='fileLink' href='#''> here </a>");
				$(".fileLink").attr("href","subcatShipping.action?action=fetchSubcatRuleFile&subcat=" + subcatId);
				$(".fileLink").removeClass("hidden");
				}
				$(".ruleList").removeClass("hidden");
			}	
			
				
				
			 else {
				alert("Internal Server Error");
			}
		}
	});
	
}
function validateDeleteSubcat(valU) {
	
	
	if(valU==0){
	var r = confirm("Are you sure you want to delete.");
	if (r == false) {
		requestValid=false;
	   return false;
	}
	else
		{
		requestValid=clientSideValidateSubcatDelete();
		}
	}
	
	if(requestValid==false)
		return false;
	else{
	document.subcatRuleDelete.submit();
	}
	
	
}

function validateSubcat(valU) {
	
	debugger;
	if(valU==1)
	{
	requestValid=clientSideValidateSubcatAdd();
	}
	else{
		requestValid=false;
	}

	if(requestValid==false)
		return false;
	else{
	document.subcatRule.submit();
	}
	
}
function submit(){
	document.subcatRuleDownload.submit();
}
function validateSubcatLimit(evt)
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

function validate(evt)
{
	var theEvent = evt || window.event;
	var key = theEvent.keyCode || theEvent.which;
	if (key == 8 ) {
		theEvent.returnValue = true ;
		return;
	}
	key = String.fromCharCode( key );
	 var regex = /[0-9]/;
	if(!regex.test(key))
	{
		theEvent.returnValue = false;
		if(theEvent.preventDefault) theEvent.preventDefault();
	}   
	
}

function validateDelete(evt)
{
	var theEvent = evt || window.event;
	var key = theEvent.keyCode || theEvent.which;
	if (key == 8 ) {
		theEvent.returnValue = true ;
		return;
	}
	key = String.fromCharCode( key );
	 var regex = /[0-9]|\;/;
	if(!regex.test(key))
	{
		theEvent.returnValue = false;
		if(theEvent.preventDefault) theEvent.preventDefault();
	}   
	
}

function clientSideValidateSubcatAdd(){
	debugger;
	var subcat= document.getElementById("subcategorySR");
	debugger;
	var subcatName = $(".subcategorySR").val();
	$(".subcatSR").val(subcatMapping[subcatName]);
	var table = document.getElementById("rangeTable1");
	var table = $("#rangeTable1") ;
    var rowCount = $('#rangeTable1 tr').length;
    var counts = rowCount - 1;
    var i=0;
    var j=0;
    if (subcat.value == null || subcat.value == "") {
		alert("Subcat can not be null.");
		return false;
	}
    if(counts==1){
    	var MAX = 10000000;
    	var lowerRange1 = document.getElementById("price[0].lowerLimitSR");
    	if (parseInt(lowerRange1.value) == -1) {
			lowerRange1.value = MAX ;
		}
		var higherRange1 = document.getElementById("price[0].higherLimitSR");
		if (parseInt(higherRange1.value) == -1) {
			higherRange1.value = MAX ;
		}
		var shipping1 = document.getElementById("price["+i+"].shipping_chargeSR");
		if(lowerRange1.value == null || lowerRange1.value == "" || higherRange1.value == null || higherRange1.value == "" || shipping1.value == null || shipping1.value == ""){
			alert("Price Range can not be null");
			return false;
		}
		if(parseInt(lowerRange1.value) >= parseInt(higherRange1.value)){
			alert("Check the price range");
			return false;
		}
    }
    else{
    var MAX = 10000000;
	for (i = 0; i < counts; i++) {
		debugger;
		for (j = counts - 1; j > i; j--) {
			var lowerRange1 = document
					.getElementById("price["+i+"].lowerLimitSR");
			if (parseInt(lowerRange1.value) == -1) {
				lowerRange1.value = MAX ;
			}
			var higherRange1 = document
					.getElementById("price["+i+"].higherLimitSR");
			if (parseInt(higherRange1.value) == -1) {
				higherRange1.value = MAX ;
			}
			var lowerRange2 = document
					.getElementById("price["+j+"].lowerLimitSR");
			if (parseInt(lowerRange2.value) == -1) {
				lowerRange2.value = MAX ;
			}
			var higherRange2 = document
					.getElementById("price["+j+"].higherLimitSR");
			if (parseInt(higherRange2.value) == -1) {
				higherRange2.value = MAX ;
			}
			var shipping1 = document.getElementById("price["+i+"].shipping_chargeSR");
			var shipping2 = document.getElementById("price["+j+"].shipping_chargeSR");
			if(parseInt(lowerRange1.value) >= parseInt(higherRange1.value)){
				alert("Check the price range");
				return false;
			}
			if(parseInt(lowerRange2.value) >= parseInt(higherRange2.value)){
				alert("Check the price range");
				return false;
			}
			if(lowerRange1.value == null || lowerRange1.value == "" || lowerRange2.value == null || lowerRange2.value == "" || higherRange1.value == null || higherRange1.value == "" || higherRange2.value == null || higherRange2.value == "" || shipping1.value == ""|| shipping1.value == null || shipping2.value == null || shipping2.value == ""){
				alert("Price Range can not be null");
				return false;
			}
			if((parseInt(lowerRange1.value)<parseInt(lowerRange2.value) && parseInt(lowerRange2.value)<parseInt(higherRange1.value)) ||  (parseInt(lowerRange1.value)<parseInt(higherRange2.value) && parseInt(higherRange2.value)<parseInt(higherRange1.value))){
				alert("Check the price range");
				return false;
			}
			if(parseInt(lowerRange1.value)==parseInt(lowerRange2.value) || parseInt(lowerRange1.value)==parseInt(higherRange1.value) || parseInt(lowerRange2.value)==parseInt(higherRange2.value) || parseInt(lowerRange1.value)==parseInt(higherRange2.value) || parseInt(lowerRange2.value)==parseInt(higherRange1.value) || parseInt(higherRange2.value)==parseInt(higherRange1.value)){
				alert("Check the price range");
				return false;
			}
			}
		}
	}
	
}

function clientSideValidateSubcatDelete() {
	var subcatList = document.getElementById("subcatListSR");
	if (subcatList.value == null || subcatList.value == "") {
		alert("Subcat List can not be null.");
		return false;
	}
	if(subcatList.value.indexOf(";;")!=-1){
		alert("Insert proper subcat ids to delete.");
		return false;
	}
	var subcatArray  = subcatList.value.split(";");
	for (var i = 0 ; i < subcatArray.length ; i++) {
		if (subcatArray [ i ] .length > 7) {
			alert ("Subcat Id in the list is invalid") ;
			return false;
		}
	}
}

function checkValue() {
	alert($(this).parent().val()) ;
}

function validateSheetSubcat(event) {
	if ($(".subcat").val().length > 0) {
		return true;
	}
	else {
		alert ("Please select a file") ;
		event.preventDefault();
		return false;
	}
}

</script>
<title>Shipping Engine</title>
</head>
<body>
	<div style="position: absolute; left:250px; top:130px;" class="well">
	<h4 align = "center"><label>Add Subcat rules</label></h4>
	<form action="subcatShipping.action" method="POST" name="subcatRule">
	<input type="hidden" name="action" value="subcatRule">
	<table class="table">
	<tr>
	<td><label>Subcategory</label></td>
	<td> 
			<input	type="text" name="subcategory" id="subcategorySR" class="subcategorySR" onblur="fetchExistingSubcatRule()" placeholder="Select Subcategory"/>
	</td>
	</tr>
	<br>
		<tr>
			<td><input type="text" name="subcat" id ="subcatSR" class="subcatSR hidden" readonly="readonly"/></td>
		</tr>
	</table>
	<p class="ruleList" > </p>
	<table class="table"id="rangeTable1" style="width:500px;">
		<thead>
			<th>Lower OP</th>
			<th>Upper OP</th>
			<th>Shipping Cost</th>
			<th></th>
		</thead>
		<tbody>
		<tr>
			<td><input style="width:100px;" type="number" name = "price[0].lowerLimit" id="price[0].lowerLimitSR" onkeypress="validate(event)" /></td>
			
			<td><input style="width:100px;" type="number" name = "price[0].higherLimit" id="price[0].higherLimitSR" onkeypress="validateSubcatLimit(event)" /></td>
			
			<td><input style="width:100px;" type="number" name = "price[0].shipping_charge" id="price[0].shipping_chargeSR" onkeypress="validate(event)"  /></td>
			
			<td><button  type="button" style="width:50px;" onclick="deleteRow (1)" class="btn btn-sm btn-danger">X</button> </td>
		
		</tr>
		</tbody>
	</table>
	<input type="button" value ="Add Price Range" onclick="addRow('rangeTable1')"></input><br><br>
	<button type="button" class="btn btn-primary" onclick="validateSubcat(1)">Update</button>
	<p class="message" >Notes**<br>
	   1. File should be uploaded in CSV format.<br>
	   2. For entering INFINITE value in price range , just enter -1 in both UI and file.
	</p>
	</form>

	</div>
	<div style="position: absolute; right:80px; top:500px;width:30%"  class="well">
	<h4 align = "center"><label>Delete Subcat Rules</label></h4>
	<form action="subcatShipping.action" method="POST" name="subcatRuleDelete">
	<input type="hidden" name="action" value="subcatRuleDelete">
	<input name="subcatList" placeholder="SubcatId1;SubcatId2;SubcatId3;" id="subcatListSR" onkeypress="validateDelete(event)">
	<button type="button" class="btn btn-primary" onclick="validateDeleteSubcat(0)">Delete</button>
	</form>
	</div>
	<div style="position: absolute; right:80px; top:130px;width:30%"  class="well">
	<h4 align = "center"><label>Upload Subcat rules</label></h4>
	<form method="post" style="margin-left: 5%;" action="subcatShipping.action" enctype="multipart/form-data">
		<input type="hidden" id="action" name="action" value="subcatRuleSheet"/> 
		<input type="file" name="file" class="btn btn-primary browse subcat" style="display: inline; width: 250px" accept=".csv" /> <br><br> <input type="submit"
			style="display: inline" class="savetemp btn btn-primary " value="Upload" onclick="validateSheetSubcat(event)" />  <a
			href="/PriceSimulator/Temp/SubcatRuleSample.csv"> Download Template</a> <br> <br> 

	</form><br>
	<form action="downloadShippingRules.action" method="POST" name="subcatRuleDownload">
	<input type="hidden" name="action" value="SUBCAT">
	<button type="button" class="btn btn-primary" onclick="submit()">Download Active Rules</button>
	</form>

	</div>
</body>
</html>