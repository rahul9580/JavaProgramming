<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
/* html { 
overflow: -moz-scrollbars-vertical; 
 } */

</style>
<title>Shipping Engine</title>
</head>
<body>

<br>
<br>
<br>
<br>
<h4 align="center" >Shipping Configurations</h4>
<br>
<br>
<br>
<br>
<form  action="shippingConfig.action">
<input type="text" name="action" class="hidden" value="updateData"></input>

		<table align="center" style="width:500px;" class="table  table-bordered table-inverse">
		<thead style="background-color:#e2e2e2" class="thead-inverse">
			<th>Configuration</th>
			<th>Configuration Value</th>
		</thead>
		<tr>
			<td>
			<label style="width:200px;">Default O2O Shipping Charges</label>
			</td>
			<td>
			<input style="width:200px;" class="defaultO2OShippingCharges" value="<s:property value="getDefaultO2OShippingCharges()"/>" name="defaultO2OShippingCharges" id="defaultO2OShippingCharges">
			</td>
		</tr>
		<tr>
			<td>
			<label style="width:200px;">Shipping Charges Order</label>
			</td>
			<td>
			<input style="width:200px;" class="shippingChargesOrder" value="<s:property value="getShippingChargesOrder()"/>" name="shippingChargesOrder" id="shippingChargesOrder">
			</td>
		</tr>
		<tr>
			<td>
			<label style="width:200px;">Skip TA Seller</label>
			</td>
			<td>
			 <input class="hidden skipTASeller" value="<s:property value="getSkipTASeller()"/>"/>
			 <select style="width:200px;" name="skipTASeller"  class="select">
  				<option value="true" >true</option>
  				<option value="false">false</option>
			</select> 
			<%-- <input class="skipTASeller" value="<s:property value="getSkipTASeller()"/>" name="skipTASeller" id="skipTASeller"> --%>
			</td>
		</tr>
		
		</table>

 <button style="position:fixed;bottom:37%;right:40%;width:10%;height:5%;" type="submit" class="btn btn-primary">Update</button> 
</form>
<script type="text/javascript">
$( document ).ready(function() {
	var obj = $(".skipTASeller").val() ;
	if (obj == 'false') {
		$(".select option[value=false]").attr('selected', 'selected');
	}
	else {
		$(".select option[value=true]").attr('selected', 'selected');
	}
});
/* 	$(document).ready (function{
		alert ("hello") ;
		var obj = $(".skipTASeller").val() ;
		if (obj == 'false') {
			$(".select option[value=false]").attr('selected', 'selected');
		}
		else {
			$(".select option[value=true]").attr('selected', 'selected');
		}
	}); */
</script>
</body>
</html>