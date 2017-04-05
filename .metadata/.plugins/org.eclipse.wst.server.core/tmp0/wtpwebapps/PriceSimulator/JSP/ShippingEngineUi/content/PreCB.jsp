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
<title>Shipping Engine</title>


<script type="text/javascript">

function setSubcategoryPreCb() {
	var subcatName = $(".subcategoryPreCb").val();
	$(".subcatPreCB").val(subcatMapping[subcatName]);
	fetchExistingRulePreCb();
}

function fetchExistingRulePreCb() {
	var subcatName = $(".subcategoryPreCb").val();
	var subcatId = subcatMapping[subcatName];
	if (subcatId.length === 0) {
		return ;
	}
	$.ajax({
		type : "POST",
		dataType : 'json',
		async : false,
		url : 'preCBShipping.action?action=fetchPreCbRules&subcat=' + subcatId ,
		success : function(data) {

			if (data != -1) {
				$(".ruleList").text ("There are " + data + " Pre Cb rules in this Subcategory.") ;
				if (data != "0") {
				$(".ruleList").append("You can get the list by clicking <a class='fileLink' href='#''> here </a>");
				$(".fileLink").attr("href","preCBShipping.action?action=fetchPreCbFile&subcat=" + subcatId);
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

function validateDeletePreCB(valU) {
	
	
	if(valU==0){
	var r = confirm("Are you sure you want to delete.");
	if (r == false) {
		requestValid=false;
	   return false;
	}
	else
		{
		requestValid=clientSideValidatePreCBDelete();
		}
	}
	
	if(requestValid==false)
		return false;
	else{
	document.preCBRuleDelete.submit();
	}
	
	
}

function validatePreCB(valU) {
	
	
	if(valU==1)
	{
	requestValid=clientSideValidatePreCBAdd();
	}
	else{
		requestValid=false;
	}

	if(requestValid==false)
		return false;
	else{
	document.preCBRule.submit();
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

function validate(evt)
{
	var theEvent = evt || window.event;
	var key = theEvent.keyCode || theEvent.which;
	if (key == 8 ) {
		theEvent.returnValue = true ;
		return;
	}
	key = String.fromCharCode( key );
	 var regex = /[0-9]|\./;
	if(!regex.test(key))
	{
		theEvent.returnValue = false;
		if(theEvent.preventDefault) theEvent.preventDefault();
	}   
	
}

function clientSideValidatePreCBAdd(){
	debugger;
	var subcat= document.getElementById("subcatPreCB");
	var marginValue=document.getElementById("marginValue");
	if(subcat.value==null || subcat.value==""){
		alert("Subcat can not be null.");
		return false;
	}
	if(marginValue.value==null || marginValue.value==""){
		alert("Margin Value can not be null.");
		return false;
	}
}

function clientSideValidatePreCBDelete(){
	var subcatList= document.getElementById("subcatListPreCB");
	if(subcatList.value==null || subcatList.value==""){
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


function submit(){
	document.preCBRuleDownload.submit();
}

function validateSheetPreCB(event) {
	if ($(".preCBFile").val().length > 0) {
		return true;
	}
	else {
		alert ("Please select a file") ;
		event.preventDefault();
		return false;
	}
}


</script>
</head>
<body>
	<div style="position: absolute; left:250px; top:200px; right:500px" class="well">
	<h4 align = "center"><b>Add PreCB Margin targets</b></h4>
	<form action="preCBShipping.action" name="preCBRule">
	<input type="hidden" name="action" value="preCBRule">
	<table class="table">
		<tr>
			<td>
				<label>Subcategory</label>
			</td>
			<td>
				<input	type="text" name="subcategory" id="subcategoryPreCb" class="subcategoryPreCb"  placeholder="Select Subcategory" onblur="setSubcategoryPreCb()"/>
			</td>
		</tr><br>
		
		<tr>
			<td><input type="text" name="subcat" id = "subcatPreCB"  class="subcatPreCB hidden" readonly="readonly"/>
			</td>
		</tr>
			
		<tr>
			
			<td class="radioBox"><label>Margin Type</label></td>
			<td>
				
            	<input type="radio" name="marginType" checked="checked" id="marginType" class="CM" value="CM" />
    			CM
       			<input type="radio" name="marginType" id="marginType" class="GM" value="GM"/>
       			GM
       			<input type="radio" name="marginType" id="marginType" class="CMPU" value="CMPU"/>CMPU
       		</td>
       	</tr>
       	
       	<tr>	
       		<td><label>Margin Value</label></td>
       		<td><input name="marginValue" id="marginValue" onkeypress="validate(event)" /></td>
		</tr>
	</table>
	<p class="ruleList" > </p>
	<button type="button" class="btn btn-primary" onclick="validatePreCB(1)">Update</button>
	</form>
	</div>
	<div style="position: absolute; right:160px; top:450px;" class="well">
	<h4 align = "center"><b>Delete PreCB Margin targets</b></h4>
	<form action="preCBShipping.action" method="POST" name="preCBRuleDelete">
	<input type="hidden" name="action" value="preCBRuleDelete">
	<input name="subcatList" placeholder="SubcatId1;SubcatId2;SubcatId3;" id="subcatListPreCB" onkeypress="validateDelete(event)">
	<button type="button" class="btn btn-primary" onclick="validateDeletePreCB(0)">Delete</button>
	</form>
	</div>
	<p style="position: absolute; left:250px; top:550px;">Notes**<br>
	   1. File should be uploaded in CSV format.
	</p>
	<div style="position: absolute; right:150px; top:200px;" class="well">
	<h4 align = "center"><b>Upload PreCB Margin targets</b></h4>
	<form method="post" style="margin-left: 5%;" action="preCBShipping.action" enctype="multipart/form-data">
		<input type="hidden" id="action" name="action" value="preCBRuleSheet"/> 
		<input type="file" name="file" class="btn btn-primary browse preCBFile" style="display: inline; width: 250px" accept=".csv" />
		<br><br> <input type="submit"
			style="display: inline" class="savetemp btn btn-primary " value="Upload" onclick="validateSheetPreCB(event)"/> &nbsp;&nbsp; <a
			href="/PriceSimulator/Temp/PreCBSample.csv"> Download Template</a> <br> <br> 

	</form>
	<form action="downloadShippingRules.action" method="POST" name="preCBRuleDownload">
	<input type="hidden" name="action" value="PRE_CB_MARGIN">
	<button type="button" class="btn btn-primary" onclick="submit()">Download Active Rules</button>
	</form>
	</div>
</body>
</html>