<%@page import="com.snapdeal.POJO.SellerRightList"%>
<%@page import="com.snapdeal.monetization.brandconfig.BrandSubcatPojo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Snapdeal Price Simulator</title>
<link type="text/css" rel="stylesheet"
	href="/PriceSimulator/CSS/base/structure.css" media="screen" />


<script src="/PriceSimulator/JS/utility/jquery-1.12.0.min.js"></script>
<style>
#seller_multiselect, #multiselect, #multiselect_to,
	#seller_multiselect_to {
	width: 300px;
}
</style>
<div class="header"><%@include file="../../content/menubar.jsp"%></div>
<div class="filter"><%@include
		file="../../content/categoryfilter.jsp"%></div>
<%-- <script src="/../JS/content/fetchBrandList.js" type="text/javascript" charset="utf-8"></script> --%>




<script type="text/javascript">

	function handleCmTargetChange(radio)
	{
		var data = "";
		if(radio.value == "1")
			data = "CMPU Target";
		else data = "CM %";
		$("#cmTargetChangeMV").html("&nbsp;&nbsp;&nbsp;" + data);
	}
	
	
	
	
	
	var request;
	var requestValid=true;
	
	function validate(){
		return requestValid;
	}
	function validateMultiVariate(){
		var cmpuTarget = document.getElementById("targetCmpuMV");
		var initialOP = document.getElementById("initialOPSetup");
		var opIncrement = document.getElementById("opIncrement");
		var subcatCm = document.getElementById("subcatCm");
		var subcatGm = document.getElementById("subcatGm");
		var subcatCmpu = document.getElementById("subcatCmpu");
		var maxUnit = document.getElementById("maxUnit");
		var sdBoost = document.getElementById("sdBoost");
		var ratingFrom = document.getElementById("ratingFrom");
		var ratingTo = document.getElementById("ratingTo");
		var ratingThreshold = document.getElementById("ratingThreshold");
		var ratingBoost = document.getElementById("ratingBoost");
		var targetDeltaWeightage = document.getElementById("targetDeltaWeightage");
		var subModel1 = document.getElementById("mvpe1");
		var subModel2 = document.getElementById("mvpe2");
		if(cmpuTarget.value=="" || initialOP.value=="" || opIncrement.value=="" || subcatCm.value=="" || subcatGm.value=="" || subcatCmpu.value=="" || maxUnit.value=="" || sdBoost.value=="" || ratingFrom.value=="" || ratingTo.value=="" || ratingThreshold.value=="" || ratingBoost.value=="" || targetDeltaWeightage.value=="" ){
			alert("Null values not allowed");
			return false;
		}
		if(cmpuTarget.value < -1000 || cmpuTarget.value > 1000){
			alert("Cmpu Target value should be between -1000 and 1000");
			return false;
		}
		if(initialOP.value < 0 || initialOP.value > 100){
			alert("Initial OP value should be between 0 and 100");
			return false;
		}
		if(opIncrement.value < 0 || opIncrement.value > 100){
			alert("OP Increment value should be between 0 and 100");
			return false;
		}
		if(subcatCm.value < -1000 || subcatCm.value > 1000){
			alert("Subcat Cm % value should be between -1000 and 1000");
			return false;
		}
		if(subcatGm.value < -1000 || subcatGm.value > 1000){
			alert("Subcat Gm % value should be between -1000 and 1000");
			return false;
		}
		if(subcatCmpu.value < -1000 || subcatCmpu.value > 1000){
			alert("Subcat Cmpu value should be between -1000 and 1000");
			return false;
		}
		if(maxUnit.value < -100 || maxUnit.value > 100){
			alert("Max Unit % value should be between -100 and 100");
			return false;
		}
		if(sdBoost.value < 0 || sdBoost.value > 100){
			alert("SD Boost % value should be between 0 and 100");
			return false;
		}
		if(ratingFrom.value < 0 || ratingFrom.value > 5){
			alert("Rating From  value should be between 0 and 5");
			return false;
		}
		if(ratingTo.value < 0 || ratingTo.value > 5){
			alert("Rating To value should be between 0 and 5");
			return false;
		}
		if(ratingFrom.value > ratingTo.value){
			alert("Rating From value should be less than Rating To");
			return false;
		}
		if(ratingThreshold.value < 0 || ratingThreshold.value > 100){
			alert("Rating Threshold value should be between 0 and 5");
			return false;
		}
		if(ratingBoost.value < 0 || ratingBoost.value > 100){
			alert("Rating Boost % value should be between 0 and 100");
			return false;
		}
		if(targetDeltaWeightage.value < 0 || targetDeltaWeightage.value > 2){
			alert("Target Delta Weightage value should be between 0 and 2");
			return false;
		}
		if(subModel1.checked == false && subModel2.checked == false)
		{
			alert("No submodel Selected");
			return false;
		}
	}
	function clientSideValidateBrand(){
		;
		var priceBucket= document.getElementById("priceBucketBrand");
		var priceBucketCap=document.getElementById("priceBucketCapBrand")
		var omsLiveIntervalBrand=document.getElementById("omsLiveIntervalBrand");
		var brand=document.getElementById("brandListing");
		var cm=document.getElementById("targetCmBrand");
		var discountBucket=document.getElementById("discountBucketBrand");
		var discountBucketCap=document.getElementById("discountBucketCapBrand");
		var priceBucket=document.getElementById("priceBucketBrand");
		var priceBucketCap=document.getElementById("priceBucketCapBrand");
		var pogSetting=document.getElementById("pogSetting");
		var discountConstraint=document.getElementById("discountConstraint");
		var gm=document.getElementById("targetGmBrand");
		var ratingFrom=document.getElementById("sellerRatingFromBrand");
		var ratingTo=document.getElementById("sellerRatingToBrand");
		var az=document.getElementById("az");
		var fk=document.getElementById("fk");
		var jb=document.getElementById("jb");
		var taRatingFrom=document.getElementById("taSellerRatingFromBrand");
		var taRatingTo=document.getElementById("taSellerRatingToBrand");
		if(brand.value==null || brand.value=="" || brand.value=="-1"){
			alert("Brand can not be null.");
			return false;
		}
		if(cm.value<-100 || cm.value>100){
			alert("Cm value should be between -100 and 100");
			return false;
		}
		if(gm.value==null || gm.value==""){
			alert("Target Gm can not be null.");
			return false;
		}
		if(gm.value<-100 || gm.value>100){
			alert("Gm value should be between -100 and 100");
			return false;
		}
		if((discountBucket.value<0) || discountBucket.value>100){
			alert("Discount Bucket Interval value should be between 0 and 100");
			return false;
		}
		if(ratingFrom.value<0 || ratingFrom.value>5 || ratingTo.value<0 || ratingTo.value>5){
			alert("Seller Rating should be between 0 and 5");
			return false;
		}
		if(ratingFrom.value > ratingTo.value){
			alert("Seller rating From should be less than Seller rating To");
			return false;
		}
		if(taRatingFrom.value<0 || taRatingFrom.value>5 || taRatingTo.value<0 || taRatingTo.value>5){
			alert("TA Seller Rating should be between 0 and 5");
			return false;
		}
		if(taRatingFrom.value > taRatingTo.value){
			alert("TA Seller rating From should be less than Seller rating To");
			return false;
		}
		if((discountBucketCap.value<0) || discountBucketCap.value>100){
			alert("Discount Bucket Cap value should be between 0 and 100");
			return false;
		}
		if(discountBucketCap.value <  discountBucket.value){
			alert("Discount Bucket Cap should be greater than Discount Bucket Interval");
			return false;
		} 
		if(priceBucket.value < 0 )
		{
		alert("Price Bucket Interval should be greater than 0.");
		return false;
		}
		if(priceBucketCap.value < 0 )
		{
		alert("Price Bucket Cap should be greater than 0.");
		return false;
		}
		if(priceBucket.value >  priceBucketCap.value){
			alert("Price Bucket Cap should be greater than Price Bucket Interval");
			return false;
		} 
		if(pogSetting.value<-100 || pogSetting.value>100){
			alert("Pog Settings value should be between 0 and 100");
			return false;
		}
		if(discountConstraint.value<0 || discountConstraint.value>100){
			alert("Discount Constraints Brand value should be between 0 and 100");
			return false;
		}
		if(az.value < 0 || fk.value < 0 || jb.value < 0)
		{
		alert("Competitor Weights should be greater than 0.");
		return false;
		}
		if(modelFrequencyBrand==null || modelFrequencyBrand.value=="")
		{
		alert("Please select Model Frequency.");
		return false;
		}
		
		
	}
	function clinetSideValidate(){
		
		var minSlopelimit= document.getElementById("minSlopelimit");

		var slopeBucket= document.getElementById("slopeBucket");
		
		var maxSlopeLimit= document.getElementById("maxSlopeLimit");
		var priceBucket= document.getElementById("priceBucket");
		var omsLiveInterval=document.getElementById("omsLiveInterval");
		var numberOfDaysToProcess=document.getElementById("numberOfDaysToProcess");
		var cmpuConstraint=document.getElementById("cmpuCap");
		if(minSlopelimit.value==null || maxSlopeLimit.value==null ||slopeBucket.value==null || priceBucket.value==null||minSlopelimit.value=="" || maxSlopeLimit.value=="" ||slopeBucket.value=="" || priceBucket.value=="")
			{
			alert("Null values not allowed.");
			return false;
			}
		if(omsLiveInterval==null || omsLiveInterval.value=="")
			{
			alert("Please select OMS interval.");
			return false;
			}
		if(minSlopelimit!=null && minSlopelimit!=undefined)
		 if(!(parseFloat(minSlopelimit.value)>0))
			{
			alert("Min Slope Limit should be greater than 0");
			return false;
			}
		
		if(maxSlopeLimit!=null && maxSlopeLimit!=undefined){
			
			 if(!(parseFloat(maxSlopeLimit.value)>0))
				{
				alert("Max Slope Limit should be greater than 0");
				return false;
				}
			 if((parseFloat(maxSlopeLimit.value))<=(parseFloat(minSlopelimit.value)))
				{
				alert("Max Slope Limit should be greater than Min Slope Limit");
				return false;
				}
			 
		}
		if(slopeBucket!=null && slopeBucket!=undefined)
			if(!(parseFloat(slopeBucket.value)>0))
				{
				alert("Slope Bucket should be greater than equal to 0");
				return false;
				}
		if(priceBucket!=null && priceBucket!=undefined)
			if(!(parseFloat(priceBucket.value)>0))
				{
				alert("Price Bucket should be greater than 0");
				return false;
				}
		if(cmpuConstraint.value<-2000 || cmpuConstraint.value>2000){
			alert("Cmpu Cap should be between -2000 and 2000");
			return false;
		}
		if(numberOfDaysToProcess!=null && numberOfDaysToProcess!=undefined)
			if(!(parseFloat(numberOfDaysToProcess.value)>0))
				{
				alert("Number Of Days To Process should be greater than 0");
				return false;
				}
			
		return true;
	}
	
	function setTypeAndSubmit(valU) {
		
		
		if(valU==0){
		var r = confirm("Are you sure you want to delete.");
		if (r == false) {
			requestValid=false;
		   return false;
		}
		else
			{
			requestValid=true;
			}
		}
		
		if(valU==1)
			{
			requestValid=clinetSideValidate();
			}
		
		if(requestValid==false)
			return false;
		else{
		document.getElementById('statusField').value = valU ;
		document.manageSubcatForm.submit();
		}
		
		
	}
	
	function setBrandTypeAndSubmit(valU) {
		
		
		if(valU==0){
		var r = confirm("Are you sure you want to delete.");
		if (r == false) {
			requestValid=false;
		   return false;
		}
		else
			{
			requestValid=true;
			}
		}
		
		if(valU==1)
			{
			requestValid=clientSideValidateBrand();
			}
		if(requestValid==false)
			return false;
		else{
		document.getElementById('statusFieldBrand').value = valU ;
		document.manageBrandForm.submit();
		}
		
		
	}
	
	function setMVTypeAndSubmit(val){
		getIsLongTailValue();
		if(val==0){
			var r = confirm("Are you sure you want to delete.");
			if (r == false) {
				requestValid=false;
			 	return false;
			}
			else{
				requestValid=true;
			}
		}
			
		if(val==1)
		{
			requestValid=validateMultiVariate();
		}
		if(requestValid==false)
			return false;
		else{
			document.getElementById('statusMV').value = val; ;
			document.manageBrandForm.submit();
		}
		
	}
	function selectAll(){
		$("#brandListing option").each(function(index){
				 $(this).prop( "selected", true );
		}); 
		$(".selected").prop("selected", false);
	}
	
( function($) {
	$(document).ready(function(){
		
		$.ajax(
			{
				type : "POST",
				dataType: 'html',
				url : '/PriceSimulator/ajax/brandlisting.action',
				success : function(data)
				{
					;
					if(data != -1)
					{	if(data== 0){
						document.getElementById("showHide").style.display = 'none';
						var temp ="<label > Brand :</label>";
						temp = temp + "<span style='color: red'>There is no brand to select. Select any other option.</span>";
						$("table.brandList").append(temp);
					}else{
						data=data.replace(/\n/g,"");
						var list = data.split("::");
						var temp ="<label > Brand :</label> <select required multiple = 'multiple' name = 'brandListing' id='brandListing' onchange='onBrandValueChange()'>";
						temp = temp +"<option value='-1' class='selected' selected='selected'>Select</option>";
						temp = temp +"<option value = '-10' onclick = 'selectAll()' >ALL</option>";

						$.each(list, function(idx, obj)
						{
							temp = temp + "<option value='" +obj.split(":")[0]+ "'>" +obj.split(":")[1]+ "</option>";
						});
						temp=temp + "</select>"
						$("table.brandList").append(temp);
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

} ) ( jQuery );

( function($) {
	$(document).ready(function(){
		
		$.ajax(
			{
				type : "POST",
				dataType: 'html',
				url : '/PriceSimulator/exceptions/multiVariateView.action',
				success : function(data)
				{
					data=data.replace(/&quot;/g,"\"");
					
					data = JSON.parse(data);
					var jobSubmodelId = data["jobSubmodelId"];
					if (jobSubmodelId != "0") {
						document.getElementById("mvpe"+jobSubmodelId).checked = true;
					}
					var data1 = "";
					if(jobSubmodelId == "1")
						data1 = "CMPU Target";
					else data1 = "CM %";
					$("#cmTargetChangeMV").html("&nbsp;&nbsp;&nbsp;" + data1);
					var targetCmpuMV=data["targetCmpuMV"];
						$("#targetCmpuMV").attr(("value"),targetCmpuMV);
					var omsInterval = data["omsInterval"];
						$("#omsInterval").val(omsInterval);
					var elasticValue = data["elasticValue"];
					$("#elasticValue").val(elasticValue);
					var initialOPSetup=data["initialOPSetup"];
						$("#initialOPSetup").attr(("value"),initialOPSetup);
					var opIncrement=data["opIncrement"];
						$("#opIncrement").attr(("value"),opIncrement);
					var subcatCm=data["subcatCm"];
						$("#subcatCm").attr(("value"),subcatCm);
					var subcatGm=data["subcatGm"];
						$("#subcatGm").attr(("value"),subcatGm);
					var subcatCmpu=data["subcatCmpu"];
						$("#subcatCmpu").attr(("value"),subcatCmpu);
					var maxUnit=data["maxUnit"];
						$("#maxUnit").attr(("value"),maxUnit);
					var sdBoost=data["sdBoost"];
						$("#sdBoost").attr(("value"),sdBoost);
					var ratingFrom=data["ratingFrom"];
						$("#ratingFrom").attr(("value"),ratingFrom);
					var ratingTo=data["ratingTo"];
						$("#ratingTo").attr(("value"),ratingTo);
					var ratingBoost=data["ratingBoost"];
						$("#ratingBoost").attr(("value"),ratingBoost);
					var ratingThreshold=data["ratingThreshold"];
						$("#ratingThreshold").attr(("value"),ratingThreshold);
					var targetDeltaWeightage=data["targetDeltaWeightage"];
						$("#targetDeltaWeightage").attr(("value"),targetDeltaWeightage);
					var status = data["statusMV"];
					var isLongTail = data["isLongtail"];
					if(isLongTail==1){
						$("isLongTail").attr(("value"), 1);
						document.getElementById("isLongTail").checked=true;
					} 
					else{
						$("isLongTail").attr(("value"), 0);
					}
					if(status==1){
						document.getElementById("errorMV").setAttribute("class", "display-none");
					}
					var eventType=data["eventType"];
					 $(".radioBox input").each(function(index){
						  if($(this).val()==eventType){
							  $(this).prop( "checked", true );
						  }
						});
					
				}
			});
	});

} ) ( jQuery );
	 $(document).ready(
			function() {
				
				var valu = $("#intervalSelect").val() ;
				var index=0;
				switch(valu){
				case "30":index="1";break;
				case "60":index="2";break;
				case "90":index="3";break;
				case "120":index="4";break;
				case "180":index="5";break;
				case "240":index="6";break;
				case "360":index="7";break;
				case "480":index="8";break;
				case "600":index="9";break;
				case "720":index="10";break;
				case "960":index="11";break;
				case "1200":index="12";break;
				case "1440":index="13";break;
				}
				if ( index ==  "0" ) {
					index = "1" ;
				}
				$("#omsLiveInterval").prop('selectedIndex',
						index);
				
				var checkedValue =<%=request.getParameter("jobSubModelId")%>;
				if(checkedValue == null){
					checkedValue = "2"
				}
				var data = "";
				if(checkedValue == "1")
					data = "CMPU Target";
				else data = "CM %";
				$("#cmTargetChangeMV").html("&nbsp;&nbsp;&nbsp;" + data);
				document.getElementById("mvpe" +checkedValue).checked = true;
			});
	
	
</script>
<style>
       .display-none {
           display: none;
       }
   </style>
</head>


<body>
<script type="text/javascript">
		var obj='<%= session.getAttribute("report") %>';
		if(obj!= null && obj!=undefined && obj!='')
			{
			
			if(obj=='Success' || obj=='Some Error Occurred')
		alert('<%= session.getAttribute("report") %>');
			
			if(obj=='failure')
				alert('Subcat Live on PS.Please delete rules from PS.');
			}		
</script>

    
       


	<div id="message" style="margin-left: 35%; color: green">
		<%
			Object object = request.getAttribute("message");

			if (object != null)
				out.println(object);
		%>
	</div>

	<div class="content" style="width: 70%;">

		<script>

			var showForm = function() {
				$('#select-container').empty();
				var allForms = document.getElementsByTagName('form');
				var dropdown = document.getElementById("jobMasterId");
				if (dropdown.value != "-1") {
					var form = document.getElementById(dropdown.value);
					for (var i = 0; i < allForms.length; i++) {
						allForms[i].setAttribute("class", "display-none");
					}
					form.setAttribute("class", "");
					document.getElementById("message").setAttribute("class", "display-none");
				}
				if(dropdown.value == "2")
				addSelect('select-container');
			}
			var onBrandValueChange = function(){
				var brandId =  document.getElementById("brandListing");
				if(brandId!==null && brandId.value!==""){
					$.ajax(
							{
								type : "POST",
								dataType: 'html',
								url : 'exceptions/brandConfView.action',
								data : { brandListing:brandId.value},
								success : function(data)
								{	
									data=data.replace(/&quot;/g,"\"");
									data = JSON.parse(data);
									var bucketConf = data["bucketConf"];
									var TargetCMBrand=data["targetCmBrand"];
									$("#targetCmBrand").attr(("value"),TargetCMBrand);
									var TargetGMBrand=data["targetGmBrand"];
										$("#targetGmBrand").attr(("value"),TargetGMBrand);
									var TargetCMPUBrand=data["targetCmpuBrand"];
										$("#targetCmpuBrand").attr(("value"),TargetCMPUBrand);
									var sellerfrm=data["sellerRatingFrom"];
										$("#sellerRatingFromBrand").attr(("value"),sellerfrm);
									var sellerto=data["sellerRatingTo"];
										$("#sellerRatingToBrand").attr(("value"),sellerto);
									var taSellerfrm=data["taSellerRatingFrom"];
									$("#taSellerRatingFromBrand").attr(("value"),taSellerfrm);
									var taSellerto=data["taSellerRatingTo"];
									$("#taSellerRatingToBrand").attr(("value"),taSellerto);
									var dbb=data["discountBucketBrand"];
										$("#discountBucketBrand").attr(("value"),dbb);
									var dbcb=data["discountBucketCapBrand"];
										$("#discountBucketCapBrand").attr(("value"),dbcb);
									var pbb=data["priceBucketBrand"];
										$("#priceBucketBrand").attr(("value"),pbb);
									var pbcb=data["priceBucketCapBrand"];
										$("#priceBucketCapBrand").attr(("value"),pbcb);
									var pogs=data["pogSetting"];
										$("#pogSetting").attr(("value"),pogs);
									var pc=data["pogConstraint"];
									 $(".radioBox input").each(function(index){
										  if($(this).val()==pc){
											  $(this).prop( "checked", true );
										  }
										}); 
									var dc=data["discountConstraint"];
										$("#discountConstraint").attr(("value"),dc);
									var az1=data['compWeight']["AZ"];
										$("#az").attr(("value"),az1);
									var fk1=data['compWeight']["FK"];
										$("#fk").attr(("value"),fk1);
									var jb1=data['compWeight']["JB"];
										$("#jb").attr(("value"),jb1);
									var my1=data['compWeight']["MY"];
										$("#my").attr(("value"),my1);
									var status = data["statusBrand"];
									var isMatchCompetition = data["isMatchCompetition"];
									if(isMatchCompetition==1){
										$("isMatchCompetitionYes").attr(("value"), 1);
										document.getElementById("isMatchCompetitionYes").checked=true;
									} 
									else{
										$("isMatchCompetitionNo").attr(("value"), 2);
										document.getElementById("isMatchCompetitionNo").checked=true;
									}
									var countBrandsSelected = $("select[name='brandListing'] option:selected").length;
                                	if(countBrandsSelected>1){
                                		document.getElementById("isMatchCompetitionYes").checked=true;
                                	}
									match();
                                    $.each(JSON.parse(bucketConf), function(idx, obj) {
                                    	var countBrandSelected = $("select[name='brandListing'] option:selected").length;
                                    	
                                    	if(countBrandSelected>1){
                                    		return;
                                    	}
                                    	var start;
                                    	var end = obj.bucketStep*obj.bucketId;
                                    	var cap= +document.getElementById("discountBucketCapBrand").value;
                                    	if(obj.bucketId == 1){
                                    		start = 0;
                                    	}
                                    	else
                                    		start = obj.bucketStep*(obj.bucketId-1)+1;
                                    	if(end > cap){
                                    		end=end-1;
                                    	}
                                        var selected = start+'-'+end;
                                        var range = document.getElementById("discountBucketBrand").value;
                                        
                                        var id= obj.bucketId-1;
                                        var bucketId= obj.bucketId;
                                        var numberOfRows = $("#displayresponse tr").length ;
                                        var counts=0;
                                        if (numberOfRows === 0 ) {
                                            var thead = "<tr><td>" +"Discount bucket&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>" 
                                    		if(document.getElementById('isMatchCompetitionNo').checked){
                                    			thead += "<td> Absolute POG &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>"
                                    		}else{
                                    			thead += "<td> Discount % Top up&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td> <td> Additional POGs %&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>"
                                    		}
                                            
                                            $("#displayresponse thead").append(thead);
                                            $("#displayresponse").removeClass("hidden");
                                        }
                                        var i=0;
                                         var data="<tr><td >"+selected+"</td>";
                                         if(document.getElementById('isMatchCompetitionNo').checked){
                                        	 data +="<td><input type='text' onkeypress='validatePositiveInput(event)' id='absoluteSdPogs"+numberOfRows+"' name='discountBucketList["+numberOfRows+"].absoluteSdPogs' value='"+obj.absoluteSdPogs+"'/></td>"
                                         }else{
                                         	data +="<td><input type='text' maxlength='4' onkeyup='this.value = minmax(this.value, 100,event)' id='discountTopUp"+numberOfRows+"' name='discountBucketList["+numberOfRows+"].discountTopUp' value='"+obj.discountTopUp+"' /></td>"
                                        
                                         	+" <td><input type='text'onkeypress='validatePositiveInput(event)' id='additionalPOGs"+numberOfRows+"' name='discountBucketList["+numberOfRows+"].additionalPOGs' value= '"+obj.addtionalPogPercent+"' /></td>"
                                         }
                                         	data+=" <td style='display:none;'><input type='text' class='hidden' name='discountBucketList["+numberOfRows+"].bucketId' value = '" + bucketId + "'/></td>"
                                         	data +="<td><button  type='button' style='width:50px;' onclick='deleteRow ("+counts+")' class='btn btn-sm btn-danger'>X </button> </td>"
                                         +"</tr>";
                                         $("#selectDiscountBucket option[value='"+selected+"']").remove();
                                        $("#displayresponse tbody").append(data);
                                        $("#selectDiscountBucket id[value='"+selected+"']").attr("disabled", true);
                                        counts+=1;
                                        
                                    });
									if(status==1){
										document.getElementById("errorBD").setAttribute("class", "display-none");
									}
									if(status==0){
										document.getElementById("errorBD").setAttribute("class", "display-block");
									}
									var interval = data["modelFrequencyBrand"];
									 $("#modelFrequencyBrand option").each(function(index){
										  if($(this).val()==interval){
											  $(this).prop( "selected", true );
										  }
										}); 
									}	
							});
				}
				else{
					$("#targetCmBrand").attr(("value"),"0");
					$("#targetGmBrand").attr(("value"),"0");
					$("#targetCmpuBrand").attr(("value"),"0");
					$("#sellerRatingFromBrand").attr(("value"),"3.5");
					$("#sellerRatingToBrand").attr(("value"),"5");
					$("#taSellerRatingFromBrand").attr(("value"),"3.5");
					$("#taSellerRatingToBrand").attr(("value"),"5");
					$("#discountBucketBrand").attr(("value"),"10");
					$("#discountBucketCapBrand").attr(("value"),"99");
					$("#priceBucketBrand").attr(("value"),"1000");
					$("#priceBucketCapBrand").attr(("value"),"10000000");
					$("#pogSetting").attr(("value"),"0");
					$("#discountConstraint").attr(("value"),"100");
					$("#fk").attr(("value"),"1");
					$("#az").attr(("value"),"1");
					$("#jb").attr(("value"),"1");
					$("#my").attr(("value"),"1");
					document.getElementById("errorBD").setAttribute("class", "display-block");
					addSelect('select-container');
				}
			}
		</script>
		<br><br><br><br><br><br>

		<table id="Config">
			<tr>
				<td>&nbsp;&nbsp;&nbsp;Analytics Decision Rule<br></td>
				<td><select required name="jobMasterId" id="jobMasterId"
					class="decimal" onchange="showForm()">

						<option selected ="selected" value="-1">Select option</option>
						<option value='1'>Elasticity Model</option>
						<option value='2'>Brand Model</option>
						<option value = '3' >MultiVariate Model</option>
				</select>
				</td>
			</tr>
		</table>


				<form action="priceAnalyticsConfUpdate.action" id="1"
						class="display-none" name="manageSubcatForm" method="POST"
						onsubmit="return validate()">

						<br> <br>

						<div class="errors">
							<s:property value="#session.message" />
						</div>


						<div class="errors">
							<%
					Integer status = request.getAttribute("status") != null ? (Integer) request
							.getAttribute("status") : 0;
				%>
							<%
					if (status == 0) {
				%>
							<span style="color: red">This configuration is either
								inactive or deleted. </span>
							<%
					}
				%>
						</div>


						<%
									Double targetCm = request.getAttribute("targetCm") != null ? (Double)request
													.getAttribute("targetCm") : 0;
									Integer priceBucket = request.getAttribute("priceBucket")!=null ?(Integer) request
													.getAttribute("priceBucket"):0;
									Double maxSlopeLimit = request.getAttribute("maxSlopeLimit") != null ? (Double)request
													.getAttribute("maxSlopeLimit") : 0;
									Double minSlopeLimit = request.getAttribute("minSlopeLimit") != null ? (Double)request
													.getAttribute("minSlopeLimit") : 0;
									Double maxBetaLimit = request.getAttribute("maxBetaLimit") != null ? (Double)request
													.getAttribute("maxBetaLimit") : 0;
									Double defaultBeta = request.getAttribute("defaultBeta") != null ? (Double)request
													.getAttribute("defaultBeta") : 0;	
									Integer omsLiveInterval = request.getAttribute("omsLiveInterval")!=null ?(Integer) request
													.getAttribute("omsLiveInterval"):0;		
									Integer noOfDaysToProcess = request.getAttribute("noOfDaysToProcess")!=null ?(Integer) request
													.getAttribute("noOfDaysToProcess"):0;																	
									Double sellerRatingFrom = request.getAttribute("sellerRatingFrom") != null ? (Double)request
													.getAttribute("sellerRatingFrom") : 0;
									Double sellerRatingTo = request.getAttribute("sellerRatingTo") != null ? (Double) request
													.getAttribute("sellerRatingTo") : 0;
									Integer maxOfferPriceDelta = request.getAttribute("maxOfferPriceDelta")!=null ?(Integer) request
													.getAttribute("maxOfferPriceDelta"):0;
									Integer offerPriceDeltaAllowed = request.getAttribute("offerPriceDeltaAllowed")!=null ?(Integer) request
													.getAttribute("offerPriceDeltaAllowed"):0;
									Double cmCap = request.getAttribute("cmCap") != null ? (Double)request
													.getAttribute("cmCap") : 0;
									Double cmpuCap = request.getAttribute("cmpuCap") != null ? (Double)request
															.getAttribute("cmpuCap") : 0;
									Integer jobMasterIdOption = request.getAttribute("jobMasterId")!=null ?(Integer) request
													.getAttribute("jobMasterId"):0;
									Double slopeBucket = request.getAttribute("slopeBucket") != null ? (Double)request
													.getAttribute("slopeBucket") : 0;	
									Double hourlyDeltaWeightage = request.getAttribute("hourlyDeltaWeightage") != null ? (Double)request
													.getAttribute("hourlyDeltaWeightage") : 0;
									Double lastHourDeltaWeightage = request.getAttribute("lastHourDeltaWeightage") != null ? (Double)request
													.getAttribute("lastHourDeltaWeightage") : 0;
									Integer minTxnCriteria = request.getAttribute("minTxnCriteria")!=null ?(Integer) request
													.getAttribute("minTxnCriteria"):0;
									
								%>

						<input type="hidden" id="masterJobIdTxt" name="jobMasterId"
							value="1" /> <input type="hidden"
							id="intervalSelect" value="<%=omsLiveInterval %>" />




						<div>
							<br> <br>

							<div id="formPart2" style="display: block">
								<table id="Config">
									
									<tr>
										<td>&nbsp;&nbsp;&nbsp;Target CMPU</td>
										<td><input type="text" name="targetCm" id="targetCm"
											type="number" onkeypress="validateInput(event)"
											class="decimal" value="<%=targetCm%>" /></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;Price Bucket</td>
										<td><input type="text" name="priceBucket"
											id="priceBucket" type="number"
											onkeypress="validatePositiveFractionalInput(event)"
											class="decimal" value="<%=priceBucket%>" /></td>

									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;Maximum Slope Limit</td>
										<td><input type="text" name="maxSlopeLimit"
											id="maxSlopeLimit" type="number"
											onkeypress="validateInput(event)" class="decimal"
											value="<%=maxSlopeLimit%>" /></td>

									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;Minimum Slope Limit</td>
										<td><input type="text" name="minSlopeLimit"
											id="minSlopelimit" type="number"
											onkeypress="validateInput(event)" class="decimal"
											value="<%=minSlopeLimit%>" /></td>

									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;Slope Bucket</td>
										<td><input type="text" name="slopeBucket"
											id="slopeBucket" type="number"
											onkeypress="validateInput(event)" class="decimal"
											value="<%=slopeBucket%>" /></td>

									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;Max Beta Limit</td>
										<td><input type="text" name="maxBetaLimit"
											id="maxBetaLimit" type="number"
											onkeypress="validateInput(event)" class="decimal"
											value="<%=maxBetaLimit%>" /></td>

									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;Default Beta</td>
										<td><input type="text" name="defaultBeta"
											id="defaultBeta" type="number"
											onkeypress="validateInput(event)" class="decimal"
											value="<%=defaultBeta%>" /></td>

									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;OMS Live Interval<br></td>
										<td><select required name="omsLiveInterval"
											id="omsLiveInterval" class="decimal">

												<option value="">Select option</option>
												<option value='30'>30 Minutes</option>
												<option value='60'>1 Hour</option>
												<option value='90'>1 Hour 30 Minutes</option>
												<option value='120'>2 Hours</option>
												<option value='180'>3 Hours</option>
												<option value='240'>4 Hours</option>
												<option value='360'>6 Hours</option>
												<option value='480'>8 Hours</option>
												<option value='600'>10 Hours</option>
												<option value='720'>12 Hours</option>
												<option value='960'>16 Hours</option>
												<option value='1200'>20 Hours</option>
												<option value='1440'>24 Hours</option>
										</select></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;Number of Days to Process</td>
										<td><input type="text" name="noOfDaysToProcess"
											id="numberOfDaysToProcess" type="number"
											onkeypress="validatePositiveInput(event)" class="decimal"
											value="<%=noOfDaysToProcess==0?30:noOfDaysToProcess%>" /></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;Minimum Transaction Count for
											Elasticity Calculation</td>
										<td><input type="text" name="minTxnCriteria"
											id="minTxnCriteria" type="number"
											onkeypress="validatePositiveInput(event)" class="decimal"
											value="<%=minTxnCriteria%>" /></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;Seller Rating From</td>
										<td><input type="text" name="sellerRatingFrom"
											type="number" id="sellerRatingFrom" class="decimal"
											onkeypress="validatePositiveFractionalInput(event)"
											value="<%=sellerRatingFrom%>" /></td>

										<td>&nbsp;&nbsp;&nbsp;Seller Rating To</td>
										<td><input type="text" name="sellerRatingTo"
											type="number"
											onkeypress="validatePositiveFractionalInput(event)"
											id="sellerRatingTo" class="decimal"
											value="<%=sellerRatingTo%>" /></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;Max Offer Price Delta</td>
										<td><input type="text" name="maxOfferPriceDelta"
											id="maxOfferPriceDelta" type="number"
											onkeypress="validatePositiveFractionalInput(event)"
											class="decimal" value="<%=maxOfferPriceDelta%>" /></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;Offer price Delta Allowed</td>
										<td><input type="text" name="offerPriceDeltaAllowed"
											id="offerPriceDeltaAllowed" type="number"
											onkeypress="validatePositiveFractionalInput(event)"
											class="decimal" value="<%=offerPriceDeltaAllowed%>" /></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;CM Cap</td>
										<td><input type="text" name="cmCap" id="cmCap"
											type="number" onkeypress="validateInput(event)"
											class="decimal" value="<%=cmCap%>" /></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;CMPU Constraint</td>
										<td><input type="text" name="cmpuCap" id="cmpuCap"
											type="number" onkeypress="validateInput(event)"
											class="decimal" value="<%=cmpuCap%>" /></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;Hourly Delta Weightage</td>
										<td><input type="text" name="hourlyDeltaWeightage"
											id="hourlyDeltaWeightage" type="number"
											onkeypress="validatePositiveFractionalInput(event)"
											class="decimal" value="<%=hourlyDeltaWeightage%>" /></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;Last Hour Delta Weightage</td>
										<td><input type="text" name="lastHourDeltaWeightage"
											id="lastHourDeltaWeightage" type="number"
											onkeypress="validatePositiveFractionalInput(event)"
											class="decimal" value="<%=lastHourDeltaWeightage%>" /></td>
									</tr>
									<tr>
										<td><input type="hidden" name="status" id="statusField" /></td>
									</tr>



								</table>
								<button onclick="setTypeAndSubmit(1);" value="Delete">Update
								</button>
								<button onclick="setTypeAndSubmit(0);" value="Delete">Delete
								</button>
							</div>
						</div>
						<br> <br>
					</form>
					
					
						
					<form action="brandConfUpdate.action" id="2"
						class="display-none" name="manageBrandForm" method="POST"
						onsubmit="return validate()">

						<br> <br>
						<div class="errors" id = "errorBD">
							
							<span style="color: red">This configuration is either
								inactive or deleted. </span>
						</div>

						 <input type="hidden" id="masterJobIdTxt" name="jobMasterId"
							value="2" />

						<div>
							<br> <br>
							<table class="brandList "></table>
							<div id ="showHide">
							<div id="formPart2" style="display: block">
								<table id="Config">

									<tr>
										<div id="matchComp">Match Competition &nbsp;&nbsp;&nbsp;
											Yes<input type="radio" id="isMatchCompetitionYes" checked="checked" name="isMatchCompetition" value="1" onclick="match()">
 											No <input type="radio" id="isMatchCompetitionNo" name="isMatchCompetition" value="2" onclick="match()">
										</div>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;CM Constraint %</td>
										<td><input type="text" name="targetCmBrand" id="targetCmBrand"
											type="number" onkeypress="validateInput(event)"
											class="decimal" value="0" /></td>
										<td>&nbsp;&nbsp;&nbsp;Model Frequency<br></td>
										<td><select required name="modelFrequencyBrand"
											id="modelFrequencyBrand" class="decimal interval">

												<option value='30'>30 Minutes</option>
												<option value='60'>1 Hour</option>
												<option value='90'>1 Hour 30 Minutes</option>
												<option value='120'>2 Hours</option>
												<option value='180'>3 Hours</option>
												<option value='240'>4 Hours</option>
												<option value='360'>6 Hours</option>
												<option value='480'>8 Hours</option>
												<option value='600'>10 Hours</option>
												<option value='720'>12 Hours</option>
												<option value='960'>16 Hours</option>
												<option value='1200'>20 Hours</option>
											
												<option value='1440'  selected="selected">24 Hours</option>
										
											
										</select></td>
									</tr>
									<tr>
									<td>&nbsp;&nbsp;&nbsp;GM Constraint %</td>
										<td><input type="text" name="targetGmBrand" id="targetGmBrand"
											type="number" onkeypress="validateInput(event)"
											class="decimal" value="0" /></td>
									</tr>
									<tr>
									<td>&nbsp;&nbsp;&nbsp;CMPU Constraint (ABS)</td>
										<td><input type="text" name="targetCmpuBrand" id="targetCmpuBrand"
											type="number" onkeypress="validateInput(event)"
											class="decimal" value="0" /></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;Seller Rating From</td>
										<td><input type="text" name="sellerRatingFrom"
											type="number" id="sellerRatingFromBrand" class="decimal"
											onkeypress="validatePositiveFractionalInput(event)"
											value="3.5" /></td>

										<td>&nbsp;&nbsp;&nbsp;Seller Rating To</td>
										<td><input type="text" name="sellerRatingTo"
											type="number"
											onkeypress="validatePositiveFractionalInput(event)"
											id="sellerRatingToBrand" class="decimal"
											value="5" /></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;TA Seller Rating From</td>
										<td><input type="text" name="taSellerRatingFrom"
											type="number" id="taSellerRatingFromBrand" class="decimal"
											onkeypress="validatePositiveFractionalInput(event)"
											value="3.5" /></td>

										<td>&nbsp;&nbsp;&nbsp;TA Seller Rating To</td>
										<td><input type="text" name="taSellerRatingTo"
											type="number"
											onkeypress="validatePositiveFractionalInput(event)"
											id="taSellerRatingToBrand" class="decimal"
											value="5" /></td>
									</tr>
									
								</table><br>
								<fieldset>
									<legend>Discount Bucket</legend>
							<table id="Config">
								<tr>
									<td>&nbsp;&nbsp;&nbsp;Discount Bucket Interval %</td>
									<td><input type="text" name="discountBucketBrand"
										id="discountBucketBrand" type="number"
										onkeypress="validatePositiveFractionalInput(event)"
										onchange="addSelect('select-container');"
										class="decimal" value="10" /></td>

									<td>&nbsp;&nbsp;&nbsp;Discount Bucket Cap %</td>
									<td><input type="text" name="discountBucketCapBrand"
										id="discountBucketCapBrand" type="number"
										onkeypress="validatePositiveFractionalInput(event)"
										onchange="addSelect('select-container');"
										class="decimal" value="99" /></td>

								</tr>
								<tr>
									<td>&nbsp;&nbsp;&nbsp;Select Discount Bucket</td>
									<td><div id="select-container"></div>
									</td>
								</tr>
								<table id="displayresponse" class="hidden" style="table-layout:fixed">
									<thead>
									</thead>
									<tbody id="displayresponse1">

									</tbody>
								</table>
							</table>
							<br><br>
								</fieldset><br>
								<fieldset id="priceBucketField">
									<legend>Price Bucket</legend>
									<table id="Config">
									<tr>
										<td>&nbsp;&nbsp;&nbsp;Price Bucket Interval</td>
										<td><input type="text" name="priceBucketBrand"
											id="priceBucketBrand" type="number"
											onkeypress="validatePositiveFractionalInput(event)"
											class="decimal" value="1000" /></td>

										<td>&nbsp;&nbsp;&nbsp;Price Bucket Cap</td>
										<td><input type="text" name="priceBucketCapBrand"
											id="priceBucketCapBrand" type="number"
											onkeypress="validatePositiveFractionalInput(event)"
											class="decimal" value="10000000" /></td>

									</tr>
									</table><br><br>
								</fieldset><br>
								<table  id="Config">
									<tr>
										<td>&nbsp;&nbsp;&nbsp;Extra POGs Setting %</td>
										<td><input type="text" name="pogSetting"
											id="pogSetting" type="number"
											onkeypress="validateInput(event)"
											class="decimal" value="0" /></td>
										<td class="radioBox">Discount
            								<input type="radio" name="pogConstraint" checked="checked" id="statusAct" class="Discount" value="1" />
    										CM
       									    <input type="radio" name="pogConstraint" id="statusAct" class="Cm" value="2"/>
       									    GM
       									    <input type="radio" name="pogConstraint" id="statusAct" class="Gm" value="3"/>
       									</td>

									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;Discount Constraint by Brand %</td>
										<td><input type="text" name="discountConstraint"
											id="discountConstraint" type="number"
											onkeypress="validatePositiveFractionalInput(event)"
											class="decimal" value="100" /></td>

									</tr>
								</table><br>
								<fieldset id="compWeightField">
									<legend>Competitor Weights</legend>
									<table id="Config">
									<tr>
										<td>&nbsp;&nbsp;&nbsp;Amazon</td>
										<td><input type="text" name="az" id="az"
											type="number" onkeypress="validateInput(event)"
											class="decimal" value="1" /></td>
										<td>&nbsp;&nbsp;&nbsp;Jabong</td>
										<td><input type="text" name="jb" id="jb"
											type="number" onkeypress="validateInput(event)"
											class="decimal" value="1" /></td>
									</tr><br>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;Flipkart</td>
										<td><input type="text" name="fk" id="fk"
											type="number" onkeypress="validateInput(event)"
											class="decimal" value="1" /></td>
										<td>&nbsp;&nbsp;&nbsp;Myntra</td>
										<td><input type="text" name="my" id="my"
											type="number" onkeypress="validateInput(event)"
											class="decimal" value="1" /></td>
									</tr><br>
									
									<tr>
										<td><input type="hidden" name="statusBrand" id="statusFieldBrand" /></td>
									</tr>
									</table>
								</fieldset>



								
								<button onclick="setBrandTypeAndSubmit(1);" value="Delete">Update
								</button>
								<button onclick="setBrandTypeAndSubmit(0);" value="Delete">Delete
								</button>
							</div>
							</div>
						</div>
						<br> <br>
					</form>
					
					<form action="multiVariantUpdate.action" id="3"
						class="display-none" name="multiVariateForm" method="POST"
						onsubmit="return validate()">

						<br> <br>
						
						<div class="errors">
							<s:property value="#session.message" />
						</div>


						<div class="errors" id = "errorMV">
							
							<span style="color: red">This configuration is either
								inactive or deleted. </span>
						</div>
						
						
						 <input type="hidden" id="masterJobIdTxt" name="jobMasterId"
							value="3" />

						<div>
							<br> <br>
							<div id="formPart2" style="display: block">
								<table id="Config">
								
									<tr><input type="checkbox" name="isLongTail" id="isLongTail"/>Long tail product model</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;SubModel Type</td>
										<td>
											<input id="mvpe2" type="radio" name="jobSubModelId" value="2" onclick="handleCmTargetChange(this);"> Net GSV &nbsp; 
											<input id="mvpe1" type="radio" name="jobSubModelId" value="1" onclick="handleCmTargetChange(this);"> Units<br>
										</td>
									</tr>

									<tr>
										<td id="cmTargetChangeMV">&nbsp;&nbsp;&nbsp;CMPU Target</td>
										<td><input type="text" name="targetCmpuMV" id="targetCmpuMV"
											type="number" onkeypress="validateNumerical(event)"
											class="decimal" value="" /></td>
											
										<td>&nbsp;&nbsp;&nbsp;OMS Interval<br></td>
										<td><select required name="omsInterval"
											id="omsInterval" class="decimal interval">

												<option value='30'>30 Minutes</option>
												<option value='60'>1 Hour</option>
												<option value='90'>1 Hour 30 Minutes</option>
												<option value='120'>2 Hours</option>
												<option value='180'>3 Hours</option>
												<option value='240' selected>4 Hours</option>
												<option value='360'>6 Hours</option>
												<option value='480'>8 Hours</option>
												<option value='600'>10 Hours</option>
												<option value='720'>12 Hours</option>
												<option value='960'>16 Hours</option>
												<option value='1200'>20 Hours</option>
											
												<option value='1440'>24 Hours</option>
										
											
										</select></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;Initial OP setup %</td>
										<td><input type="text" name="initialOPSetup" id="initialOPSetup"
											type="number" onkeypress="validateInput(event)"
											class="decimal" value="" /></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;OP Increment %</td>
										<td><input type="text" name="opIncrement" id="opIncrement"
											type="number" onkeypress="validateInput(event)" step="0.1" 
											class="decimal" value="" /></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;CM Limit %</td>
										<td><input type="text" name="subcatCm" id="subcatCm"
											type="number" onkeypress="validateInput(event)"
											class="decimal" value="" /></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;GM Limit %</td>
										<td><input type="text" name="subcatGm" id="subcatGm"
											type="number" onkeypress="validateInput(event)"
											class="decimal" value="" /></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;CMPU Limit(ABS)</td>
										<td><input type="text" name="subcatCmpu" id="subcatCmpu"
											type="number" onkeypress="validateNumerical(event)"
											class="decimal" value="" /></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;Max Unit Ratio</td>
										<td><input type="text" name="maxUnit" id="maxUnit"
											type="number" onkeypress="validateInput(event)"
											class="decimal" value="" /></td>
									</tr>
									
									<tr>
										<td>&nbsp;&nbsp;&nbsp;Elastic Value</td>
										<td><input type="number" name="elasticValue" id="elasticValue"
											type="number" 
											class="decimal" value="-0.1" step="0.1"/></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;Event Type:</td>
										<td class="radioBox">Normal Day
            								<input type="radio" name="eventType" checked="checked" id="eventType" class="normal" value="1" />
    										Sales Day
       									    <input type="radio" name="eventType" id="eventType" class="sales" value="2"/>
       									</td>
       								</tr>
								</table>
								<fieldset>
									<legend>Seller Rating Eligibility</legend>
									<table id="Config">
									<tr>
										<td>&nbsp;&nbsp;&nbsp;Rating From: </td>
										<td><input type="text" name="ratingFrom" id="ratingFrom"
											type="number" onkeypress="validateInput(event)"
											class="decimal" value="" /></td>
										<td>&nbsp;&nbsp;&nbsp;Rating To: </td>
										<td><input type="text" name="ratingTo" id="ratingTo"
											type="number" onkeypress="validateInput(event)"
											class="decimal" value="" /></td>
									</tr>
									</table>
								</fieldset>
								<table id="Config">
									<tr>
										<td>&nbsp;&nbsp;&nbsp;SD+ Boost %</td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" name="sdBoost" id="sdBoost"
											type="number" onkeypress="validateInput(event)"
											class="decimal" value="" /></td>
									</tr>
								</table>
								<fieldset>
									<legend>Rating & Boost</legend>
									<table id="Config">
									<tr>
										<td>&nbsp;&nbsp;&nbsp;Seller Rating Boost Threshold</td>
										<td><input type="text" name="ratingThreshold" id="ratingThreshold"
											type="number" onkeypress="validateInput(event)"
											class="decimal" value="" /></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;Rating Boost %</td>
										<td><input type="text" name="ratingBoost" id="ratingBoost"
											type="number" onkeypress="validateInput(event)"
											class="decimal" value="" /></td>
									</tr>
									</table>
								</fieldset>
								<table id="Config">
								<tr>
										<td>&nbsp;&nbsp;&nbsp;Target Delta Weigtage</td>
										<td><input type="text" name="targetDeltaWeightage" id="targetDeltaWeightage"
											type="number" onkeypress="validateInput(event)"
											class="decimal" value="" /></td>
									</tr>
								<tr>
										<td><input type="hidden" name="statusMV" id="statusMV" /></td>
								</tr>
								</table>
								<button onclick="setMVTypeAndSubmit(1);" value="Delete">Update
								</button>
								<button onclick="setMVTypeAndSubmit(0);" value="Delete">Delete
								</button>
							</div>
							
						</div>
						
					</form>
					 <%
		session.setAttribute("report",""); 
		%>
	</div>
	
	
	
	<script type="text/javascript">
	function validateInput(evt)
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
	function validatePositiveInput(evt)
	{
		var theEvent = evt || window.event;
		var key = theEvent.keyCode || theEvent.which;
		if (key == 8 ) {
			theEvent.returnValue = true ;
			return;
		}
		key = String.fromCharCode( key );
		 var regex = /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/;
		if(!regex.test(key))
		{
			theEvent.returnValue = false;
			if(theEvent.preventDefault) theEvent.preventDefault();
		}   
		
	}
	
	function validatePositiveFractionalInput(evt)
	{
		var theEvent = evt || window.event;
		var key = theEvent.keyCode || theEvent.which;
		if (key == 8 ) {
			theEvent.returnValue = true ;
			return;
		}
		key = String.fromCharCode( key );
		 var regex = /^[0-9.]+$/;
		if(!regex.test(key))
		{
			theEvent.returnValue = false;
			if(theEvent.preventDefault) theEvent.preventDefault();
		}   
		
	}
	function validateNegativeFractionalInput(evt)
	{
		var theEvent = evt || window.event;
		var key = theEvent.keyCode || theEvent.which;
		if (key == 8 ) {
			theEvent.returnValue = true ;
			return;
		}
		key = String.fromCharCode( key );
		 var regex = /^[0-9-.]+$/;
		if(!regex.test(key))
		{
			theEvent.returnValue = false;
			if(theEvent.preventDefault) theEvent.preventDefault();
		}   
		
	}
	function validateNumerical(evt)
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
	
	function showDropdown(){
		var discountBucket=document.getElementById("discountBucketBrand").value;
		alert("showDropdown :"+discountBucket);
	}
	
function addSelect(divname) {
	$("#displayresponse > tbody").empty();
	$("#displayresponse > thead").empty();
	$("#displayresponse").addClass("hidden");
	
	var start = 0;
	var end = +document.getElementById("discountBucketBrand").value;
	var discountBucketLimit =+document.getElementById("discountBucketCapBrand").value;
	var options ='<select id="selectDiscountBucket" onchange="showDiscountBucketFields()" name="dropdownDiscount">';
	options += "<option>"+ "Discount Bucket Range" +"</option>";
	
	for(var key = start ; key <100/end; key++){
		var discountBucketEnd = key*end + end;
		var discountBucketStart = key*end + 1;
		if(discountBucketStart>discountBucketLimit){
			break;
		}
		if(key==0)
		var discountBucketStart = 0;
		if(discountBucketEnd>discountBucketLimit)
			discountBucketEnd=discountBucketLimit;
		options += "<option id="+key+" value='"+ discountBucketStart+"-"+discountBucketEnd +"'>"+ discountBucketStart+"-"+discountBucketEnd +"</option>";
	}
	options+= '</select>';
	document.getElementById("select-container").innerHTML = options;

}

function showDiscountBucketFields() {
	var selected = $('#selectDiscountBucket :selected').text();
	var range = document.getElementById("discountBucketBrand").value;
	var table = document.getElementById("displayresponse1");

    var rowCount = table.rows.length;
    var counts = rowCount;
    
	var id= $('#selectDiscountBucket option:selected').attr("id");
	var bucketId= +id.split("value",1)+1;
	var numberOfRows = $("#displayresponse tr").length ;
	if (numberOfRows === 0 ) {
		var thead = "<tr><td>" +"Discount bucket&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>" 
		if(document.getElementById('isMatchCompetitionNo').checked){
			thead += "<td> Absolute POG &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>"
		}else{
			thead += "<td> Discount % Top up&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>" 
			thead += "<td> Additional POGs %&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>"
		}
		
		+ "</tr>";
		$("#displayresponse thead").append(thead);
		$("#displayresponse").removeClass("hidden");
	}
	var i=0;
	 var data="<tr><td >"+selected+"</td>";
     
     if(document.getElementById('isMatchCompetitionNo').checked){
    	 data +="<td><input type='text' onkeypress='validatePositiveInput(event)' id='absoluteSdPogs"+numberOfRows+"' name='discountBucketList["+numberOfRows+"].absoluteSdPogs'/></td>"
     }else{
    	 data +="<td><input type='text' class='discountTopUp' maxlength='4' onkeyup='this.value = minmax(this.value, 100,event)' id='discountTopUp"+numberOfRows+"' name='discountBucketList["+numberOfRows+"].discountTopUp'/></td>"
    	    
    	 data +=" <td><input type='text'onkeypress='validatePositiveInput(event)' id='additionalPOGs"+numberOfRows+"' name='discountBucketList["+numberOfRows+"].additionalPOGs'/></td>"
    	 
    	 
     
    	 
     	/* +"<td><input type='text' onkeypress='validatePositiveInput(event)' id='additionalPOGsAbs"+numberOfRows+"' name='discountBucketList["+numberOfRows+"].additionalPOGsAbs'/></td> */
     }
     counts += 1 ;
     data +=" <td style='display:none;'><input type='text' class='hidden' name='discountBucketList["+numberOfRows+"].bucketId' value = '" + bucketId + "'/></td>"
     
     data +="<td><button  type='button' style='width:50px;' onclick='deleteRow ("+counts+")' class='btn btn-sm btn-danger'>X </button> </td>"
     
     +"</tr>";
		
	$("#displayresponse tbody").append(data);
	$('#selectDiscountBucket').find('option:selected').remove();
	
}

function deleteRow(row)
{
	debugger;
	var tdDetails = document.getElementById("displayresponse1");
	var value =tdDetails.getElementsByTagName("td")[0].innerHTML;
	var key = value.split("-");
	key = key[0].split("");
	document.getElementById("displayresponse1").deleteRow(row-1);
	orderSubcatRows();
	debugger;
	var options = document.getElementById("selectDiscountBucket").innerHTML;
	options += "<option id='"+key[0]+"' value='"+ value+"'>"+ value +"</option>";
	
	document.getElementById("selectDiscountBucket").innerHTML = options;
	//var foption = $('#selectDiscountBucket option:first');
	$("#selectDiscountBucket").append($("#selectDiscountBucket option").remove().sort(function(a, b) {
	    var at = $(a).text().split("-",1), bt = $(b).text().split("-",1);
	    return (at > bt)?1:((at < bt)?-1:0);
	}));
	 //foption +=soptions;
	 //document.getElementById("selectDiscountBucket").innerHTML=foption;
	// $("#selectDiscountBucket").html(soptions).prepend(foption); 
	 $("#selectDiscountBucket").append($options);
	
	 $('#selectDiscountBucket option:first').innerHTML = foption;
}

function orderSubcatRows() {
	var row = 1 ;
	$('#displayresponse > tbody  > tr').each(function() {
		$(this).children().last().find("button").attr ("onclick","deleteRow ("+row+")") ;
		
		row = row + 1;
	});
	if(row==1){
		document.getElementById("displayresponse").deleteRow(0);
	}
}
  
function getIsLongTailValue()
{
  if (document.getElementById('isLongTail').checked) 
  {
      document.getElementById('isLongTail').value = 1;
  } else {
	  document.getElementById('isLongTail').value = 0;
  }
}

function minmax(value, max,evt) 
{
	validateNegativeFractionalInput(evt);
    
    if(parseInt(value) > max) 
        return 100; 
    else return value;
}

function match(){
	addSelect('select-container');
	$("#displayresponse > tbody").empty();
	$("#displayresponse > thead").empty();
	$("#displayresponse").addClass("hidden");
	var x;
	if (document.getElementById('isMatchCompetitionYes').checked) {
		  x = document.getElementById('isMatchCompetitionYes').value;
	}else if(document.getElementById('isMatchCompetitionNo').checked){
		  x = document.getElementById('isMatchCompetitionNo').value;
	}
	if(x==1){
		$("#priceBucketField").show();   
		$("#compWeightField").show();
	}
	else{
		$("#priceBucketField").hide();   
		$("#compWeightField").hide();
	}
}

</script>
	
	
	
</body>
</html>