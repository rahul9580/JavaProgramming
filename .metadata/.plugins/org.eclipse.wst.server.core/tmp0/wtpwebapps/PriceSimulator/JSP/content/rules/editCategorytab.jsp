<%@page import="database.model.RuleModel"%>
<%@page import="org.apache.commons.digester.Rule"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/bootstrap.min.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/bootstrap-datetimepicker.min.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/content/rules/categorytab.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/buttons.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/loader.css" media="screen" />
<!--  <link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/bootstrap-combined.min.css" media="screen" /> -->
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/bootstrap-datetimepicker.min.css" media="screen" />
<script type="text/javascript" src="/PriceSimulator/JS/content/rules/editcategory.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/utility/loader.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/utility/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/utility/bootstrap.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.5.1/moment.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.4.0/lang/en-gb.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/utility/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript">
$(document).ready(
		function() {
			var filterType='<%=((RuleModel) session.getAttribute("RuleModel"))
					.getFilterType()%>';
			if(filterType == 'OA'){
				$(".SPTable").hide();
				$(".popularityTable").hide();
				$(".overall").attr("checked",true);
				setTimeout(function(){
					$("#sellingPrice").attr("disabled", 'disabled');
					$("#popularity").attr("disabled", 'disabled');
					$("#popsell").attr("disabled", 'disabled');	
				}, 400);
				 
			}else if(filterType == 'SP'){
				$(".SPTable").show();
				$(".popularityTable").hide();
				$(".sellingPrice").attr("checked",true);
				var filterValueSPFrom='<%=((RuleModel) session.getAttribute("RuleModel"))
					.getSPFrom()%>';
				$(".SPFrom input").attr(("value"),filterValueSPFrom);
				var filterValueSPTo='<%=((RuleModel) session.getAttribute("RuleModel")).getSPTo()%>';
				$(".SPTo input").attr(("value"),filterValueSPTo);
				setTimeout(function(){
					$("#overall").attr("disabled", 'disabled');
					$("#popularity").attr("disabled", 'disabled');
					$("#popsell").attr("disabled", 'disabled');
				}, 400);
			}else if(filterType == 'PR'){
				$(".SPTable").hide();
				$(".popularityTable").show();
				$(".popularity").attr("checked",true);
				var filterValuePopularityFrom='<%=((RuleModel) session.getAttribute("RuleModel"))
					.getPopularityFrom()%>';
				$(".PopularityFrom input").attr(("value"),filterValuePopularityFrom);
				var filterValuePopularityTo='<%=((RuleModel) session.getAttribute("RuleModel"))
					.getPopularityTo()%>';
				$(".PopularityTo input").attr(("value"),filterValuePopularityTo);
				setTimeout(function(){
					$("#overall").attr("disabled", 'disabled');
					$("#sellingPrice").attr("disabled", 'disabled');
					$("#popsell").attr("disabled", 'disable'); 
			}, 400);
			}else if(filterType == 'PR;SP'){ 
				$(".SPTable").show();
				$(".popularityTable").show();
				$(".popsell").attr("checked",true);
					var filterValuePopularityFrom='<%= ((RuleModel)session.getAttribute("RuleModel")).getPopularityFrom()%>';
					$(".PopularityFrom input").attr(("value"),filterValuePopularityFrom);
					var filterValuePopularityTo='<%= ((RuleModel)session.getAttribute("RuleModel")).getPopularityTo()%>';
					$(".PopularityTo input").attr(("value"),filterValuePopularityTo);
					var filterValueSPFrom='<%=((RuleModel) session.getAttribute("RuleModel"))
					.getSPFrom()%>';
					$(".SPFrom input").attr(("value"),filterValueSPFrom);
					var filterValueSPTo='<%=((RuleModel) session.getAttribute("RuleModel")).getSPTo()%>';
					$(".SPTo input").attr(("value"),filterValueSPTo);
					$(".PopularityTo input").attr(("value"),filterValuePopularityTo);
					setTimeout(function(){
						$("#overall").attr("disabled", 'disabled');
						$("#popularity").attr("disabled", 'disabled');
						$("#sellingPrice").attr("disabled", 'disabled');
					}, 400);
				
			}
			
			var CM='<%=((RuleModel) session.getAttribute("RuleModel"))
					.getParameterValueFromType("CM")%>';
			$(".CM input").attr(("value"),CM);
			var CD='<%=((RuleModel) session.getAttribute("RuleModel"))
					.getParameterValueFromType("CD")%>';
			$(".CD input").attr(("value"),CD);
			var NC='<%=((RuleModel) session.getAttribute("RuleModel"))
					.getParameterValueFromType("NC")%>';
			$(".NC input").attr(("value"),NC);
			
			var GM='<%=((RuleModel) session.getAttribute("RuleModel"))
					.getParameterValueFromType("GM")%>';
			$(".GM input").attr(("value"),GM);
			var MD='<%=((RuleModel) session.getAttribute("RuleModel"))
					.getParameterValueFromType("MD")%>';
			$(".MD input").attr(("value"),MD);
			var NCGM='<%=((RuleModel) session.getAttribute("RuleModel"))
					.getParameterValueFromType("NCGM")%>';
			$(".NCGM input").attr(("value"),NCGM);
			
			var IDP='<%=((RuleModel) session.getAttribute("RuleModel"))
				.getParameterValueFromType("IDP")%>';
			$(".IDP input").attr(("value"),IDP);
			
			var WMA='<%=((RuleModel) session.getAttribute("RuleModel"))
				.getParameterValueFromType("WMA")%>';
				
			$(".WMA input").attr(("value"),WMA);
			
			var CMPU='<%=((RuleModel) session.getAttribute("RuleModel"))
				.getParameterValueFromType("CMPU")%>';
				
			$(".CMPU input").attr(("value"),CMPU);
			
			var NCCMPU='<%=((RuleModel) session.getAttribute("RuleModel"))
				.getParameterValueFromType("NCCMPU")%>';
				
			$(".NCCMPU input").attr(("value"),NCCMPU);
			
			$("#ruleID").val('<%=((RuleModel) session.getAttribute("RuleModel")).getRuleId() %>');
			
			
			
			var source='<%=((RuleModel) session.getAttribute("RuleModel"))
			.getCompetitorIds()%>';
			var startTime='<%=((RuleModel) session.getAttribute("RuleModel"))
					.getStartTime()%>';
				if(startTime== "null"){
					startTime="0000/00/00 00:00:00"
				}
			$(".startTime input").attr(("value"),startTime);
			var endTime='<%=((RuleModel) session.getAttribute("RuleModel"))
					.getEndTime()%>';

						if (endTime == "null") {
							endTime = "0000/00/00 00:00:00"
						}
						$(".endTime input").attr(("value"), endTime);
						
						$.ajax(
						        {
						            type : "POST",
						            dataType: 'html',
						            url : '/PriceSimulator/ajax/complisting.action',
						            success : function(data)
						            {
						               
						                if(data != -1)
						                {    if(data== 0){
						                   
						                }else{
						                    var list = data.split(";");
						                    var temp ="";
						                    var source='<%=((RuleModel) session.getAttribute("RuleModel"))
											.getCompetitorList()%>';
											var sourceList = source.split(",");
						                    $.each(list, function(idx, obj)
						                    {
						                       
						                        temp = temp +  "<br>" +"<input type='checkbox' id='compList' name='competitorList' value='" +obj.split(":")[0].trim()+ "'";//>" +obj.split(":")[1].trim();
						                        for(var i = 0 ; i<sourceList.length-1;i++){
						                        	if(sourceList[i].trim()==obj.split(":")[0].trim()){
						                        		temp = temp + "checked='checked'";
						                        		
						                        	}
						                        }
						                        if(sourceList == "ALL"){
					                        		temp = temp + "checked='checked'";
					                        	}
						                        temp = temp +">" +obj.split(":")[1].trim();
						                    });
						                    $("div.compListSubcategory").append(temp);
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
			
</script>
</head>
<body>
	<div class="subcatrightpanel" style="width: 96%; margin: 0 2%">
		<div class='criteriamenu form-inline'>
			<h5 style="padding: 10px 10px; border-top: 1px solid #efefef; border-bottom: 1px solid #efefef; margin-bottom: 20px;">Filters</h5>
			<table id="table-forms" class="table well well-sm">
				<tr style="border-bottom: 1px solid #efefef;">
					<td><label><input type="radio" id="overall" class="overall" name="filterType" value="overalltable" style="margin-right: 5px;"
							onclick='click(this);'>Overall</label></td>

					<td><label><input type="radio" id="sellingPrice" class="sellingPrice" name="filterType" value="sellingpricetable"
							style="margin-right: 5px;" rel="sellingpricetable" onclick='click(this);'>Selling Price</label></td>

					<td><label><input type="radio" id="popularity" class="popularity" name="filterType" value="popularitytable"
							style="margin-right: 5px;" rel="popularitytable" onclick='click(this);'>Popularity</label></td>

					<td><label><input type="radio" id="popsell" class="popsell" name="filterType" value="popxselltable" style="margin-right: 5px;"
							rel="popxselltable" onclick='click(this);'>Popularity X Selling Price</label> </td>
				</tr>

				<tr class="SPTable table">
					<td class="col-sm-3"><label>Selling Price</label></td>
					<%-- <td><select class="SellingPrice" name="SellingPrice"
						onchange="change();">
							<option value="Below">Below</option>
							<option value="Between" selected>Between</option>
							<option value="Above">Above</option>
					</select></td> --%>

					<td class="SPFrom col-sm-3"><font color="red">*</font> <label>From</label><input type="text" class="number form-control" value="0" readonly /></td>

					<td class="SPTo col-sm-3"><font color="red">*</font> <label>To </label><input type="text" class="number form-control" readonly /></td>
				</tr>

				<tr class="popularityTable table">

					<td class="col-sm-3"><label>Popularity :</label></td>

					<%-- <td><select class="Popularity" id="Popularity"  name="Popularity" onchange="change();">
									<option value="Below">Below</option>
									<option value="Between" selected >Between</option>
									<option value="Above">Above</option>
							</select></td> --%>

					<td class="PopularityFrom col-sm-3"><font color="red">*</font> <label>From</label><input type="text" class="decimal form-control" value="0" readonly /></td>

					<td class="PopularityTo col-sm-3"><font color="red">*</font> <label>To </label><input type="text" class="decimal form-control" value="0" readonly /></td>
				</tr>


			</table>
			<h5 style="padding: 10px 10px; border-top: 1px solid #efefef; border-bottom: 1px solid #efefef; margin-bottom: 20px;">Rules</h5>
			<div class="well well-sm">
			<table class="subcatrules table">
				<thead>
					<tr>
						<th class="col-sm-4" style="background-color: #f5f5f5; color: black">Competition</th>
						<th class="col-sm-4" style="background-color: #f5f5f5; color: black"></th>
						<th class="col-sm-4" style="background-color: #f5f5f5; color: black">No Competition</th>
					</tr>
				</thead>
				<tr>

					<td class="CM"><font color="red">*</font> <label>CM %</label><input class="CM form-control pull-right" type="number" step="0.1" onkeypress="validate(event)" /></td>
					<td class="CD"><font color="red">*</font> <label>Comp Difference(%)</label><input class="CD form-control pull-right" type="number" step="0.1"
						onkeypress="validate(event)" /></td>
					<td class="NC"><label>CM % </label><input class="NC form-control pull-right" type="number" step="0.1" onkeypress="validate(event)" /></td>
				</tr>

				<tr>
					<td class="GM"><font color="red">*</font> <label>GM %</label><input class="GM form-control pull-right" type="number" step="0.1" onkeypress="validate(event)" /></td>
					<td class="MD"><font color="red">*</font> <label>Max Comp Diff(Rs.)</label><input class="MD form-control pull-right" type="number" step="0.1"
						onkeypress="validate(event)" /></td>
					<td class="NCGM"><label>GM %</label><input class="NCGM form-control pull-right" type="number" step="0.1" onkeypress="validate(event)" /></td>
				</tr>
				<tr>
						<td class="CMPU"><font color="red">*</font> <label>CMPU </label><input type="number" step="0.1" class="form-control pull-right "
								onkeypress="validate(event)" /></td>
						
						
						<td><td class="NCCMPU "><label>CMPU</label><input type="number" step="0.1" class="form-control pull-right "
								onkeypress="validate(event)" /></td>
						</tr>
				<tr>
					<td><input type="hidden" name="ruleID" id="ruleID" value=""></td>
				</tr>
			</table>
			
				<div class= "well well-sm compListSubcategory">
				<label>Mapped Competitors</label>
				</div>
				<div class= "well well-sm">
				<label>Wallet Configuration</label>
				
				<table class="table walletConf">
				<tr>
				<td class="col-md-3"><label>Instant Discount %</label></td>
				<td class="IDP"><input type="text"
								name="instantDiscountPercentage" id="instantDiscountPercentage"
								type="number" class="form-control pull-center " style="width:55%;"onkeypress="validate(event)"
								class="decimal form-control"
								 /> 
				</td>
				
				<td class="col-md-4"><label>Wallet Min Absolute</label></td>
								<td class="WMA"><input type="text"
								name="walletMinAbsolute" class="form-control pull-left " style="width:55%;" id="walletMinAbsolute" type="number"
								onkeypress="validate(event)" class="decimal form-control"
								 />
								
				</td>
				</tr>
				
				</table>
				</div>			

		</div>
	</div>
	<div class="action" style="width: 96%; margin: 0 2%">
		<div style="text-align: right; float: left;" class="action">
			<span id="updateSubcatBtn1" class="btn btn-primary updatesubcat" style=" margin-right: 20px;"><button type="button"
					style="border: none; margin: 0; padding: 0;" id="updateSubcatBtn1" class="btn btn-primary action updatesubcat">Update</button></span>
		</div>

		<div class="action">
			<a class="btn btn-primary" href="/PriceSimulator/viewSummary.action" style="
    margin-left: 40px;
">Cancel</a>
		</div>


		<div class="report">
			<div class="bar"></div>
		</div>
	</div>
</body>
</html>