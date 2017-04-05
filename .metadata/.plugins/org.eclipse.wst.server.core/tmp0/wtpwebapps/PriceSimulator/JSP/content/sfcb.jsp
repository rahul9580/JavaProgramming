<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/bootstrap.min.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/base/structure.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/content/rules/homepage.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/buttons.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/loader.css" media="screen" />
<!-- MetisMenu CSS -->
<link href="/PriceSimulator/CSS/content/summary/metisMenu.min.css" rel="stylesheet" />
<link href="/PriceSimulator/CSS/content/summary/dataTables.responsive.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="/PriceSimulator/CSS/content/summary/sb-admin-2.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="/PriceSimulator/CSS/content/summary/font-awesome.min.css" rel="stylesheet" type="text/css">

<script src="/PriceSimulator/JS/utility/jquery-1.12.0.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/PriceSimulator/JS/utility/bootstrap.min.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/utility/loader.js"></script>
<script src="/PriceSimulator/JS/content/summary/metisMenu.min.js"></script>
<script>

function change()
{	
	var selectedoption = document.getElementById("sfcb").value;
	if(selectedoption == "-1"){
        document.getElementById("vbs").style.display = "none";
        document.getElementById("sellerSupc").style.display = "none";    
    }
	if(selectedoption == "2"){
        document.getElementById("vbs").style.display = "block";
        document.getElementById("sellerSupc").style.display = "none";    
    }
	if(selectedoption == "3"){
        document.getElementById("vbs").style.display = "none";
        document.getElementById("sellerSupc").style.display = "block";    
    }
}
	

var obj='<%=session.getAttribute("report")%>';
if(obj!= null && obj!=undefined && obj!='')
	if(obj=='Sending SFCB file to your mail id. Please check your inbox')
		alert('<%=session.getAttribute("report")%>');
</script>
</script>		
<title>Snapdeal Price Simulator</title>
</head>

<body>
<div class="header"><%@include file="/JSP/content/menubar.jsp"%></div>
<div class="filter"><%@include
		file="/JSP/content/categoryfilter.jsp"%></div> 
	<br>
	<br>
	<br>
	<select name="sfcb" id="sfcb" style="position: relative;left: 100px;" onChange="change()">
		<option value = "-1">Select</option>
		<option value = "2">VBS</option>
		<option value = "3">Seller Supc</option>
		
	</select>
	<br>
	<br>
	<div id="vbs" class="vbs" style="position: relative;left: 100px; display: none">
		<form method="post" action="/PriceSimulator/exceptions/uploadSFCB.action" enctype="multipart/form-data">
			<input type="file" name="file" class="btn btn-primary browse" style="display: inline; width: 250px" accept=".csv" />
			<input type="submit" style="display: inline" class="savetemp btn btn-primary " id="addvbs" name="sfcbId" value="UploadVBS" /> 
			&nbsp;&nbsp; 
			<input type="submit" style="display: inline" class="savetemp btn btn-primary " id="deletevbs" name="sfcbId" value="DeleteVBS" onclick="return confirm('Are you sure you want to delete?');"/> 
			&nbsp;&nbsp; 
			
		</form>
		<a href="/PriceSimulator/exceptions/DownloadSFCB.action?sfcbId=DownloadVBS"><br> <br> <span class="btn btn-primary downtemp"><span>Send VBS dump on mail </span></a>
			&nbsp;&nbsp; 
			<br>
			<label>*Note: VBS DB Dump attached on mail will be in .CSV format.</label>
		<a href="/PriceSimulator/Temp/VendorBrandSubcatAddition.csv"><br> <br> <span class="btn btn-primary downtemp">Download <span>VBS Upload Template</span></a>
			&nbsp;&nbsp; 
		<a href="/PriceSimulator/Temp/DeleteVBS.csv"> <span class="btn btn-primary downtemp">Download <span>VBS Delete Template</span></a>
			<br><br>
	</div>
	<div id="sellerSupc" class="sellerSupc" style="position: relative;left: 100px; display: none">
		<form method="post" action="/PriceSimulator/exceptions/uploadSFCB.action" enctype="multipart/form-data">
			<input type="file" name="file" class="btn btn-primary browse" style="display: inline; width: 250px" accept=".csv" />
			<input type="submit" style="display: inline" class="savetemp btn btn-primary " id="addss" name="sfcbId" value="UploadSellerSUPC" /> 
			&nbsp;&nbsp;
			<input type="submit" style="display: inline" class="savetemp btn btn-primary " id="deletess" name="sfcbId" value="DeleteSellerSUPC" onclick="return confirm('Are you sure you want to delete?');"/> 
			&nbsp;&nbsp; 
		</form>
		<a href="/PriceSimulator/exceptions/DownloadSFCB.action?sfcbId=DownloadSellerSupc"><br> <br> <span class="btn btn-primary downtemp"><span>Send SellerSupc DB Dump on Mail</span></a>
			&nbsp;&nbsp; 
			<br>
			<label>*Note: Seller SUPC DB Dump attached on mail will be in .CSV format.</label>
		<a href="/PriceSimulator/Temp/SellerSupcAddition.csv"><br> <br> <span class="btn btn-primary downtemp">Download <span>SellerSupc Upload Template</span></a>
			&nbsp;&nbsp; 
		<a href="/PriceSimulator/Temp/DeleteSellerSupc.csv"> <span class="btn btn-primary downtemp">Download <span>SellerSupc Delete Template</span></a>
			<br><br>
	</div>
	<label>	
	  <s:iterator  value="getUploadStatus()" var="status">>
				<s:property value="#status"/><br>
	</s:iterator>
	</label>
	
	
<div class="report">
		<div class="bar"></div>
	</div>
	<%
		session.setAttribute("report",""); 
		%>
		
		
		<div style="bottom:15%;right:45%;width:37%;height:0%;">
			<p >
	*Note : - <br>

    We have a new templates for both Addition/Updation/Deletion (csv files with new additional columns)<br><br>
    Please upload sheet of 1L entries (including header) at a time. Wait for 20 minutes between every upload.
	</p>
	</div>
</body>
</html>

