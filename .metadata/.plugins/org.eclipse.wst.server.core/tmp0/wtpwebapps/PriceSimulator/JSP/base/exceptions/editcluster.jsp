<%@page import="java.util.Map"%>
<%@page import="com.snapdeal.POJO.GroupModel"%>
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


#seller_multiselect,#multiselect,#multiselect_to,#seller_multiselect_to
	{
	width: 300px;
}
</style>
<%-- <div class="header"><%@include file="../../content/menubar.jsp"%></div>
<div class="filter"><%@include file="../../content/categoryfilter.jsp"%></div> --%>
<%-- <script src="/../JS/content/fetchBrandList.js" type="text/javascript" charset="utf-8"></script> --%> 






<script type="text/javascript">
	var request;
	
	function returnFalse()
	{
		return false;
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
		 var regex = /[0-9-]|\./;
		if(!regex.test(key))
		{
			theEvent.returnValue = false;
			if(theEvent.preventDefault) theEvent.preventDefault();
		}   
		
	}
	
	function validateIntegerInput(evt)
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
						var temp ="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select id='source' name='source' id='source' class='form-control source '  >";
						temp = temp +"<option value=''>Competitor</option>";
						var source="<s:property value="#session.groupModel.source"/>";
						$.each(list, function(idx, obj)
						{
							temp = temp + "<option value='" +obj.split(":")[0].trim()+"'";
							if(source.trim()==obj.split(":")[0].trim()){
								temp = temp + "selected='selected'";
							}
							temp = temp + " >" +obj.split(":")[1].trim()+ "</option>";
						});
						temp=temp + "</select>"
						
						var list1 = data.split(";");
	                    var tmp ="";
	                    var comp="<s:property value="#session.groupModel.competitorList"/>";
	                    comp = comp.replace("\"", "");
	                    var sourceList = comp.split(",");
	                    $.each(list, function(idx, obj)
	                    {
	                       
	                    	tmp = tmp +  "<br>" +"<input type='checkbox' id='compList' name='competitorList' value='" +obj.split(":")[0].trim()+ "'";//>" +obj.split(":")[1].trim();
	                        for(var i = 0 ; i<sourceList.length;i++){
	                        	if(sourceList[i].trim()==obj.split(":")[0].trim()){
	                        		tmp = tmp + "checked='checked'";
	                        	}
	                        }
	                        if(sourceList == "ALL"){
                        		tmp = tmp + "checked='checked'";
                        	}
	                        tmp = tmp +">" +obj.split(":")[1].trim();
	                    });
	                    $("div.compListCluster").append(tmp);
	                    $("div.load").html("");
						
						
						$("td.compList").append(temp);
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
				url = "fetchData?brandType=critical&subcategoryId=<s:property value ="#session.subcategoryId"/>";
			} else if (brandType == "nonCritical") {
				url = "fetchData?brandType=nonCritical&subcategoryId=<s:property value ="#session.subcategoryId"/>";
			} else if (brandType == "all") {
				url = "fetchData.action?brandType=all&subcategoryId=<s:property value ="#session.subcategoryId"/>";
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

		
		var val = document.getElementById("selectSupcType").value;
		
		if (val == "selective") {
			document.getElementById("chooseFile").style.display = 'block';
		} else {
			document.getElementById("chooseFile").style.display = 'none';
		}

	}
	function validation(event) { 
		//showloader("div.action > div.report7 > div.bar");
		var CMPercent= $('#cmPercent').val();
		var competitorDifference = $("#competitorDifference").val();
		var noCMPercent =  $("#nocmPercent").val();
		var GMPercent = $("#gmPercent").val();
		var maxCompetitorDifference = $("#maxCompetitorDifference").val();
		var noGMPercent =  $("#nogmPercent").val();
		var CMPUPercent = $("#cmpuPercent").val();
		var noCMPUPercent = $("#nocmpuPercent").val();
		var startTime= $("#startTime").val();
		var endTime=$("#endTime").val();
		var popularityFrom=$("#popularityFrom").val();
		var popularityTo=$("#popularityTo").val();
		var source=$("#source").val();
		var idp= $(".idp").val();
		var supcType=$("#selectSupcType").val();
		var supcList=$("#chooseFile").val();
		var clusterId=$("#clusterId").val();
		var wma= $(".wma").val();
		var competitorList = [];
		$("div.compListCluster input:checkbox:checked").map(function(){
			competitorList = competitorList +$(this).val()+",";
		  });
		var status = false;
		/* alert(CMPercent+':'+competitorDifference+':'+noCMPercent+':'+maxCompetitorDifference+':'+noGMPercent+':'+status+':'+startTime + ':'+endTime); */
		$.ajax(
				{
					type : "POST",
					dataType: 'html',
					async: false,
					url : 'exceptions/clusterlimitcheck.action' ,
					data:{ cmPercent: CMPercent ,gmPercent : GMPercent ,cmpuPercent : CMPUPercent , nocmpuPercent : noCMPUPercent, competitorDifference : competitorDifference,maxCompetitorDifference : maxCompetitorDifference,nocmPercent : noCMPercent , nogmPercent : noGMPercent, startTime : startTime, endTime : endTime, popularityFrom : popularityFrom, 
						popularityTo : popularityTo, source : source , idp : idp , wma : wma , supcType:supcType , supcList : supcList , clusterId : clusterId },
					async: false,
					success : function(data)
					{
						if (data == 1 ) {
							status = true;
							$("div.action > div.report7 > div.bar").html("<span style=\"color:red;\">Updated</span>");
						}
						else {
							 /* if(typeof(event) != 'undefined'){
								event.preventDefault();
							}  */
							$("div.action > div.report7 > div.bar").html("<span style=\"color:red;\">Failed !"+data +" </span>");
						    return false;
						}
					}/* ,error: function(data){
						$("div.action > div.report3 > div.bar").html("<span style=\"color:red;\">Failed</span>");
					} */
				});
		return status;
	}

	function SubmitFunction()
	{
		var result;
		//if(event=='undefined' || event==null || event== undefined )
		result = validation('undefined');
		/* else	
		result = validation(event); */
	
		$('#SellerRightList option').prop('selected', true);
		$('#BrandRightList option').prop('selected', true);
		
		if(result==true){
		document.createClusterForm123.submit();
		}
		else
			{
			return false;
			}
	}
	
				</script>
			</head>
			
			
<body>



		<script type="text/javascript">
		var obj='<%= session.getAttribute("report3") %>';
		if(obj!= null && obj!=undefined && obj!='')
			if(obj=='Success' || obj=='Some Error Occurred')
				alert('<%= session.getAttribute("report3") %>');
		
		
		</script>			
				
			
	<div id="message" style="margin-left: 35%; color: green">
		<%
			Object object = request.getAttribute("message");

			if (object != null)
				out.println(object);
		%>
	</div>

<div class="center " style="">

		
		<form action="exceptions/createClusters.action" id="createClusterForm123" onSubmit="javascript:return false" name="createClusterForm123"
				style="margin-left: 20 px;display:block;margin: 30px 2%;width: 96%;" method="POST" class="form-inline algn well well-sm" enctype="multipart/form-data"
				>
			
				  
				
			   <div class="errors">
			      <s:property value="#session.message" />
			   </div>

  				<div>
					<input type="hidden" name="userAction" value="edit" /> 
					<input type="hidden" name="clusterId" id="clusterId" value="<s:property value="#session.groupModel.getClusterId()"/>" /> 
					<font color="red">*</font><label>Cluster Name </label><input type="text"	class="form-control" name="clusterName" id="clusterName" style="margin-left: 40px;width:15%;display:inline;" required value="<s:property value="#session.groupModel.getClusterName()"/>" readonly/> 
				</div>  
				  
				<div style="margin-left:0px;margin-right:0px; margin-top:10px;" class="row ">
			
				<div class="col-md-6" style="padding-left:0px;">  
				  
				 <font color="red">*</font><label> Brand Type </label> <select id="brandType"
					name="brandType" onchange= "fetchBrandList()" 
							style="margin-left: 50px;display:inline" class="form-control">
					<option value="select">ALL</option>
					<!-- <option value="critical">Critical Brand</option>-->
					<!-- <option value="nonCritical">All Brands</option>  -->
					<option value="all">Selective Brands</option>
				</select>  



				<table style="margin-top:10px;width:100%;">
					<tbody>
						<tr>
							<td style="width:45%;">
								<fieldset class="SelectManyControl_fieldset">
									<div class="SelectManyControl_legend " style="font-weight:400;font-size:16px;padding-bottom:5px;">
									Available Brand</div>
									<select name="brand_list_from" id="BrandLeftList" class="form-control" size="12" multiple="multiple"
										style="width: 95%;height:195px;">
										<!-- <option value="0">item0</option><option value="2">item2</option><option value="4">item4</option><option value="5">item5</option><option value="6">item6</option><option value="7">item7</option> -->
										<!-- Need to write here the code for fetching the value -->



									</select>
								</fieldset>
							</td>
							<td>
								<table class="table" style="width:10%;margin-top:35px;">
									<tbody>
										<tr>
											<td><input type="button"
												onclick="move(0,0,'Brand')"
												value="&gt;" style="width: 40px" class="btn btn-primary" /></td>
										</tr>
										<tr>
											<td><input type="button"
												onclick="move(0,1,'Brand')"
												value="&gt;&gt;" style="width: 40px" class="btn btn-primary" /></td>
										</tr>
										<tr>
											<td><input type="button"
												onclick="move(1,0,'Brand')"
												value="&lt;" style="width: 40px" class="btn btn-primary" /></td>
										</tr>
										<tr>
											<td><input type="button"
												onclick="move(1,1,'Brand')"
												value="&lt;&lt;" style="width: 40px" class="btn btn-primary" /></td>
										</tr>
									</tbody>
								</table>
							</td>
							<td style="width:45%">
								<fieldset class="SelectManyControl_fieldset">
									<div class="SelectManyControl_legend " style="font-weight: 400;font-size: 16px;padding-bottom:5px;">Selected
										Brand</div>
									
									
									<select id="BrandRightList" name="BrandRightList" size="12"
								multiple="multiple" style="width: 95%">
								<%
								
								GroupModel groupModel = session.getAttribute("groupModel")!=null?(GroupModel)session.getAttribute("groupModel"):null;
								if(groupModel!=null){
								List<String> brandIds = groupModel.getBrandList();		
									if (brandIds != null) {
										for (int i = 0; i < brandIds.size(); i++) {
											String option = (String) brandIds.get(i);
								%>
								<option
									value="<%=option.split(":")[0]%>"><%=option.split(":")[1]%></option>
								<%
									}
									}
									}
								%>
								
									
							</select>		
									
									
								</fieldset>
							</td>
						</tr>
					</tbody>
				</table>
				</div>

				<div class="col-md-6 " style="">
				<font color="red">*</font> 
					<label>Seller Type </label>
					<select id="sellerType" name="sellerType" class="form-control"
						onchange="fetchSellerList()" style="margin-left: 50px;display:inline;">
						<option value="select">ALL</option>
						<!-- <option value="critical">Critical Seller</option>-->
						<!-- <option value="nonCritical">All Seller</option>  -->
						<option value="all">Selective Seller</option>
					</select>
					
					<table style="width:100%;" >
						<tbody>
							<tr>
								<td style="width:45%;">
									<fieldset class="SelectManyControl_fieldset">
										<div class="SelectManyControl_legend" style="font-weight: 400;font-size: 16px;padding-bottom:5px;">Available
											Seller</div>
										<select id="SellerLeftList" size="12" multiple="multiple"
											style="width: 95%">
											<!-- <option value="0">item0</option><option value="2">item2</option><option value="4">item4</option><option value="5">item5</option><option value="6">item6</option><option value="7">item7</option> -->
										</select>
									</fieldset>
								</td>
								<td>
									<table class="table" style="width:10%;margin-top:50px;">
										<tbody>
											<tr>
												<td><input type="button"
													onclick="move(0,0,'Seller')"
													value="&gt;" style="width: 40px" class="btn btn-primary" /></td>
											</tr>
											<tr>
												<td><input type="button"
													onclick="move(0,1,'Seller')"
													value="&gt;&gt;" style="width: 40px" class="btn btn-primary" /></td>
											</tr>
											<tr>
												<td><input type="button"
													onclick="move(1,0,'Seller')"
													value="&lt;" style="width: 40px" class="btn btn-primary" /></td>
											</tr>
											<tr>
												<td><input type="button"
													onclick="move(1,1,'Seller')"
													value="&lt;&lt;" style="width: 40px" class="btn btn-primary" /></td>
											</tr>
										</tbody>
									</table>
								</td>
								<td style="width: 45%">
									<fieldset class="SelectManyControl_fieldset">
										<div class="SelectManyControl_legend " style="font-weight: 400;font-size: 16px;padding-bottom:5px;">Selected
											Seller</div>
										<select id="SellerRightList" name="SellerRightList" size="12" class="form-control" multiple="multiple"
											style="width: 95%;height:195px;">
							<%				if(groupModel!=null){
								List<String> sellerList = groupModel.getSellerList()	;	
									if (sellerList != null) {
										for (int i = 0; i < sellerList.size(); i++) {
											String option = (String) sellerList.get(i);
								%>
								<option
									value="<%=option.split(":")[0]%>"><%=option.split(":")[1]%></option>
								<%
									}
									}
									}
								%>
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
				<label style="margin-top:30px;"><font color="red">*</font> SUPC Type </label> <select name="supcType"
					onchange="SelectSupcType()" id="selectSupcType"
					class="form-control" style=" /* margin-left: 25px; *//* width: 35%; *//* display:inline; */margin-left: 10px;">
					<!-- <option value="select" selected="selected">--Select--</option> -->
					<option value="all">All</option>
					<option value="selective">Selective</option>
				</select></div> <div class="col-md-3" style="margin-top:25px;"><input type="file" name="supcList" id="chooseFile" hidden="" accept=".xlsx"/></div>
				
				
				<a class="btn btn-primary" style="margin-top:20px;" id="selectSupcDownLoadLink" href="/PriceSimulator/Temp/product.xlsx"><span id="downLoadLinkSpan">Download Template</span></a>
				
			</div>
			
			<div id="formPart2" class="row" style="margin-left:0px;margin-right:0px;">
					<h4 style="border-bottom: 1px solid rgb(217, 212, 218);padding-bottom: 10px;">
					<b>Filters</b>
					</h4>

					<table class="table">
						<%-- <tr>
							<td>Discount % From</td>
							<td><input type="text" name="discountPercentFrom"
								id="discountPercentFrom" class="decimal" value="<s:property value="#session.groupModel.discountPercentFrom"/>"/></td>
							<td>&nbsp;&nbsp;&nbsp;Discount % To</td>
							<td><input type="text" name="discountPercentTo"
								id="discountPercentTo" class="decimal" value="<s:property value="#session.clusterModel.discountPercentTo"/>"/></td>
						</tr> --%>
						<tr>
							<td class="col-md-2"><label>Price</label></td>
							<td class="col-md-4"><label>From</label><input type="text" name="priceFrom" class="decimal form-control  input-sm"
								id="priceFrom" style="margin-left:50px;" value="<s:property value="#session.groupModel.priceFrom"/>"/></td>

							<td class="col-md-4"><label>To</label><input type="text" name="priceTo" class="decimal form-control  input-sm"
								id="priceTo" style="margin-left:50px;" value="<s:property value="#session.groupModel.priceTo"/>"/></td>
						</tr>
					

						<tr>
							<td><label>Best Seller Ranking :</label></td>
							<td ><label>From</label><input type="text" name="popularityFrom" class="decimal form-control popularityFrom input-sm" 
							style="margin-left:50px;" id="popularityFrom" onkeypress="validate(event)" value="<s:property value="#session.groupModel.popularityFrom"/>" /></td>

							<td class="compList ">
							<label>To</label><input type="text" name="popularityTo" class="decimal form-control popularityTo input-sm" 
							id="popularityTo" style="margin-left:50px;" onkeypress="validate(event)" value="<s:property value="#session.groupModel.popularityTo"/>" /></td>
						</tr>
						
						<tr>
							<td class="col-md-2"><label>Fulfillment mode : </label></td>
							<td><select id="fulfillmentType" name="fulfillmentType" class="form-control"
								id="fulfillmentType" onchange="showFormPart3()">
									<option value="all">All</option>
									<option value="FC_VOI">SD+</option>
									<option value="DROPSHIP">Dropship</option>
									<option value="ONESHIP">Oneship</option>
									<!-- <option value="all">All</option> -->
							</select></td>
						</tr>
					</table>
						
				<div id="formPart4" style="display:block">
				
					<h4 style="border-bottom: 1px solid rgb(217, 212, 218);border-top: 1px solid rgb(217, 212, 218);padding-top: 10px;padding-bottom: 10px;">
					Rules</h4>
					
					
					<table class="table">
					<tr>
						<th  class="" style="background-color: #f5f5f5; color: black"><h5><label>Competition</label></h5></th>
						<th  class="" style="background-color: #f5f5f5; color: black"></th>
						<th  class="" style="background-color: #f5f5f5; color: black"><h5><label>No Competition</label></h5></th>
					</tr>
					
					<tr>
						<td class="CM" ><font color="red">*</font><label>CM %</label><input type="number" name="cmPercent" id="cmPercent" class=" form-control pull-right" step="0.1" onkeypress="validate(event)" value="<s:property value="#session.groupModel.getCmPercent()"/>" /></td>
						<td class="CD"><font color="red">*</font><label>Comp Difference(%)</label><input type="number" name="competitorDifference" class=" form-control pull-right"  id="competitorDifference" step="0.1" onkeypress="validate(event)" value="<s:property value="#session.groupModel.getCompetitorDifference()"/>" /></td>
						<td class="NC"><label>CM% </label><input type="number" name="nocmPercent" id="nocmPercent" class=" form-control pull-right"  step="0.1" onkeypress="validate(event)" value="<s:property value="#session.groupModel.getNocmPercent()"/>"/></td>
					</tr>
					
					<tr>
						<td class="GM"><font color="red">*</font><label>GM%</label><input type="number" name="gmPercent" id="gmPercent" class=" form-control pull-right" step="0.1" onkeypress="validate(event)" value="<s:property value="#session.groupModel.getGmPercent()"/>" /></td>
						<td class="MD"><font color="red">*</font><label>Max Comp Diff(Rs.)</label><input type="number" name="maxCompetitorDifference" class=" form-control pull-right"  id="maxCompetitorDifference" step="0.1" onkeypress="validate(event)" value="<s:property value="#session.groupModel.getMaximumCompetitorDifference()"/>" /></td>
						<td class="NCGM"><label>GM%</label><input type="number" name="nogmPercent" id="nogmPercent" class=" form-control pull-right"  step="0.1" onkeypress="validate(event)" value="<s:property value="#session.groupModel.getNogmPercent()"/>"/></td>
					</tr>
					<tr>
						<td class="CMPU"><font color="red">*</font><label>CMPU</label><input type="number" name="cmpuPercent" id="cmpuPercent" class="form-control pull-right" step="0.1" onkeypress="validate(event)" value="<s:property value="#session.groupModel.getCmpuPercent()"/>" /></td>
						<td></td>
						<td class="NCMPU"><label>CMPU</label><input type="number" name="nocmpuPercent" id="nocmpuPercent" class="form-control pull-right" step="0.1" onkeypress="validate(event)" value="<s:property value="#session.groupModel.getNocmpuPercent()"/>" /></td>
					</tr>
					<tr> 
								<td class="startTime" ><font color="red">*</font><label>Start Time</label>
									<div class='input-group date datetimepicker startTime pull-right' style="width:55%">
										<input type='text' id="startTime" class="startTime form-control" id="startTime" name="startTime" value="<s:property value="#session.groupModel.getStartTime()"/>" onkeypress="return false;"/> <span class="input-group-addon"> <span
											class="glyphicon glyphicon-calendar"> </span>
										</span>
									</div></td>



								<td class=" endTime"><font color="red">*</font><label>End Time</label>
									<div class='input-group date datetimepicker endTime pull-right' style="width:55%" >
										<input type='text' id="endTime"class="endTime form-control" id="endTime" name="endTime" value="<s:property value="#session.groupModel.getEndTime()"/>" onkeypress="return false;"/> <span
											class="input-group-addon"> <span
											class="glyphicon glyphicon-calendar"> </span>
										</span>
									</div></td>
							</tr>

					
					
					</table>
					<div class= "well well-sm compListCluster ">
				<label>Mapped Competitors</label>
				</div>
				<div class= "well well-sm">
				<label>Wallet Configuration</label>
				
				<table>
				<tr>
				<td class="col-md-3"><label>Instant Discount %</label></td>
				<td><input type="text"
								name="idp" id="idp"
								class="idp form-control pull-center" style="width:55%;"onkeypress="validate(event)"
									value="<s:property value="#session.groupModel.getIdp()"/>"
								 /> 
				</td>
				
				<td class="col-md-4"><label>Wallet Min Absolute</label></td>
								<td><input type="text" id="wma"
								name="wma" class="wma form-control pull-left " style="width:55%;" id="wma" 
								onkeypress="validate(event)" value="<s:property value="#session.groupModel.getWma()"/>"
								 />
								
				</td>
				</tr>
				
				</table>
				</div>
           
					
					<div style="" class="action row">
	<button id="createClusterButton" class="btn btn-primary" text-align:center;"="" onclick="SubmitFunction();" value="create cluster" style="margin-left: 20px;
">update</button>
						<a class="btn btn-primary" href="/PriceSimulator/viewSummary.action" style="
    margin-left: 40px;
">Cancel</a>
					</div>
					</div>
				</div>
				

				
						

						<!-- <input type="button" id="submitForm" value="Create"/> -->
						
						</form>
									
						</div>
						<%-- <div class="filter"><%@include file="../../content/categoryfilter.jsp"%></div> --%>

						<div class="action">
	<div class="report7">
			<div class="bar"></div>
		</div>
	</div>
	<div class="load"></div>

<script type="text/javascript">
			$(document).ready(
					function() {
						
						if($('#BrandRightList > option').length>0){
							$("#brandType").prop('selectedIndex',
									1);
							fetchBrandList("1")
						}
						

						if($('#SellerRightList > option').length>0){
							$("#sellerType").prop('selectedIndex',
									1);
							fetchSellerList("1")	
						}
						
						var index=0;
						var clusterId='<%= ((GroupModel)session.getAttribute("groupModel")).getClusterId() %>';
						var obj='<%= ((GroupModel)session.getAttribute("groupModel")).getFulfillmentType() %>';
						/* var supcCount = 0 ; */
						var supcCount='<%= ((GroupModel)session.getAttribute("groupModel")).getSupcCount() %>'; 
						if(obj!= null && obj!=undefined && obj!='')
						{
							
							
							
							if(clusterId!=null && clusterId!=undefined && clusterId!='' && clusterId>0)
								{
							$("#createClusterButton").html('update');
							$("#clusterName").attr('disabled',true);
								}
							/* document.getElementById("createClusterButton").onclick = function (){ SubmitFunction();}; */
							if(obj=="FC_VOI")
						    	index=1;
						    else if(obj=="DROPSHIP")
						    	index=2;
						    else if(obj=="ONESHIP")
						    	index=3;
						   
							}
						
						
							$("#fulfillmentType").prop('selectedIndex',
									index);
							
							
							
							if(supcCount!= null && supcCount!=undefined && supcCount!='' && supcCount>0)
							{
								$("#selectSupcType").prop('selectedIndex',1);
								SelectSupcType();
								
								$("a[href='/PriceSimulator/Temp/product.xlsx']").prop("href", "exceptions/createclusters.action?downloadSupc=true&clusterId="+clusterId);
								document.getElementById("downLoadLinkSpan").textContent="Download Uploaded SUPC";
							
							}
							
							
							
						
					});

      </script>
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
      
      
</body>
</html>





