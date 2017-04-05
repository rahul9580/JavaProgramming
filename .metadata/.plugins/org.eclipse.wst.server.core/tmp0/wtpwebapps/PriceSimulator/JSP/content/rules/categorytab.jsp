<%@page import="java.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/buttons.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/loader.css" media="screen" />

<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/bootstrap.min.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/bootstrap-datetimepicker.min.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/content/rules/categorytab.css" media="screen" />
<script type="text/javascript" src="/PriceSimulator/JS/utility/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/content/rules/category.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/utility/loader.js"></script>

<script type="text/javascript" src="/PriceSimulator/JS/utility/bootstrap.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.5.1/moment.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.4.0/lang/en-gb.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/utility/bootstrap-datetimepicker.min.js"></script>
<%-- <script type="text/javascript" src="/PriceSimulator/JS/bootstrap-datetimepicker.pt-BR.js"></script>  --%>
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

	<div class="subcatrightpanel">
		<div class='criteriamenu'>
			<h5 style="padding: 10px 0; border-top: 1px solid #efefef; border-bottom: 1px solid #efefef; margin-bottom: 20px;">Filters</h5>

			<form class="form-inline">
				<table class="table well well-sm" id="table-forms">
					<tr style="border-bottom: 1px solid #efefef;">
						<td><label><input type="radio" id="overall" class="filterType" name="filterType" value="overalltable" onclick='click(this);'
								checked style="margin-right: 5px;">Overall</label></td>

						<td><label><input type="radio" id="sellingPrice" class="filterType" name="filterType" value="sellingpricetable"
								rel="sellingpricetable" onclick='click(this);' style="margin-right: 5px;">Selling Price</label></td>

						<td><label><input type="radio" id="popularity" class="filterType" name="filterType" value="popularitytable"
								rel="popularitytable" onclick='click(this);' style="margin-right: 5px;">Popularity</label></td>

						<td><label><input type="radio" id="popsell" class="filterType" name="filterType" value="popxselltable" rel="popxselltable"
								onclick='click(this);' style="margin-right: 5px;">Popularity X Selling Price</label></td>
					</tr>

					<tr class="SPTable">
						<td class="col-sm-3"><label>Selling Price :</label> <%-- <select id="SellingPrice"
							name="SellingPrice" class="SellingPrice form-control"
							onclick="click();">
								<option value="Below">Below</option>
								<option value="Between" selected>Between</option>
								<option value="Above">Above</option>
						</select> --%></td>
						<td class="SPFrom col-sm-3"><font color="red">*</font> <label>From</label><input type="text" class="number form-control pull-right" value="0" onkeypress="validate(event)" /></td>
						<td class="SPTo col-sm-3"><font color="red">*</font> <label>To</label><input type="text" class="number form-control pull-right" value="0" onkeypress="validate(event)" /></td>
					</tr>

					<tr class="popularityTable">
						<td class="col-sm-3"><label>Popularity :</label> <%-- <select
							class="Popularity form-control" id="Popularity" name="Popularity"
							onclick="click();">
								<option value="Below">Below</option>
								<option value="Between" selected>Between</option>
								<option value="Above">Above</option>
						</select> --%></td>
						<td class="PopularityFrom col-sm-3"><font color="red">*</font> <label>From</label><input type="text" class="decimal form-control pull-right" value="0" onkeypress="validate(event)" /></td>
						<td class="PopularityTo col-sm-3"><font color="red">*</font> <label>To</label><input type="text" class="decimal form-control pull-right" value="0" onkeypress="validate(event)" /></td>
					</tr>
				</table>
			</form>
			<!-- <form class="form"> -->
			<!-- <hr> -->
			<h5 style="padding: 10px 0; border-top: 1px solid #efefef; border-bottom: 1px solid #efefef; margin-bottom: 20px;">Rules</h5>
			<!-- <hr> -->
			<div class="well well-sm">
				<table class="table subcatrules">
					<thead>
						<tr>
							<th class="col-sm-4" style="background-color: #f5f5f5; color: black">Competition</th>
							<th class="col-sm-4" style="background-color: #f5f5f5; color: black"></th>
							<th class="col-sm-4" style="background-color: #f5f5f5; color: black">No Competition</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="CM "><font color="red">*</font> <label>CM % </label><input type="number" step="0.1" class="form-control pull-right" onkeypress="validate(event)" required /></td>
							<td class="CD "><font color="red">*</font> <label>Comp Difference(%)</label><input type="number" step="0.1" class="form-control pull-right"
								onkeypress="validate(event)" /></td>
							<td class="NC "><label>CM % </label><input type="number" step="0.1" class="form-control pull-right" onkeypress="validate(event)" /></td>
						</tr>
						<tr>
							<td class="GM "><font color="red">*</font> <label>GM % </label><input type="number" step="0.1" class="form-control pull-right "
								onkeypress="validate(event)" /></td>
							<td class="MD "><font color="red">*</font> <label>Max Comp Diff (Rs.)</label><input type="number" step="0.1" class="form-control pull-right "
								onkeypress="validate(event)" /></td>
							<td class="NCGM "><label>GM % </label><input type="number" step="0.1" class="form-control pull-right "
								onkeypress="validate(event)" /></td>
						</tr>
						
						<tr>
						<td class="CMPU"><font color="red">*</font> <label>CMPU </label><input type="number" step="0.1" class="form-control pull-right "
								onkeypress="validate(event)" /></td>
						
						
						<td><td class="NCCMPU "><label>CMPU</label><input type="number" step="0.1" class="form-control pull-right "
								onkeypress="validate(event)" /></td>
						</tr>
				</tbody>
				</table>
				
				<div class= "well well-sm compListSubcategory">
				<label>Mapped Competitors</label>
				</div>
				<div class= "well well-sm ">
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
								
				</td>				</tr>
				
				</table>				</div>
				<%-- <script type="text/javascript">
		$('.datetimepicker.startTime').datetimepicker({

			format : 'YYYY/MM/DD HH:mm:ss',
			orientation : 'top right'
		});
		$('.datetimepicker.endTime').datetimepicker({

			format : 'YYYY/MM/DD HH:mm:ss',
			orientation : 'top right'
		});
	
		
	</script>
 --%>			</div>
			<!-- </form> -->
		</div>

		<div class="action ">
		<button type="button" style="margin-left: 10px;" id="updateSubcatBtn1" class="btn btn-primary action updatesubcat">Update</button>
		<!-- 	<button type="button" style="margin-left: 10px;" class="btn btn-primary action updatesubcat" onclick="click();">Update</button> -->

			<!-- <a class="btn btn-primary action"
				style="margin-right: 53px; color: #ffffff"
				href="/PriceSimulator/viewSummary.action">View Summary</a>
			<button type="button" style="margin-right: 53px;"
				class="btn btn-primary action processesubcat">Process</button> -->
			<%-- <div style="text-align: right; float: left;" class="action">
				<span class="button button_red updatesubcat">Update</span>
			</div> --%>
			<%-- <div style="text-align: center;" class="action">
				<span class="button button_red"
					style="height: 20px; width: 120px; text-align: center; padding-top: 8px"><a
					href="/PriceSimulator/viewSummary.action">View Summary</a></span>
			</div> --%>
			<%-- <div style="text-align: right; float: right; margin-top: -30px;"
				class="action">
				<span class="button button_red processesubcat">Process</span>
			</div> --%>


			<div class="report">
				<div class="bar"></div>
			</div>
		</div>
	</div>

</body>
</html>