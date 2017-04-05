<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet"
	href="/PriceSimulator/CSS/utility/bootstrap.min.css" media="screen" />
<script type="text/javascript" src="/PriceSimulator/JS/ShippingEngineUI/SubcatBrand.js"></script>

</head>
<script type="text/javascript">

function validateSheetSubcatBrand(event) {
	if ($(".SubcatBrandfile").val().length > 0) {
		return true;
	}
	else {
		alert ("Please select a file") ;
		event.preventDefault();
		return false;
	}
}

function validateDeleteSubcatBrand(valU) {
	
	
	if(valU==0){
	var r = confirm("Are you sure you want to delete.");
	if (r == false) {
		requestValid=false;
	   return false;
	}
	else
		{
		requestValid=clientSideValidateSubcatBrandDelete();
		}
	}
	
	if(requestValid==false)
		return false;
	else{
	document.subcatBrandRuleDelete.submit();
	}
	
	
}

function validateSubcatBrand(valU) {
	
	
	if(valU==1)
	{
	requestValid=clientSideValidateSubcatBrandAdd();
	}
	else{
		requestValid=false;
	}

	if(requestValid==false)
		return false;
	else{
	document.subcatBrandRule.submit();
	}
	
}
function clearList(){
	var i=0;
	var combo=document.getElementById('brandIdSBR');
	while(i<combo.length){
		document.getElementById('brandIdSBR').options[i]=null;
	}
}

var brandMapping = {};
function fetchSBBrandList () {
	debugger;
	clearList();
	var subcatName = $(".subcategorySBR").val();
	if (!subcatMapping[subcatName]) {
		alert ("Please enter a valid subcategory");
		return ;
	}
	$(".subcatSBR").val(subcatMapping[subcatName]);
	var subcatId = subcatMapping[subcatName];
	var brandJson = {} ;

	$.ajax({
		type : "POST",
		dataType : 'json',
		async : false,
		url : 'vendorBrandSubcat.action?action=ListBrand&subcategory=' + subcatId ,
		success : function(data) {

			if (data != -1) {
				brandJson.data = data;
				//console.log (jsonObj) ;
			} else {
				alert("Internal Server Error");
			}
		}
	});
	var brandList = [] ;
	for ( i in brandJson.data) {
		var key = Object.getOwnPropertyNames(brandJson.data[i]);
		brandMapping [key] = brandJson.data[i][key] ;
		brandList.push(String(key));
	} 
	
	
	$( "#brandIdSBR" ).autocomplete({
        source: brandList
     });
	
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

function validateSubcatBrandLimit(evt)
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

function clientSideValidateSubcatBrandAdd(){
	var subcat= document.getElementById("subcatSBR");
	var brand= document.getElementById("brandIdSBR");
	var table = document.getElementById("rangeTable");
    var rowCount = table.rows.length;
    var counts = rowCount - 1;
    var i=0;
    var j=0;
    if (subcat.value == null || subcat.value == "") {
		alert("Subcat can not be null.");
		return false;
	}
    if (brand.value == null || brand.value == "") {
		alert("Brand Id can not be null.");
		return false;
	}
    if (counts==0) {
    	alert("Enter atleast one Price Range");
		return false;
    }
    if(counts==1){
    	var MAX = 10000000;
    	var lowerRange1 = document.getElementById("price[0].lowerLimitSBR");
    	if (parseInt(lowerRange1.value) == -1) {
			lowerRange1.value = MAX ;
		}
		var higherRange1 = document.getElementById("price[0].higherLimitSBR");
		if (parseInt(higherRange1.value) == -1) {
			higherRange1.value = MAX ;
		}
		var shipping = document.getElementById("price[0].shipping_chargeSBR");
		if(lowerRange1.value == null || lowerRange1.value == "" || higherRange1.value == null || higherRange1.value == "" || shipping.value == null || shipping.value == ""){
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
    	debugger;
	for (i = 0; i < counts; i++) {
		for (j = counts - 1; j > i; j--) {
			var lowerRange1 = document
					.getElementById("price["+i+"].lowerLimitSBR");
			if (parseInt(lowerRange1.value) == -1) {
				lowerRange1.value = MAX ;
			}
			var higherRange1 = document
					.getElementById("price["+i+"].higherLimitSBR");
			if (parseInt(higherRange1.value) == -1) {
				higherRange1.value = MAX ;
			}
			var lowerRange2 = document
					.getElementById("price["+j+"].lowerLimitSBR");
			if (parseInt(lowerRange2.value) == -1) {
				lowerRange2.value = MAX ;
			}
			var higherRange2 = document
					.getElementById("price["+j+"].higherLimitSBR");
			if (parseInt(higherRange2.value) == -1) {
				higherRange2.value = MAX ;
			}
			var shipping1 = document.getElementById("price["+i+"].shipping_chargeSBR");
			var shipping2 = document.getElementById("price["+j+"].shipping_chargeSBR");
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
			if(parseInt(lowerRange1.value)==parseInt(lowerRange2.value) || parseInt(lowerRange1.value)==parseInt(higherRange2.value) || parseInt(lowerRange2.value)==parseInt(higherRange1.value) || parseInt(higherRange2.value)==parseInt(higherRange1.value)){
				alert("Check the price range");
				return false;
			}
			}
		}
	}
	
}

function validateDelete2(evt)
{
	var theEvent = evt || window.event;
	var key = theEvent.keyCode || theEvent.which;
	if (key == 8 ) {
		theEvent.returnValue = true ;
		return;
	}
	key = String.fromCharCode( key );
	 var regex = /[0-9]|:|\;/;
	if(!regex.test(key))
	{
		theEvent.returnValue = false;
		if(theEvent.preventDefault) theEvent.preventDefault();
	}   
	
}

function clientSideValidateSubcatBrandDelete() {
	var subcatList = document.getElementById("subcatListSBR");
	if (subcatList.value == null || subcatList.value == "") {
		alert("Subcat List can not be null.");
		return false;
	}
	if(subcatList.value.indexOf(";;")!=-1 || subcatList.value.indexOf(":;")!=-1 || subcatList.value.indexOf(";:")!=-1 || subcatList.value.indexOf("::")!=-1){
		alert("Insert proper subcat ids to delete.");
		return false;
	}
	var subcatArray  = subcatList.value.split(";");
	for (var i = 0 ; i < subcatArray.length ; i++) {
		var subcatBrand = subcatArray[i].split (":") ;
		if (subcatBrand [ 0 ] .length > 7 || subcatBrand [ 1 ] .length > 7) {
			alert ("Subcat Id or Brand Id in the list is invalid") ;
			return false;
		}
	}
}
function submit(){
	document.subcatBrandRuleDownload.submit();
}

function fetchExistingRuleSubcatBrand() {
	var subcatName = $(".subcategorySBR").val();
	$(".subcatSBR").val(subcatMapping[subcatName]);
	var subcatId = subcatMapping[subcatName];
	var brandName = $("#brandIdSBR").val();
	$(".brand").val(brandMapping[brandName] );
	var brandId = brandMapping[brandName] ;
	var brandJson = {} ;
	$.ajax({
		type : "POST",
		dataType : 'json',
		async : false,
		url : 'subcatBrandShipping.action?action=fetchSubcatBrandRules&subcat=' + subcatId+"&brand=" + brandId ,
		success : function(data) {

			if (data != -1) {
				$(".ruleList").text ("There are " + data + " rules in Subcat Brand.") ;
				if (data != "0") {
				$(".ruleList").append("You can get the list by clicking <a class='fileLink' href='#''> here </a>");
				$(".fileLink").attr("href","subcatBrandShipping.action?action=fetchSubcatBrandFile&subcat=" + subcatId + '&brand=' + brandId);
				$(".fileLink").removeClass("hidden");
				}
				$(".ruleList").removeClass("hidden");
			} else {
				alert("Internal Server Error");
			}
		}
	});
	

}
</script>
<body>
	<div style="position: absolute; left:250px; top:200px;" class="well">
	<h4 align = "center"><b>Add Subcat-brand-pricepoint rules</b></h4>
	<form action = "subcatBrandShipping.action" method="post" name= "subcatBrandRule">
	<input type="hidden" name="action" value="subcatBrandRule">
	<table class="table">
	<tr>
		<td><label>Subcategory</label></td>
		<td> <input	type="text" name="subcategory" id="subcategorySBR" class="subcategorySBR" onblur="fetchSBBrandList()" />
		<!-- &nbsp;&nbsp;<button type="button" class="btn btn-primary" onclick="fetchSBBrandList()">Get Brand List</button> -->
		</td>
	</tr>		
		<tr class = "hidden">
			<td style="position: relative; top: 3px"><label>Subcat Id</label></td>
			<td><input type="text" name="subcat" id ="subcatSBR" class ="subcatSBR" placeholder="Select Subcategory" readonly="readonly"/></td>
		</tr>
		<tr>
		<td><label>Brand</label></td>
		<td> <input type="text"  class="brandIdSBR" id ="brandIdSBR"  onblur="fetchExistingRuleSubcatBrand()"/></td>
		<td class = "hidden"> <input type="text"  class="brand" id ="brand" name="brand" onblur="fetchExistingRuleSubcatBrand()"/></td>
		 </tr>
	</table>
	<p class="ruleList" > </p>
<!-- 	<button type="button" class="btn btn-primary" onclick="fetchExistingRule()"> Check Existing Rule</button> -->
	<table class="table table-bordered table-condensed" id="rangeTable">
		<tr>
			<th>Lower OP</th>
			<th>Upper OP</th>
			<th>Shipping Cost</th>
		</tr>
		<tr>
			<td><input style="width:100px;"  type="number" name = "price[0].lowerLimit" id="price[0].lowerLimitSBR" onkeypress="validate(event)" /> </td>
			
			<td><input style="width:100px;" type="number" name = "price[0].higherLimit" id="price[0].higherLimitSBR" onkeypress="validateSubcatBrandLimit(event)" /></td>
			
			<td><input style="width:100px;" type="number" name = "price[0].shipping_charge" id="price[0].shipping_chargeSBR" onkeypress="validate(event)" /></td>
<td><button type="button" style="width:50px;" onclick="deleteRowSubcatBrand (1)" class="btn btn-sm btn-danger">X</button> </td>
		</tr>
	</table>
	<input type="button" value ="Add Price Range" onclick="addRow1('rangeTable')"></input>
	<br><br>
	<button type="button" class="btn btn-primary" onclick="validateSubcatBrand(1)">Update</button>
	<p class="message" >Notes**<br>
	   1. File should be uploaded in CSV format.<br>
	   2. For entering INFINITE value in price range , just enter -1 in both UI and file.
	</p>
	</form>
	</div>
	<div style="position: absolute; right:120px; top:470px;" class="well">
	<h4 align = "center"><b>Delete Subcat-brand-pricepoint rules</b></h4>
	<form action="subcatBrandShipping.action" method="POST" name="subcatBrandRuleDelete">
	<input type="hidden" name="action" value="subcatBrandRuleDelete">
	<input name="subcatList" placeholder="SubcatId1:BrandId1;SubcatId2:BrandId2;SubcatId3:BrandId3;" id="subcatListSBR" onkeypress="validateDelete2(event)">
	<button type="button" class="btn btn-primary" onclick="validateDeleteSubcatBrand(0)">Delete</button>
	</form>
	</div>
	<div style="position: absolute; right:40px; top:200px;" class="well">
	<h4 align = "center"><b>Upload Subcat-brand-pricepoint rules</b></h4>
	<form method="post" style="margin-left: 10%;" action="subcatBrandShipping.action" enctype="multipart/form-data">
		<input type="hidden" id="action" name="action" value="subcatBrandRuleSheet"/> 
		<input type="file" name="file" class="btn btn-primary browse SubcatBrandfile" style="display: inline; width: 250px" accept=".csv" /> 
		<br><br><input type="submit"
			style="display: inline" class="savetemp btn btn-primary " value="Upload" onclick="validateSheetSubcatBrand(event)" /> &nbsp;&nbsp; <a
			href="/PriceSimulator/Temp/brandDiscountingTemp.csv"> Download Template</a> <br> <br> 

	</form><br>
	<form action="downloadShippingRules.action" method="POST" name="subcatBrandRuleDownload">
	<input type="hidden" name="action" value="BRAND_PRICE_POINT">
	<button type="button" class="btn btn-primary" onclick="submit()">Download Active Rules</button>
	</form>
	</div>
</body>
</html>