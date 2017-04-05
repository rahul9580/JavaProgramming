<%@page import="database.model.BrandModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/bootstrap.min.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/bootstrap-datetimepicker.min.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/content/rules/brandtab.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/buttons.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/loader.css" media="screen" />
<!-- <link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/bootstrap-combined.min.css" media="screen" /> -->
<script type="text/javascript" src="/PriceSimulator/JS/utility/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/content/rules/brand.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/utility/loader.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/utility/bootstrap.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.5.1/moment.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.4.0/lang/en-gb.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/utility/bootstrap-datetimepicker.min.js"></script>

<style>
.required:after {
	content: " *";
	color: #e32;
	display: inline;
	font: bold;
}

.notRequired {
	display: inline;
}
}
</style>
<script type="text/javascript">
$(document).ready(
		function() {
			var id='<%=((BrandModel) session.getAttribute("BrandModel")).getID()%>';
			$(".id").attr(("value"),id);
			var brandName='<%=((BrandModel) session.getAttribute("BrandModel")).getName()%>';
			$(".brand").attr(("value"),brandName);
			
			var CM='<%=((BrandModel) session.getAttribute("BrandModel")).getParameterValueFromType("CM")%>';
			$(".CM input").attr(("value"),CM);
			
			var CD='<%=((BrandModel) session.getAttribute("BrandModel")).getParameterValueFromType("CD")%>';
			$(".CD input").attr(("value"),CD);
			
			var NC='<%=((BrandModel) session.getAttribute("BrandModel")).getParameterValueFromType("NC")%>';
			$(".NC input").attr(("value"),NC);
			
			var GM='<%=((BrandModel) session.getAttribute("BrandModel")).getParameterValueFromType("GM")%>';
			$(".GM input").attr(("value"),GM);
			
			var MD='<%=((BrandModel) session.getAttribute("BrandModel")).getParameterValueFromType("MD")%>';
			$(".MD input").attr(("value"),MD);
			
			var NCGM='<%=((BrandModel) session.getAttribute("BrandModel")).getParameterValueFromType("NCGM")%>';
			$(".NCGM input").attr(("value"),NCGM);
			
			var startTime='<%=((BrandModel) session.getAttribute("BrandModel")).getStartTime()%>';
			$(".startTime input").attr(("value"),startTime);
			
			var idp='<%=((BrandModel) session.getAttribute("BrandModel")).getParameterValueFromType("IDP")%>';
			$(".IDP input").attr(("value"),idp);

			var wma='<%=((BrandModel) session.getAttribute("BrandModel")).getParameterValueFromType("WMA")%>';
			$(".WMA input").attr(("value"),wma);
			var CMPU='<%=((BrandModel) session.getAttribute("BrandModel")).getParameterValueFromType("CMPU")%>';
				
			$(".CMPU input").attr(("value"),CMPU);
			
			var NCCMPU='<%=((BrandModel) session.getAttribute("BrandModel"))
				.getParameterValueFromType("NCCMPU")%>';
				
			$(".NCCMPU input").attr(("value"),NCCMPU);
			var endTime='<%=((BrandModel) session.getAttribute("BrandModel")).getEndTime()%>';
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
						                    var source='<%=((BrandModel) session.getAttribute("BrandModel"))
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
						                    $("div.compListBrand").append(temp);
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
	<label style="margin-left:1%">Brand</label>
	<input class="brand form-control" type="text" style="margin-left:10px;width:15%" readonly />
	<input class="id" type="hidden" />
	
	<h4 style="padding: 10px 10px; border-top: 1px solid #efefef; border-bottom: 1px solid #efefef;margin-bottom: 20px;">
		<b>Rules</b>
	</h4>
	<div class="well well-sm form-inline" style="margin:1%">
	<table class="brandrules table" style="text-align: center; border: none; margin: 0 2%; width: 96%">
		<thead><tr>
				<th class="" style="background-color: #f5f5f5; color: black">Competition</th>
				<th class="" style="background-color: #f5f5f5; color: black"></th>
				<th class="" style="background-color: #f5f5f5; color: black">No Competition</th></tr>
			</thead>
			<tbody>
		<tr>
			<td class="CM"><font color="red">*</font> <label>CM %</label><input class="CM form-control pull-right" type="number" step="0.1"
				onkeypress="validate(event)" /></td>
			<td class="CD"><font color="red">*</font> <label>Comp Difference(%)</label><input class="CD form-control pull-right" type="number" step="0.1"
				onkeypress="validate(event)" /></td>
			<td class="NC"><label>CM %</label><input class="NC form-control pull-right" type="number" step="0.1"
				onkeypress="validate(event)" /></td>
		</tr>

		<tr>
			<td class="GM"><font color="red">*</font> <label>GM %</label><input class="GM form-control pull-right" type="number" step="0.1"
				onkeypress="validate(event)" /></td>
			<td class="MD"><font color="red">*</font> <label>Max Comp Diff(Rs.)</label><input class="MD form-control pull-right" type="number" step="0.1"
				onkeypress="validate(event)" /></td>
			<td class="NCGM"><label>GM %</label><input class="NCGM form-control pull-right" type="number" step="0.1"
				onkeypress="validate(event)" /></td>
		</tr>
		<tr>
						<td class="CMPU"><font color="red">*</font> <label>CMPU </label><input type="number" step="0.1" name="CMPerUnit" id="CMPerUnit" class=" CMPerUnit  form-control pull-right "
								onkeypress="validate(event)" /></td>
						
						
						<td><td class="NCCMPU "><label>CMPU</label><input type="number" step="0.1" name="noCompetitorCMPerUnit" class="noCompetitorCMPerUnit form-control pull-right "
								onkeypress="validate(event)" /></td>
						</tr>
		<tr>
					<td class="startTime "><font color="red">*</font> <label>Start Time</label>
						<div class='input-group date datetimepicker startTime pull-right' style="width: 57%">
							<input type='text' class="form-control startTime" name="startTime" onkeypress="return false;"/> <span class="input-group-addon"> <span
								class="glyphicon glyphicon-calendar"> </span>
							</span>
						</div></td>
					<td class="endTime "><font color="red">*</font> <label>End Time</label>
						<div class='input-group date datetimepicker endTime pull-right' style="width: 52%">
							<input type='text' class="form-control endTime" name="endTime" onkeypress="return false;"/> <span class="input-group-addon"> <span
								class="glyphicon glyphicon-calendar"> </span>
							</span>
						</div></td>
					<td></td>
				</tr>
		</tbody>
	</table>
	<div class= "well well-sm compListBrand">
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
	<span id="editbrandBtn1" class="btn btn-primary updateallbrand" style=" margin-right: 20px;"><button type="button"
					style="border: none; margin: 0; padding: 0;" id="editbrandBtn1" class="btn btn-primary action updatesubcat" onclick="EditBrand()">Update</button></span>
	
	<%-- <span class="btn btn-primary updateallbrand" onclick="EditBrand()" style="width: 20%;margin-left:4%">Update</span> --%>
	<a class="btn btn-primary" href="/PriceSimulator/viewSummary.action" style="margin-left: 40px;">Cancel</a>
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
	<%-- <span class="button button_red addbrand" onclick="addBrand()">Add</span>
	<span class="button button_red updateallbrand" onclick="updateAllBrand()">Update All</span> --%>
	<div class="action">
		<div class="report1">
			<div class="bar"></div>
		</div>
    </div>
		<div class="load"></div>
</body>
</html>