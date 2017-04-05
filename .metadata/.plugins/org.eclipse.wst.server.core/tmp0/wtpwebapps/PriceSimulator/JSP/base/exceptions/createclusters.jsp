<%@page import="java.util.Map"%>
<%@page import="com.snapdeal.POJO.ClusterModel"%>
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
	href="/PriceSimulator/CSS/utility/bootstrap-datetimepicker.min.css"
	media="screen" />
<link type="text/css" rel="stylesheet"
	href="/PriceSimulator/CSS/base/structure.css" media="screen" />
	<title>Snapdeal Price Simulator</title>
<script type="text/javascript"
	src="/PriceSimulator/JS/utility/bootstrap.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.5.1/moment.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.4.0/lang/en-gb.js"></script>
<script type="text/javascript"
	src="/PriceSimulator/JS/utility/bootstrap-datetimepicker.min.js"></script>




<style>
#seller_multiselect, #multiselect, #multiselect_to,
	#seller_multiselect_to {
	width: 300px;
}
     .required:after { content:" *"; 
     	color: #e32;
     	display:inline;
     	font: bold;}
     .notRequired{
  	  	display:inline;
     }
</style>
<%-- <div class="header"><%@include file="../../content/menubar.jsp"%></div>
<div class="filter"><%@include file="../../content/categoryfilter.jsp"%></div> --%>
<%-- <script src="/../JS/content/fetchBrandList.js" type="text/javascript" charset="utf-8"></script> --%>

<script type="text/javascript">
	var request;
	var val;
	function validate(evt)
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
	
		function move(direction,all,type)
	{		
		var src = document.getElementById(type+'LeftList')
		var trg = document.getElementById(type+'RightList')	
		var tem
	 
		if(direction)
		{
			tem = src
			src = trg
			trg = tem
			
			if(all)
			 $('#'+type+'RightList option').prop('selected', true);   
		
		}
		else
			{
			if(all)
			 $('#'+type+'LeftList option').prop('selected', true);
			}
	 
		var selected = []
	 
		for(var i in src.options)
		{
			if(src.options[i].selected)
			{
				trg.options.add(new Option(src.options[i].text, src.options[i].value));
				selected.unshift(i);
			}
		}
	 
		for(i in selected)
			src.options.remove(selected[i]);
	}

	$(document).ready(function(){
		$.ajax(
			{
				type : "POST",
				dataType: 'html',
				url : '/PriceSimulator/ajax/complisting.action',
				success : function(data)
				{
					
					if(data != -1)
					{	if(data== 0){
						
					}else{
						var list = data.split(";");
						var temp ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select id='source' name='source' id='source' class='form-control source ' >";
						temp = temp +"<option value='' selected='selected'>Competitor</option>";

						$.each(list, function(idx, obj)
						{
							temp = temp + "<option value='" +obj.split(":")[0].trim()+ "'>" +obj.split(":")[1].trim()+ "</option>";
						});
						temp=temp + "</select>"
						$("td.compList").append(temp);
						$("div.load").html("");
						
						var tmp ="";
	                    $.each(list, function(idx, obj)
	                    {
	                       
	                        tmp = tmp +  "<br>" +"<input type='checkbox' checked='checked' id='compList' name='competitorList' value='" +obj.split(":")[0].trim()+ "'>" +obj.split(":")[1].trim();
	                    });
	                    $("div.compListCluster").append(tmp);
	                    $("div.load").html("");
					}
					}
					else
					{
						$("div.load").html("Internal Error");
					}
				}
			});
	});
	function fetchSellerList(obj) {

		document.getElementById("brandType").disabled = true;
		document.getElementById("sellerType").disabled = true;
		
		document.getElementById("SellerLeftList").options.length = 0;
		var select = document.getElementById("SellerLeftList");
		option = document.createElement("option");
		option.innerHTML = "Fetching seller list...";
		select.appendChild(option);
		if(obj!="1")
		document.getElementById("SellerRightList").options.length = 0;
		var select1 = document.getElementById("SellerRightList");
		
		try{
		option = document.createElement("option");
		option.innerHTML  ;
		select1.replaceChild(option,option );
		}
		catch(e){
			
		}
		
		
				
		var sellerType = document.getElementById("sellerType").value;
		if (sellerType != "select") {
			$.ajax(
					{
						type : "GET",
						dataType: 'html',
						url : 'exceptions/fetchData.action?sellerType='+sellerType+'&type=sellers',
						success : function(data)
						{
													
							if(data != -1)
							{
								$('#SellerLeftList option').each(function(index, option) {
								    $(option).remove();
								});
								
								
								var list = data.replace( /&nbsp;/g,'' ).replace( "\\t\\g",'' ).split(";");
								
								var sellerArray = [];
								if(obj=="1"){
								
								var selectobject = document
								.getElementById("SellerRightList")
								for (var i = 0; i < selectobject.length; i++) {
									try {
										sellerArray.push(selectobject.options[i].value);
									} catch (err) {

									}
								}
								}
								
								$.each(list, function(idx, obj)
										{
									if (sellerArray.indexOf(obj.split(":")[1]) == -1) {	
									 var o = new Option(obj.split(":")[0], obj.split(":")[1]);
					            $(o).html(obj.split(":")[0]);
					            $("#SellerLeftList").append(o);
										}     
								   /*  $(".multiselect").prepend($("<option>")
								                              .val(obj.split(":")[1])       // Might have to use .attr("value", i) instead
								                              .html(obj.split(":")[0])); */
								});
							
								document.getElementById("brandType").disabled = false;
								document.getElementById("sellerType").disabled = false;
							}
						}
					});
		}
		else
		{
				document.getElementById("brandType").disabled = false;
				document.getElementById("sellerType").disabled = false;	
				
				document.getElementById("SellerLeftList").options.length = 0;
				var select6 = document.getElementById("SellerLeftList");
				option = document.createElement("option");
				option.innerHTML ;
				select6.appendChild(option);
				
				document.getElementById("SellerRightList").options.length = 0;
				var select1 = document.getElementById("SellerRightList");
				option = document.createElement("option");
				option.innerHTML ;
				select1.replaceChild(option,option );
		}
	}
	

	
	function fetchBrandList(obj) {
		
		document.getElementById("brandType").disabled = true;
		document.getElementById("sellerType").disabled = true;

		document.getElementById("BrandLeftList").options.length = 0;
		var select = document.getElementById("BrandLeftList");
		option = document.createElement("option");
		option.innerHTML = "Fetching brand list...";
		select.appendChild(option);
			
		if(obj!="1")
		document.getElementById("BrandRightList").options.length = 0;
		var select2 = document.getElementById("BrandRightList");
		try{
		option = document.createElement("option");
		option.innerHTML;
		select2.replaceChild(option,option );
	}
	catch(e){
		
	}
	
			
		
		var brandType = document.getElementById("brandType").value;
		if (brandType != "select") {
			var url;
			if (brandType == "critical") {
				url = "exceptions/fetchData?brandType=critical&subcategoryId=<s:property value ="#session.subcategoryId"/>";
			} else if (brandType == "nonCritical") {
				url = "exceptions/fetchData?brandType=nonCritical&subcategoryId=<s:property value ="#session.subcategoryId"/>";
			} else if (brandType == "all") {
				url = "exceptions/fetchData.action?brandType=all&subcategoryId=<s:property value ="#session.subcategoryId"/>";
			}

			$.ajax(
					{
						type : "GET",
						dataType: 'html',
						url : 'exceptions/fetchData.action?brandType='+brandType+'&type=brands',
						success : function(data)
						{
							
							if(data != -1)
							{
								$('#BrandLeftList option').each(function(index, option) {
								    $(option).remove();
								});
								var list = data.split(";");
								var brandArray = [];
								if(obj=="1"){
								
								var selectobject = document
								.getElementById("BrandRightList");
								for (var i = 0; i < selectobject.length; i++) {
									try {
										brandArray.push(selectobject.options[i].value);
									} catch (err) {

									}
								}
								}
								$.each(list, function(idx, obj)
										{
									
									if (brandArray.indexOf(obj.split(":")[1]) == -1) {
										
									 var o = new Option(obj.split(":")[0], obj.split(":")[1]);
					            $(o).html(obj.split(":")[0]);
					            $("#BrandLeftList").append(o);
									}
								});
								document.getElementById("brandType").disabled = false;
								document.getElementById("sellerType").disabled = false;
								
							}
						}
					});
		}
		else{
			document.getElementById("brandType").disabled = false;
			document.getElementById("sellerType").disabled = false;
			
			document.getElementById("BrandLeftList").options.length = 0;
			var select3 = document.getElementById("BrandLeftList");
			option = document.createElement("option");
			option.innerHTML ;
			select3.appendChild(option);
			
			document.getElementById("BrandRightList").options.length = 0;
			var select2 = document.getElementById("BrandRightList");
			option = document.createElement("option");
			option.innerHTML;
			select2.replaceChild(option,option );
			
			
		}
	}

	function updateList() {
	
		var select_to = document.getElementById("multiselect_to");
		//var length_to = select_to.options.length;
		var length_to=10;
		for ( var j = 0; j < length_to; j++) {
			//select_to.options[j] = null;
		}
		//length_to = select_to.options.length;

		for ( var j = 0; j < length_to; j++) {
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
 					if(names[0]!="brandList"){
 						alert("Brand List didn't come please try again");
 						//fetchBrandList();
 					}
 					else{
				
					//alert("names"+names);
					for ( var i = 1; i < names.length - 1; i++) {
						var select = document.getElementById("BrandLeftList"), option = null;
						option = document.createElement("option");
							
						option.innerHTML = names[i];
						select.appendChild(option);
					}
					
 					}
					
				}
		}
			}
	
	
	function SelectSupcType() {

		
		val = document.getElementById("selectSupcType").value;
		
		if (val == "selective") {
			document.getElementById("chooseFile").style.display = 'block';
		} else {
			document.getElementById("chooseFile").style.display = 'none';
		}

	}
	
	
	
	function validation(event) { 
		showloader("div.action > div.report2 > div.bar");
		var CMPercent= $('#cmPercent1').val();
		var competitorDifference = $("#competitorDifference1").val();
		var noCMPercent =  $("#nocmPercent1").val();
		var GMPercent = $("#gmPercent1").val();
		var maxCompetitorDifference = $("#maxCompetitorDifference1").val();
		var noGMPercent =  $("#nogmPercent1").val();
		var CMPUPercent = $("#cmpuPercent1").val();
		var noCMPUPercent = $("#nocmpuPercent1").val();
		var startTime= $("#startTime").val();
		var endTime=$("#endTime").val();
		var popularityFrom=$("#popularityFrom").val();
		var popularityTo=$("#popularityTo").val();
		var source=$("#source").val();
		var idp= $("#idp1").val();
		var supcType=$("#selectSupcType").val();
		var supcList=$("#chooseFile").val();
		var clusterId=$("#clusterId").val();
		var wma= $("#wma1").val();
		var status = false;
		var clusterName=$("#clusterName").val();
		var competitorList = [];
		$("div.compListCluster input:checkbox:checked").map(function(){
			competitorList = competitorList +$(this).val()+",";
		  });
		/*  alert(CMPercent+':'+competitorDifference+':'+noCMPercent+':'+maxCompetitorDifference+':'+noGMPercent+':'+status+':'+startTime + ':'+endTime + ':'+popularityFrom + ':'+popularityTo + ':'+source); */ 
		$.ajax(
				{
					type : "POST",
					dataType: 'html',
					async: false,
					url : 'exceptions/clusterlimitcheck.action' ,
					data:{ cmPercent: CMPercent ,gmPercent : GMPercent ,cmpuPercent : CMPUPercent,nocmpuPercent : noCMPUPercent, competitorDifference : competitorDifference,maxCompetitorDifference : maxCompetitorDifference,nocmPercent : noCMPercent , nogmPercent : noGMPercent, startTime : startTime, endTime : endTime, popularityFrom : popularityFrom,
						popularityTo : popularityTo, source : source , idp : idp , wma : wma , supcType:supcType , supcList : supcList , clusterId : clusterId, clusterName : clusterName },
					success : function(data)
					{
						if (data == 1 ) {
							status = true;
							$("div.action > div.report2 > div.bar").html("<span>Updated</span>");
						}
						else {
							if(typeof(event) != 'undefined'){
								event.preventDefault();
							}
							$("div.action > div.report2 > div.bar").html("<span style=\"color:red;\">Failed ! "+data+"</span>");
						    return false;
						}
					}
				});
		return status;
	}
	function SubmitFunction(event)
	{
		var result = validation(event);
		$('#SellerRightList option').prop('selected', true);
		$('#BrandRightList option').prop('selected', true);
		if ( result ) {document.createClusterForm.submit(); }
	}
	
	</script>
</head>

<body>

	<script type="text/javascript">
		var obj='<%= session.getAttribute("report2") %>';
		if(obj!= null && obj!=undefined && obj!='')
			if(obj=='Success' || obj=='Some Error Occurred')
				alert('<%= session.getAttribute("report2") %>');
		
		
		</script>


	<div id="message" style="margin-left: 35%; color: green">
		<%
		    Object object = request.getAttribute("message");

					if (object != null)
						out.println(object);
		%>
	</div>

	<div class="center " style="margin-top:10px;">
 
		<form action="exceptions/createClusters.action" id="myform"
			name="createClusterForm" style="margin-left: 20 px;display:block;" method="POST"
			class="form algn well well-sm" onsubmit="SubmitFunction(event);"
			enctype="multipart/form-data">
			

			<div class="errors">
				<s:property value="#session.message" />
			</div>
			
			<div>
			  <input type="hidden" name="userAction"
				value="create" /> <input type="hidden" name="clusterId" id="clusterId"/> <label style="">Cluster
				Name</label> <input type="text" name="clusterName" id="clusterName"
				class="form-control" style="margin-left: 40px;width: 15%;display:inline;" required
				value="<s:property value="#session.clusterModel.clusterName"/>" />
			</div>
			
			<div style="margin-left:0px;margin-right:0px; margin-top:10px;" class="row ">
			
			<div class="col-md-6" style="padding-left:0px;">
			<label>Brand Type</label> <select id="brandType" name="brandType"
				onchange="fetchBrandList()" style="margin-left: 50px;display:inline"
				class="form-control">
				<option value="select">ALL</option>
				<!-- <option value="critical">Critical Brand</option>-->
				<!-- <option value="nonCritical">All Brands</option>  -->
				<option value="all">Selective Brands</option>
			</select>
			<table style="margin-top:10px;width: 100%; ">
				<tbody>
					<tr>
						<td style="width:45%;">
							<fieldset class="SelectManyControl_fieldset" >
								<div class="SelectManyControl_legend " style="font-weight: 400;font-size: 14px;padding-bottom:5px;" >
								Available Brand
								</div>
								<select name="brand_list_from" id="BrandLeftList" class="form-control" size="12"
									multiple="multiple" style="width:95%" >
									<!-- <option value="0">item0</option><option value="2">item2</option><option value="4">item4</option><option value="5">item5</option><option value="6">item6</option><option value="7">item7</option> -->
									<!-- Need to write here the code for fetching the value -->
								</select>
							</fieldset>
						</td>
						<td>
							<table class="table" style="width:10%;margin-top:35px;">
								<tbody>
									<!-- <tr><td></td></tr> -->
									<tr>
										<td><input type="button" onclick="move(0,0,'Brand')"
											class="btn btn-primary" value="&gt;" style="width:40px;" /></td>
									</tr>
									<tr>
										<td><input type="button" onclick="move(0,1,'Brand')"
											class="btn btn-primary" value="&gt;&gt;" style="width:40px;" /></td>
									</tr>
									<tr>
										<td><input type="button" onclick="move(1,0,'Brand')"
											class="btn btn-primary" value="&lt;" style="width:40px;" /></td>
									</tr>
									<tr>
										<td><input type="button" onclick="move(1,1,'Brand')"
											class="btn btn-primary" value="&lt;&lt;" style="width:40px;" /></td>
									</tr>
								</tbody>
							</table>
							
						</td>
						
						<td style="width:45%;">
							<fieldset class="SelectManyControl_fieldset"> 
								<div class="SelectManyControl_legend " style="font-weight: 400;font-size: 14px;padding-bottom:5px;">Selected Brand</div>


								<select id="BrandRightList" name="BrandRightList" class="form-control" size="12"
									multiple="multiple" style="width:95%">

									<option></option>
								</select>
							</fieldset>
						</td>
					</tr>
				</tbody>
			</table>
			  
			</div>
			<div class="col-md-6 " style="">
			<font color="red">*</font>
			<label>Seller Type</label>
			<select id="sellerType" name="sellerType" class="form-control"
				onchange="fetchSellerList()" style=" margin-left: 50px; display:inline;">
				<option value="select">ALL</option>
				<!-- <option value="critical">Critical Seller</option>-->
				<!-- <option value="nonCritical">All Seller</option>  -->
				<option value="all">Selective Seller</option>
			</select>
			<table  style="width: 100%;">
					<tbody>
						<tr>
							<td style="width:45%;">
								<fieldset class="SelectManyControl_fieldset" >
									<div class="SelectManyControl_legend " style="font-weight: 400;font-size: 14px;padding-bottom:5px;">Available
										Seller</div>
									<select id="SellerLeftList" size="12" class="form-control" multiple="multiple"
										style="width:95%">
										<!-- <option value="0">item0</option><option value="2">item2</option><option value="4">item4</option><option value="5">item5</option><option value="6">item6</option><option value="7">item7</option> -->
									</select>
								</fieldset>
							</td>
							<td>
								<table class="table" style="width:10%;margin-top:50px;">
									<tbody>
										<tr>
											<td><input type="button" onclick="move(0,0,'Seller')"
												class="btn btn-primary" value="&gt;"  style="width:40px;"/></td>
										</tr>
										<tr>
											<td><input type="button" onclick="move(0,1,'Seller')"
												class="btn btn-primary" value="&gt;&gt;" style="width:40px;" /></td>
										</tr>
										<tr>
											<td><input type="button" onclick="move(1,0,'Seller')"
												class="btn btn-primary" value="&lt;" style="width:40px;"  /></td>
										</tr>
										<tr>
											<td><input type="button" onclick="move(1,1,'Seller')"
												class="btn btn-primary" value="&lt;&lt;" style="width:40px;"/></td>
										</tr>
									</tbody>
								</table>
							</td>
							<td style="width: 45%">
								<fieldset class="SelectManyControl_fieldset">
									<div class="SelectManyControl_legend " style="font-weight: 400;font-size: 14px;padding-bottom:5px;">Selected
										Seller</div>
									<select id="SellerRightList" name="SellerRightList" class="form-control" size="12"
										multiple="multiple" style="width:95%" >
										<option></option>
									</select>
								</fieldset>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			

			</div>

			
			<div class="row" style="margin-left:0px;margin-right:0px;border-top: 1px solid rgb(217, 212, 218);border-bottom: 1px solid rgb(217, 212, 218);padding-bottom: 10px;">
				<div class="col-md-3" style="margin-left:0px;margin-right:0px;">
				<label style="margin-top:30px;" >SUPC Type </label><select name="supcType"
					onchange="SelectSupcType()" id="selectSupcType"
					class="form-control" style=" /* margin-left: 25px; *//* width: 35%; *//* display:inline; */margin-left: 10px;">
					<!-- <option value="select" selected="selected">--Select--</option> -->
					<option value="all">All</option>
					<option value="selective">Selective</option>
				</select> </div> <div class="col-md-3" style="margin-top:25px;"> <input type="file" style="display:none" name="supcList" id="chooseFile" hidden=""
					accept=".xlsx" /> </div>
				
				<a  class="btn btn-primary" id="selectSupcDownLoadLink"
					href="/PriceSimulator/Temp/product.xlsx" style="margin-top:20px;" ><span
					id="downLoadLinkSpan">Download Template</span></a>
			</div>
				

				<div id="formPart2" class="row" style="margin-left:0px;margin-right:0px;">
					<h4 style="border-bottom: 1px solid rgb(217, 212, 218);padding-bottom: 10px;
					">
						<b>Filters</b>
					</h4>
					
					<table class="table  ">
						<tr>
							<td class="col-md-2"><label>Price :</label></td>
							<td class="col-md-4"><label>From</label><input type="text"
								name="priceFrom" class="decimal form-control  input-sm" style="margin-left:50px;" id="priceFrom"
								value="<s:property value="#session.clusterModel.priceFrom"/>" /></td>


							<td class="col-md-4"><label>To</label><input type="text"
								name="priceTo" class="decimal form-control  input-sm" id="priceTo" style="margin-left:50px;"
								value="<s:property value="#session.clusterModel.priceTo"/>" /></td>
						</tr>
						
						<tr>
							<td ><label>Best Seller Ranking :</label></td>
							<td ><label>From</label><input type="text"
								name="popularityFrom" class="decimal form-control popularityFrom input-sm" style="margin-left:50px;" id="popularityFrom" onkeypress="validate(event)" /></td>
							
							<td class="compList ">
							<label>To</label><input type="text"
								name="popularityTo" class="decimal form-control popularityTo input-sm" id="popularityTo" style="margin-left:50px;" onkeypress="validate(event)" /></td>
						</tr>
						
						<tr>

							<td class="col-md-2 "><label>Fulfillment
									mode :</label></td>
							<td><select id="fulfillmentType" name="fulfillmentType"
								id="fulfillmentType" class="form-control"
								onchange="showFormPart3()">
									<option value="all">All</option>
									<option value="FC_VOI">SD+</option>
									<option value="DROPSHIP">Dropship</option>
									<option value="ONESHIP">Oneship</option>
							</select></td>
						</tr>
					</table>

					<div id="formPart4">
						
						<h4 style="border-bottom: 1px solid rgb(217, 212, 218);border-top: 1px solid rgb(217, 212, 218);padding-top: 10px;padding-bottom: 10px;
						">
							<b>Rules</b>
						</h4>

						<table class="table  ">
							<tr>
								<th  class="" style="background-color: #f5f5f5; color: black"><h5><label>Competition</label></h5></th>
								<th  class="" style="background-color: #f5f5f5; color: black"></th>
								<th  class="" style="background-color: #f5f5f5; color: black"><h5><label>No Competition</label></h5></th>
							</tr>

							
								<tr>
				<td class="CM "><font color="red">*</font><label>CM %</label><input
					type="number" name="cmPercent" id="cmPercent1"
					class="cmPercent form-control pull-right" step="0.1"
					 /></td>
				<td class="CD "><font color="red">*</font><label>Comp
						Difference(%)</label><input type="number" name="competitorDifference"
					id="competitorDifference1" class="competitorDifference form-control pull-right"
					step="0.1" onkeypress="validate(event)" /></td>
				<td class="NC "><label>CM %</label><input
					type="number" name="nocmPercent" id="nocmPercent1"
					class="nocmPercent form-control pull-right" step="0.1"
					onkeypress="validate(event)" /></td>
			</tr>

			<tr>
				<td class="GM "><font color="red">*</font><label>GM %</label><input
					type="number" name="gmPercent" id="gmPercent1"
					class="gmPercent form-control pull-right" step="0.1"
					onkeypress="validate(event)" /></td>
				<td class="MD "><font color="red">*</font><label>Max Comp Diff(Rs.)</label><input
					type="number" id="maxCompetitorDifference1"
					name="maxCompetitorDifference"
					class="maxCompetitorDifference form-control pull-right" step="0.1"
					onkeypress="validate(event)" /></td>
				<td class="NCGM "><label>GM %</label><input
					type="number" name="nogmPercent" id="nogmPercent1"
					class="nogmPercent form-control pull-right" step="0.1"
					onkeypress="validate(event)" /></td>
			</tr>
			<tr>
				<td class="CMPU "><font color="red">*</font><label>CMPU</label><input
					type="number" name="cmpuPercent" id="cmpuPercent1"
					class="cmpuPercent form-control pull-right" step="0.1"
					onkeypress="validate(event)" /></td>
				<td></td>
				<td class="NCMPU "><label>CMPU</label><input
					type="number" name="nocmpuPercent" id="nocmpuPercent1"
					class="nocmpuPercent form-control pull-right" step="0.1"
					onkeypress="validate(event)" /></td>
			</tr>
							<tr> 
								<td class=" startTime"><font color="red">*</font><label>Start Time</label>
									<div class='startTime input-group date datetimepicker pull-right ' style="width: 55%">
										<input type='text' class="form-control" id="startTime" name="startTime" onkeypress="return false;"/> <span class="input-group-addon"> <span
											class="glyphicon glyphicon-calendar"> </span>
										</span>
									</div></td>



								<td class=" endTime"><font color="red">*</font><label>End Time</label>
									<div class='input-group date datetimepicker endTime pull-right' style="width: 55%" >
										<input type='text' class="endTime form-control" id="endTime" name="endTime" onkeypress="return false;"/> <span
											class="input-group-addon"> <span
											class="glyphicon glyphicon-calendar"> </span>
										</span>
									</div></td>
							</tr>
						</table>
				<div class= "well well-sm compListCluster">
				<label>Mapped Competitors</label>
				</div>
				<div class= "well well-sm">
				<label>Wallet Configuration</label>
				
				<table>
				<tr>
				<td class="col-md-3"><label>Instant Discount %</label></td>
				<td><input type="text"
								name="idp" id="idp1"
								class="idp form-control pull-center" style="width:55%;" onkeypress="validate(event)"
								 /> 
				</td>
				
				<td class="col-md-4"><label>Wallet Min Absolute</label></td>
								<td><input type="text" id="wma1"
								name="wma" class="wma form-control pull-left " style="width:55%;"onkeypress="validate(event)" 
								 />
								
				</td>
				</tr>
				
				</table>
				</div>
						<script type="text/javascript">
							$('.datetimepicker.startTime').datetimepicker({


								format : 'YYYY/MM/DD HH:mm:ss',
								orientation : 'top right'
							});
							$('.datetimepicker.endTime').datetimepicker({

								format : 'YYYY/MM/DD HH:mm:ss',
								orientation : 'top right'
							});
						</script>

						<button class="btn btn-primary" id="createClusterButton"
							value="create cluster" onclick="validation()">Update</button>
					</div>
				</div>
				<!-- <input type="button" id="submitForm" value="Create"/> -->
		</form>

	</div>
	<div class="action">
	<div class="report2">
			<div class="bar"></div>
		</div>
	</div>
	<div class="load"></div>
	<%-- <div class="filter"><%@include file="../../content/categoryfilter.jsp"%></div> --%>
</body>
</html>




