<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet"
	href="/PriceSimulator/CSS/utility/bootstrap.min.css" media="screen" />
<link type="text/css" rel="stylesheet"
	href="/PriceSimulator/CSS/utility/bootstrap-datetimepicker.min.css"
	media="screen" />
<link type="text/css" rel="stylesheet"
	href="/PriceSimulator/CSS/content/rules/brandtab.css" media="screen" />
<link type="text/css" rel="stylesheet"
	href="/PriceSimulator/CSS/utility/buttons.css" media="screen" />
<link type="text/css" rel="stylesheet"
	href="/PriceSimulator/CSS/utility/loader.css" media="screen" />

<!-- <script type="text/javascript"
	src="/PriceSimulator/JS/utility/jquery-1.12.0.min.js"></script> -->
<script type="text/javascript"
	src="/PriceSimulator/JS/content/rules/brand.js"></script>
<script type="text/javascript"
	src="/PriceSimulator/JS/utility/loader.js"></script>

<script type="text/javascript"
	src="/PriceSimulator/JS/utility/bootstrap.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.5.1/moment.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.4.0/lang/en-gb.js"></script>
<script type="text/javascript"
	src="/PriceSimulator/JS/utility/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript">
function fetchExceptionRules() {
	var supc = $("#supc").val() ;
	var vendor = $("#vendor").val() ;
	if (supc.length == 0 || vendor.length == 0) {
		return ;
	}
	$.ajax({
		type : "POST",
		dataType : 'json',
		async : false,
		url : 'exceptionUpdate.action?action=fetchExceptionData&supc=' + supc + '&vendor=' + vendor ,
		success : function(data) {

			if (data != -1) {
				$(".ruleList").text ("There are " + data + " rules in Exceptions.") ;
				if (data != "0") {
				$(".ruleList").append("You can get the list by clicking <a class='fileLink' href='#''> here </a>");
				$(".fileLink").attr("href","exceptionUpdate.action?action=fetchExceptionFile&supc=" + supc + '&vendor=' + vendor);
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
function validation(event) {
	var startTime = new Date($("#startTime").val());
	var endTime = new Date($("#endTime").val());
	if (startTime == endTime) {
	    alert("Start Time and End Time cannot be equal..");
	    event.preventDefault();
	    return false;
	} 
	else if (startTime > endTime){
		alert("Start Time cannot be greater than End Time..");
		event.preventDefault();
		return false;
	}
	else if (endTime < Date.now()) {
		event.preventDefault();
		alert("End Time cannot be in past..");
		return false;
	}
	else if (startTime <= Date.now()) {
		event.preventDefault();
		alert("Start Time should be in future..");
		return false;
	}
	return true ;
	//$(".UIFormException").submit();
}

function validateSheetException(event) {
	if ($(".exceptionFile").val().length > 0) {
		return true;
	}
	else {
		alert ("Please select a file") ;
		event.preventDefault();
		return false;
	}
}

function check (event) {
	var r = confirm("Are you sure you want to delete.");
	if (r == false) {
		requestValid=false;
		event.preventDefault();
	}
}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Shipping Engine</title>
</head>
<body>
	<form  method="post"  action="exceptionUpdate.action" style="bottom:12%;right:55%;margin-left: 80px;margin-top: 10px;width:37%;height:65%;" class="form-inline well UIFormException">
	<input name="action" class="hidden" value="ADD">
	<h4 align = "center"><b>Add Supc-Vendor</b></h4>
  <div class="form-group">
  <font color="red">*</font>  <label for="supc">Supc</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input required type="text" name="supc" onblur="fetchExceptionRules()" class="form-control supc" id="supc" placeholder="Enter Supc...">
  </div>
  <br>
  <br>
  <div class="form-group" >
   <font color="red">*</font> <label for="vendor">Vendor Code</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input required type="text" onblur="fetchExceptionRules()" class="form-control" id="vendor" name="vendor" class="vendor" placeholder="Enter Vendor....">
  </div>
  <p class="ruleList" > </p>
 
    <div class="form-group">
    <font color="red">*</font><label for="shippingCharge">Shipping Charge</label>
    <input required type="text" class="form-control" id="shippingCharges" class="shippingCharges" name="shippingCharges" onkeydown='return (event.which >= 48 && event.which <= 57) 
   || event.which == 8 || event.which == 46' placeholder="Enter Shipping Charges....">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <label>NMPU</label>&nbsp;&nbsp;<input name="nmpu" class="nmpu" id="nmpu" type='checkbox'>
  </div>
  <br>
  <br>
<!-- <div class="form-group">
  <font color="red">*</font>  <label for="requestedBy">Requested By</label>&nbsp;&nbsp;&nbsp;&nbsp;
    <input required type="text" name="requestedBy" class="form-control requestedBy" id="requestedBy" placeholder="Requested By...">
  </div>
  <br>
  <br>
  <div class="form-group">
  <font color="red">*</font>  <label for="approvedBy">Approved By</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input required type="text" name="approvedBy" class="form-control approvedBy" id="approvedBy" placeholder="Approved By...">
  </div> 
  <br>
  <br>-->
<font color="red">*</font> <label>Start Time</label>
						<div class='input-group date datetimepicker startTime pull-right' style="width: 57%">
							<input required type='text' class="form-control startTime" id="startTime" name="startTime"  onblur="validation(event)"/> <span class="input-group-addon"> <span
								class="glyphicon glyphicon-calendar"> </span>
							</span>
						</div>
	<br>
	<br>
					<font color="red">*</font> <label>End Time</label>
						<div class='input-group date datetimepicker endTime pull-right' style="width: 57%">
							<input required id="endTime" type='text' class="form-control endTime" name="endTime" onblur="validation(event)" /> <span class="input-group-addon"> <span
								class="glyphicon glyphicon-calendar"> </span>
							</span>
						</div>
<br>
    <div class="form-group">
    <div>
      <button type="submit" class="btn btn-primary">Add</button>
    </div>
  </div>
</form>
<div style="position:fixed;bottom:55%;right:5%;width:37%;height:25%;">
<table class="table table-bordered table-condensed">
	<tr>
	<div class="well">
	<form method="post"
		action="exceptionUpdate.action" enctype="multipart/form-data">
	<h4 align = "center"><b>Bulk Upload Supc Vendor</b></h4>
		<input name="action" class="hidden" value="BULKUPLOAD">
 <input type="file" name="file" class="btn btn-default browse exceptionFile" accept=".csv" /> <br>
 <input type="submit" style="display: inline" class="savetemp btn btn-primary " value="Upload" onclick="validateSheetException(event)" /> &nbsp;&nbsp; 
 <a	href="/PriceSimulator/Temp/ExceptionSample.csv"> Download
					Template</a> <br> <br> <label style="text-align: center;">			
 	</form>
 	<br>
 	<form method="get"
		action="downloadShippingRules.action" enctype="multipart/form-data">
		<input class="hidden" name="action" value="EXCEPTION">
		<button type="submit" class="btn btn-primary">Download Rules</button>		
 	</form>
 </div>
 </tr>
 <form  method="post" action="exceptionUpdate.action" class="form-horizontal" role="form">

 <input name="action" class="hidden" value="DELETE">
 <tr>
 <div class="well" style="height:135%">
  <h4 align = "center"><b>Delete Supc Vendor</b></h4>
  <div class="form-group">
    <label class="control-label col-sm-2" >Supc</label>
    <div class="col-sm-10">
      <input required type="text" class="form-control" id="supc" class="supc" name="supc" placeholder="Enter supc...">
    </div>
  </div>
  <br>
  <br>
  <div class="form-group">
    <label class="control-label col-sm-2" >Vendor Code</label>
    <div class="col-sm-10">
      <input required type="text" class="form-control" id="vendor" class="vendor" name="vendor" placeholder="Enter Vendor....">
    </div>
  </div>
  <br>
  <br>
  &nbsp;&nbsp;&nbsp;&nbsp;<label>NMPU</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="nmpu" class="nmpu" id="nmpu" type='checkbox'>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <div class="form-group">
    <div>
      <button type="submit" class="btn btn-primary" onclick="check(event)">Delete</button>
    </div>
  </div>
</form>

</div>
</tr>
</table>
</div>

	<script type="text/javascript">
		var dateToday = new Date();
		dateToday = dateToday - 86400000;
		$('.datetimepicker.startTime').datetimepicker({

			format : 'YYYY/MM/DD HH:mm:ss',
			orientation : 'top right',
			minuteStepping : 15,
			minDate : dateToday

		});
		$('.datetimepicker.endTime').datetimepicker({

			format : 'YYYY/MM/DD HH:mm:ss',
			orientation : 'top right',
			minDate : dateToday
			
		});
	</script>
	<div style="bottom:15%;right:45%;width:37%;height:0%;">
			<p >
	*Note : - <br>

    1. Field marked with * are mandatory.<br>
    2. Only CSV files are accepted in file upload.<br>
    3. Vendor Code can be "all".<br>
    4. NMPU will get higher priority.<br>
	</p>
	</div>


</body>
</html>