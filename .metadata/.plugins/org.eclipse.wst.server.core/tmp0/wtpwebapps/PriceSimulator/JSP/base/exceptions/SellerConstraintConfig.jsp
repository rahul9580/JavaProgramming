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
	<script type="text/javascript" src="/PriceSimulator/JS/utility/jquery-1.12.0.min.js"></script>
<title>Snapdeal Price Simulator</title>
<script type="text/javascript">

function change(){
	
	var optionIndex = document.getElementById("jobMasterId").value;
	
	if(optionIndex == "-1"){
		document.getElementById("subcatCmGm").style.display = "none";
		document.getElementById("sellerList").style.display = "none";	
		document.getElementById("uploadStatus").style.display = "none";
		document.getElementById("criticalBrands").style.display = "none";
	}
	else if(optionIndex == "1"){
		document.getElementById("subcatCmGm").style.display = "none";
		document.getElementById("sellerList").style.display = "block";
		document.getElementById("uploadStatus").style.display = "none";
		document.getElementById("criticalBrands").style.display = "none";
	}else if (optionIndex== "2"){
		document.getElementById("subcatCmGm").style.display = "block";
		document.getElementById("sellerList").style.display = "none";
		document.getElementById("uploadStatus").style.display = "none";
		document.getElementById("criticalBrands").style.display = "none";
	}
	else if (optionIndex== "3"){
		document.getElementById("subcatCmGm").style.display = "none";
		document.getElementById("sellerList").style.display = "none";
		document.getElementById("uploadStatus").style.display = "none";
		document.getElementById("criticalBrands").style.display = "block";
	}
}

/* var showForm = function() {
	var allForms = document.getElementsByTagName('form');
	var dropdown = document.getElementById("jobMasterId");
	if (dropdown.value != "-1") {
		var form = document.getElementById(dropdown.value);
		for (var i = 0; i < allForms.length; i++) {
			allForms[i].setAttribute("class", "display-none");
		}
		form.setAttribute("class", "");
	}
} */
</script>

</head>

<div class="header"><%@include file="../../content/menubar.jsp"%></div>
<div class="filter"><%@include
		file="../../content/categoryfilter.jsp"%></div>
<body>
	<br>
	<br>
	<br>
	<h4
		style="  width: 45%;">
	<b>Select File to be uploaded </b>
	</h4>
		<select id="jobMasterId" style="position: relative;left: 100px;" onChange="change()">
			<option value="-1" >Select</option>
			<option  value="1" >SellerList</option>
			<option value="2">Subcat CM/GM/CMPU</option>
			<option value = "3">Critical Brands</option>
		</select>
	 <div class="content sellerList " id = "sellerList" style="display: none" >
		<h4
		style="padding: 10px 0; border-top: 1px solid #efefef; border-bottom: 1px solid #efefef; margin-bottom: 20px; margin-left: 10%; margin-top: 5%; width: 75%;">
		<b>Seller List </b>
	</h4>
		<form method="post" style="margin-left: 10%;" action="/PriceSimulator/exceptions/sellerList.action" enctype="multipart/form-data">
		<input type="hidden" id="fileType" name="fileType" value="sellerList"/> 
		<input type="file" name="file" class="btn btn-primary browse" style="display: inline; width: 250px" accept=".xlsx" /> <input type="submit"
			style="display: inline" class="savetemp btn btn-primary " value="Upload" /> &nbsp;&nbsp; <a
			href="/PriceSimulator/Temp/SellerList.xlsx"> Download Template</a> <br> <br> 

	</form>
	<form style="margin-left: 10%;" action="/PriceSimulator/exceptions/sellerListDelete.action" enctype="multipart/form-data">
	<input type="text" name = "sellerCode" style="display: inline; width: 250px; height : 50px" placeholder="SellerCode1,SellerCode2,SellerCode3" />
	<input type="submit" style="display: inline" class="savetemp btn btn-primary " value="Delete" />
	</form>
	<form style="margin-left: 10%;" action="/PriceSimulator/exceptions/sellerListDownload.action" enctype="multipart/form-data">
	<input type="hidden" id="downloadType" name="downloadType" value="sellers"/> 
	<input type="submit" style="display: inline" class="savetemp btn btn-primary " value="Download Seller List" />
	</form>
	</div>
	<div class="content subcatCmGm " id="subcatCmGm" style="display: none">
		<h4
		style="padding: 10px 0; border-top: 1px solid #efefef; border-bottom: 1px solid #efefef; margin-bottom: 20px; margin-left: 10%; margin-top: 5%; width: 75%;">
		<b>Subcat CM/GM/CMPU Constraint </b>
	</h4>
		<form method="post" style="margin-left: 10%;" action="/PriceSimulator/exceptions/sellerList.action" enctype="multipart/form-data">
		<input type="hidden" id="fileType" name="fileType" value="subcatCmGm"/>
		<input type="file" name="file" class="btn btn-primary browse" style="display: inline; width: 250px" accept=".xlsx" /> <input type="submit"
			style="display: inline" class="savetemp btn btn-primary " value="Upload" /> &nbsp;&nbsp; <a
			href="/PriceSimulator/Temp/Subcat.xlsx"> Download Template</a> <br> <br> 

	</form>
	<form style="margin-left: 10%;" action="/PriceSimulator/exceptions/subcatConstraintDelete.action" enctype="multipart/form-data">
	<input type="text" name = "subcats" style="display: inline; width: 250px; height : 50px" placeholder="SubcatId1,SubcatId2,SubcatId3" />
	<input type="submit" style="display: inline" class="savetemp btn btn-primary " value="Delete" />
	</form>
	<form style="margin-left: 10%;" action="/PriceSimulator/exceptions/sellerListDownload.action" enctype="multipart/form-data">
	<input type="hidden" id="downloadType" name="downloadType" value="subcats"/> 
	<input type="submit" style="display: inline" class="savetemp btn btn-primary " value="Download Subcat Constraints" />
	</form>
	</div>
	
	<div class="content criticalBrands " id="criticalBrands" style="display: none">
		<h4
		style="padding: 10px 0; border-top: 1px solid #efefef; border-bottom: 1px solid #efefef; margin-bottom: 20px; margin-left: 10%; margin-top: 5%; width: 75%;">
		<b>Critical Brands </b>
	</h4>
		<form method="post" style="margin-left: 10%;" action="/PriceSimulator/exceptions/sellerList.action" enctype="multipart/form-data">
		<input type="hidden" id="fileType" name="fileType" value="criticalBrand"/>
		<input type="file" name="file" class="btn btn-primary browse" style="display: inline; width: 250px" accept=".xlsx" /> <input type="submit"
			style="display: inline" class="savetemp btn btn-primary " value="Upload" /> &nbsp;&nbsp; <a
			href="/PriceSimulator/Temp/CriticalBrand.xlsx"> Download Template</a> <br> <br> 

	</form>
	<form style="margin-left: 10%;" action="/PriceSimulator/exceptions/criticalbrandDelete.action" enctype="multipart/form-data">
	<input type="text" name = "brandId" style="display: inline; width: 250px; height : 50px" placeholder="BrandId1,BrandId2,BrandId3" />
	<input type="submit" style="display: inline" class="savetemp btn btn-primary " value="Delete" />
	</form>
	<form style="margin-left: 10%;" action="/PriceSimulator/exceptions/sellerListDownload.action" enctype="multipart/form-data">
	<input type="hidden" id="downloadType" name="downloadType" value="criticalBrand"/> 
	<input type="submit" style="display: inline" class="savetemp btn btn-primary " value="Download Brand Ids" />
	</form>
	</div>
	
		<br> <br>


	<div id="uploadStatus">
		<label>	
	 	 <s:iterator  value="getUploadStatus()" var="status">>
				<s:property value="#status"/><br>
		</s:iterator>
		</label>
	</div>

</body>
</html>

