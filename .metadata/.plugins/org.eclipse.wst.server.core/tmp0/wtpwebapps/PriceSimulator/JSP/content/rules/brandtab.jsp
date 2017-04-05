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
<%-- <script type="text/javascript" src="/PriceSimulator/JS/bootstrap-datetimepicker.pt-BR.js"></script> --%>

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
$(document).ready(function(){
	
	$.ajax(
			{
				type : "POST",
				dataType: 'html',
				url : '/PriceSimulator/ajax/listbrand.action',
				success : function(data)
				{
					
					if(data != -1)
					{	if(data== 0){
						
					}else{
						var listBrand = data.split(";");
						var tempBrand ="<label style='margin:0'> Brand :</label> <select class='brand form-control' style='margin : 20px;'>";

						$.each(listBrand, function(idx, obj)
						{
							tempBrand = tempBrand + "<option value='" +obj.split(":")[0]+ "'>" +obj.split(":")[1]+ "</option>";
						});
						tempBrand=tempBrand + "</select>"
						$("table.brandNames").append(tempBrand);
						$("div.load").html("");
					}
					}
					else
					{
						$("div.load").html("Internal Error");
					}
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
				                        $.each(list, function(idx, obj)
				                        {
				                           
				                            temp = temp +  "<br>" +"<input type='checkbox' checked='checked' id='compList' name='competitorList' value='" +obj.split(":")[0].trim()+ "'>" +obj.split(":")[1].trim();
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
				}
			});
});
</script>
</head>
<body>
	<table class="brandNames dropdown" style=""></table>
	<h4 style="padding: 10px 0; border-top: 1px solid #efefef; border-bottom: 1px solid #efefef;margin-bottom: 20px;">
		<b>Rules</b>
	</h4>
	<div class="well well-sm">
		<table class="table" style="width: 96%; margin: 10px 2%">
			<thead>
				<th class="" style="background-color: #f5f5f5; color: black">Competition</th>
				<th class="" style="background-color: #f5f5f5; color: black"></th>
				<th class="" style="background-color: #f5f5f5; color: black">No Competition</th>
			</thead>
			<tbody>
				<tr>
					<td class="CM "><font color="red">*</font> <label>CM %</label><input type="number" name="cmPercent" id="cmPercent" class="cmPercent form-control pull-right"
						step="0.1" onkeypress="validate(event)" /></td>
					<td class="CD "><font color="red">*</font> <label>Comp Difference(%)</label><input type="number" name="competitorDifference" id="competitorDifference"
						class="competitorDifference form-control pull-right" step="0.1" onkeypress="validate(event)" /></td>
					<td class="NC "><label>CM %</label><input type="number" name="nocmPercent" id="nocmPercent"
						class="nocmPercent form-control pull-right" step="0.1" onkeypress="validate(event)" /></td>
				</tr>

				<tr>
					<td class="GM  "><font color="red">*</font> <label>GM %</label><input type="number" name="gmPercent" id="gmPercent" class="gmPercent form-control pull-right"
						step="0.1" onkeypress="validate(event)" /></td>
					<td class="MD  "><font color="red">*</font> <label>Max Comp Diff(Rs.)</label><input type="number" id="maxCompetitorDifference" name="maxCompetitorDifference"
						class="maxCompetitorDifference form-control pull-right" step="0.1" onkeypress="validate(event)" /></td>
					<td class="NCGM  "><label>GM %</label><input type="number" name="nogmPercent" id="nogmPercent"
						class="nogmPercent form-control pull-right" step="0.1" onkeypress="validate(event)" /></td>
				</tr>
				<tr>
					<td class="CMPU"><font color="red">*</font> <label>CMPU</label><input type="number" name="CMPerUnit" id="CMPerUnit" class="CMPerUnit form-control pull-right"
						step="0.1" onkeypress="validate(event)" /></td>
					<td></td>
					<td class="NCCMPU"><label>CMPU</label><input type="number" name="noCompetitorCMPerUnit" id="NCCMPU"
						class="noCompetitorCMPerUnit form-control pull-right" step="0.1" onkeypress="validate(event)" /></td>
				</tr>
				<tr>
					<td class="GMPU"><font color="red">*</font> <label>GMPU</label><input type="number" name="GMPerUnit" id="GMPerUnit" class="GMPerUnit form-control pull-right"
						step="0.1" onkeypress="validate(event)" /></td>
					<td></td>
					<td class="NCGMPU"><label>GMPU</label><input type="number" name="noCompetitorGMPerUnit" id="NCGMPU"
						class="noCompetitorGMPerUnit form-control pull-right" step="0.1" onkeypress="validate(event)" /></td>
				</tr>
				<tr>
					<td class="startTime "><font color="red">*</font> <label>Start Time</label>
						<div class='input-group date datetimepicker startTime pull-right' style="width: 57%">
							<input type='text' class="form-control startTime" name="startTime"  onkeypress="return false;"/> <span class="input-group-addon"> <span
								class="glyphicon glyphicon-calendar"> </span>
							</span>
						</div></td>
					<td class="endTime "><font color="red">*</font> <label>End Time</label>
						<div class='input-group date datetimepicker endTime pull-right' style="width: 52%">
							<input type='text' class="form-control endTime" name="endTime" onkeypress="return false;" /> <span class="input-group-addon"> <span
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
				<td><input type="text"
								name="idp" id="idp"
								class="idp form-control pull-center" style="width:55%;"onkeypress="validate(event)"
								
								 /> 
				</td>
				
				<td class="col-md-4"><label>Wallet Min Absolute</label></td>
								<td><input type="text" id="wma"
								name="wma" class="wma form-control pull-left " style="width:55%;" id="wma" 
								onkeypress="validate(event)" 
								 />
								
				</td>
				</tr>
				
				</table>
				</div>
	</div>
	<script type="text/javascript">
		$('.datetimepicker.startTime').datetimepicker({

			format : 'YYYY/MM/DD HH:mm:ss',
			orientation : 'top right',
			minuteStepping: 15
			
		});
		$('.datetimepicker.endTime').datetimepicker({

			format : 'YYYY/MM/DD HH:mm:ss',
			orientation : 'top right'
		});
	</script>

	<div class="action">
	<button type="button" style="margin-left: 10px;" id="updatebrandBtn1"
				class="btn btn-primary action updatesubcat" onclick="updateBrand(this)">Update</button>
		<%-- <span class="btn btn-primary updatebrand" style="width:20%;"
			onclick="updateBrand(this)">Update</span> --%>
		<div class="report1">
			<div class="bar"></div>
		</div>
	</div>
	<div class="load"></div>
</body>
</html>