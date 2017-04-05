<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
      <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
      <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
      <!-- Javascript -->
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
/* html { overflow-y: scroll; } */
      </style>
 <script type="text/javascript" src="/PriceSimulator/JS/ShippingEngineUI/vendorBrandSubcat.js" type="text/javascript" charset="utf-8"></script> 
<script type="text/javascript">
function validateSheetVendorBrand(event) {
	if ($(".vendorBrandFile").val().length > 0) {
		return true;
	}
	else {
		alert ("Please select a file") ;
		event.preventDefault();
		return false;
	}
}

function fetchExistingRuleVendorBrandSubcat() {
	var subcatName = $(".subcategory").val();
	$(".subcatId").val(subcatMapping[subcatName]);
	var subcatId = subcatMapping[subcatName];
	var brandName = $("#brandIdVBS").val();
	$(".brandId").val(brandMapping[brandName] );
	var brandId = brandMapping[brandName] ;
	var brandJson = {} ;
	$.ajax({
		type : "POST",
		dataType : 'json',
		async : false,
		url : 'vendorBrandSubcat.action?action=fetchVendorBrandSubcatRules&subcategory=' + subcatId+"&brand=" + brandId ,
		success : function(data) {

			if (data != -1) {
				$(".ruleList").text ("There are " + data + " rules in Subcat Brand.") ;
				if (data != "0") {
				$(".ruleList").append("You can get the list by clicking <a class='fileLink' href='#''> here </a>");
				$(".fileLink").attr("href","vendorBrandSubcat.action?action=fetchVendorBrandSubcatRuleFile&subcategory=" + subcatId + '&brand=' + brandId);
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
<title>Shipping Engine</title>
</head>
<body style="overflow-y: scroll;">
	<br>
	<br>
	<div class="well" style="position:relative;bottom:5%;right:-1%;width:60%;height:60%;">
	<form class="UIForm" action="vendorBrandSubcat.action">
		<div>
		<h4 align = "center"><b>Add/Delete Vendor Brand Subcat Rule</b></h4>
		<input name="action" class="action hidden" value="ADD">
		<input class="subcatId hidden" name="subcategory"/>
		<input class="brandId hidden" name="brand"/>
		<label>Subcategory</label> <input
					type="text" id="subcategory" class="subcategory" onblur = "fetchBrandListVendorBrand()" placeholder="Select Subcat"/>
		<!-- <button type="button" class="btn btn-primary" onclick="fetchBrandListVendorBrand()">Get Brand List</button> -->
		</div>
		<br>
		<div>
		<label>Brand</label></td>
		<input type="text"  class="brandIdVBS" id ="brandIdVBS" onblur = "fetchSellerList()" placeholder="Select Brand" /> <!-- <button type="button" class="btn btn-primary" onclick="fetchSellerList()">Get Seller List</button> -->
		</div>
		<div>
		<p class="ruleList" > </p>
		<table style="position: relative;left: 30px;">

		<td>
			<br>
			<label> <font size="2">Available Seller</font> </label>
			<br>&nbsp;&nbsp;&nbsp;
			<div>
			<select id="SellerLeftList"  style="width:260px;height:260px;float:left;"  multiple>
			</select>
			</div>
		</td>
							<td><br>
					<br>
						<table class="table">
							<tbody>
								<tr>
									<td><input type="button" onclick="move(1,0)"
										class="btn btn-primary" value="&gt;" style="width: 35px" /></td>
								</tr>
								<tr>
									<td><input type="button" onclick="move(1,1)"
										class="btn btn-primary" value="&gt;&gt;" style="width: 35px" /></td>
								</tr>
								<tr>
									<td><input type="button" onclick="move(0,0)"
										class="btn btn-primary" value="&lt;" style="width: 35px" /></td>
								</tr>
								<tr>
									<td><input type="button" onclick="move(0,1)"
										class="btn btn-primary" value="&lt;&lt;" style="width: 35px" /></td>
								</tr>
							</tbody>
						</table></td>
		<td>
			<br>
			<label> <font size="2">Selected Seller</font> </label>
			<br>
			<div>
			<select id="SellerRightList" name="vendor"  style="width:260px;height:260px;"   multiple>
			</select>
			</div>
		</td>
	</table>
		</div>
		<br>


		<label for="shippingCharge">Shipping Charge</label>
    <input  type="text" style="width:200px;" class="form-control" id="shippingCharge" class="shippingCharge" name="shippingCharge" onkeydown='return (event.which >= 48 && event.which <= 57) 
   || event.which == 8 || event.which == 46' placeholder="Enter Shipping Charges....">

<!-- 		<label for="requestedBy">Requested By</label>
    <input  type="text" style="width:200px;" class="form-control" id="requestedBy" class="requestedBy" name="requestedBy"> 
		
	
		<label for="approvedBy">Approved By</label>
    <input  type="text" style="width:200px;" class="form-control" id="approvedBy" class="approvedBy" name="approvedBy" >  -->
		<br>
		<button type="button" class="btn btn-primary" onclick="handleAddEvent()">Add</button>
		<button type="button" class="btn btn-primary" onclick="handleDeleteEvent()">Delete</button>
		<br>
		<br>
		<p class="message" >Notes**<br>
	   1. File should be uploaded in CSV format.<br>
	</p>
	</form>
	</div>
	<div class="well" style="position:fixed;bottom:35%;right:1%;width:25%;height:40%;">
	    <form  method="post" action="vendorBrandSubcat.action" enctype="multipart/form-data">
	    <h4 align = "center"><b>BulkUpload Vendor Brand Subcat Rule</b></h4>
      	<input name="action" class="hidden" value="BULKUPLOAD">
        <input type="file" name="file" class="btn btn-default browse vendorBrandFile" style="display: inline; width: 95%" accept=".csv" /><br><br> <input type="submit"
            style="display: inline" class="savetemp btn btn-primary " value="Upload" onclick="validateSheetVendorBrand(event)" /> &nbsp;&nbsp; <a
            href="/PriceSimulator/Temp/vendor_brand_subcat_sample.csv"> Download Template</a> 
        
    </form>
    <br>
     <form method="get"
		action="downloadShippingRules.action" enctype="multipart/form-data">
		<input class="hidden" name="action" value="VENDOR_BRAND">
		<button type="submit" class="btn btn-primary">Download Rules</button>		
 	</form>
    </div>
     

</body>
</html>