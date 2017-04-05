	function validateUpdateProduct(row)
{
	var id = $(row).parent().parent().attr("id");
	var shipping = parseFloat($("table.productrules tr[id='" +id+ "'] > td span.shippingCharges").text());
	var offerPrice = $("table.productrules tr[id='" +id+ "'] > td input.OP").val();
	var finalofferprice = parseFloat($("table.productrules tr[id='" +id+ "'] > td input.OP").val());
	var cmpuLimit = $("table.productrules tr[id='" +id+ "'] > td input.CMPU").val();
	var startTime=$("table.productrules tr[id='" +id+ "'] > td input.startTime").val();
	var endTime=$("table.productrules tr[id='" +id+ "'] > td input.endTime").val();
	var idp = parseFloat($("table.productrules tr[id='" +id+ "'] > td input.IDP").val());
	var wma = parseFloat($("table.productrules tr[id='" +id+ "'] > td input.WMA").val());
	var exceptionLowerLimit =Number($("table.productrules tr[id='" +id+ "'] > td span.exceptionLowerLimit").text());
	var taxFactor = parseFloat ($(".taxFactor").text()) ;
	var TP_dash = parseFloat($("table.productrules tr[id='" +id+ "'] > td span.VP").text().replace(/,/g,''));
	var sellingPrice = parseFloat($("table.productrules tr[id='" +id+ "'] > td span.SP").text());		

	var OfferPricefromCMPU = TP_dash + parseFloat(cmpuLimit) + shipping - (shipping/taxFactor);
	var start = new Date(startTime);
	var end = new Date(endTime);
	var matchComp = $("#"+id+" input.matchCompCheckBox")[0].checked?1:0;
	var cm = parseFloat($("table.productrules tr[id='" +id+ "'] > td input.matchCompCM").val());
	var gm = parseFloat($("table.productrules tr[id='" +id+ "'] > td input.matchCompGM").val());
	var valueOfX = parseFloat($("table.productrules tr[id='" +id+ "'] > td input.matchCompValueOfX").val());
	var valueOfXAbs = parseFloat($("table.productrules tr[id='" +id+ "'] > td input.matchCompValueOfXAbs").val());
	if (id.length === 0) {
		return false;
	}
	if (offerPrice.length === 0) {
		alert('Offer price is a mandatory field and can not be left empty.');
		return false;
	}
	if(finalofferprice <= 0)
	{
		alert('Entered offer price is not valid.');
		return false;
	}
	if (cmpuLimit.length === 0) {
		alert('CMPU limit is a mandatory field and can not be left empty.');
		return false;
	}
	if (end<=start) {
		alert('Entered End Time is not valid.');
		return false;
	}
	if (idp<0 || idp>100) {
		alert('Instant discount % should be between 0 and 100');
		return false;
	}
	if (wma<0) {
		alert('Wallet Min ABS should be greater than 0 ');
		return false;
	}
	if(parseFloat(cmpuLimit) < exceptionLowerLimit) {
		alert('Entered cmpuLimit is lower than permitted for subcat.');
		return false;
	}
	if (finalofferprice + shipping < OfferPricefromCMPU) {
		alert('Entered offerPrice breaches the cmpu limit.');
		return false;
	}
	if (finalofferprice > sellingPrice) {
		alert('Entered offerPrice is greater than selling price.');
		return false;		
	}
	if(matchComp == 1 && (isNaN(cm) || isNaN(gm) || isNaN(valueOfX) || isNaN(valueOfXAbs)))
	{
		alert("Please Enter valid CM/GM/ValueOfX/ValueOfXAbs");
		return false;
	}
	return true;
}

function updateProduct(row)
{	
	if(validateUpdateProduct(row))
	{
		var id = $(row).parent().parent().attr("id"); 
		showloader("table.productrules tr[id=\"" +id+ "\"] td:last-child");
		var supc = id;
		var finalofferprice = parseFloat($("table.productrules tr[id='" +id+ "'] > td input.OP").val());
		var startTime = $("table.productrules tr[id='" +id+ "'] > td input.startTime").val();
		var endTime = $("table.productrules tr[id='" +id+ "'] > td input.endTime").val();;
		var idp = $("table.productrules tr[id='" +id+ "'] > td input.IDP").val();
		var wma = $("table.productrules tr[id='" +id+ "'] > td input.WMA").val();				
		var cmpuLimit = parseFloat($("table.productrules tr[id='" +id+ "'] > td input.CMPU").val()) ;
		var comment = $("table.productrules tr[id='" +id+ "'] > td input.comment").val();
		var ruleId = $(row).parent().parent().find("span.ruleId").text();
		var sellerBox = $(row).parent().parent().find("span.detailvalue.vendorCode")[0];
		var sellerCode = $(sellerBox).text();
		var cm = $("table.productrules tr[id='" +id+ "'] > td input.matchCompCM").val();
		var gm = $("table.productrules tr[id='" +id+ "'] > td input.matchCompGM").val();
		var valueOfX = $("table.productrules tr[id='" +id+ "'] > td input.matchCompValueOfX").val();
		var valueOfXAbs = $("table.productrules tr[id='" +id+ "'] > td input.matchCompValueOfXAbs").val();
		var matchComp = $("#"+id+" input.matchCompCheckBox")[0].checked?1:0;
			$.ajax(
			{
				type : "POST",
				dataType: 'html',
				url : '/PriceSimulator/ajax/updateproduct.action',
				data : {supc : supc, offer : finalofferprice, startTime : startTime, endTime : endTime, comment : comment, idp : idp, wma : wma, 
				cmpu : cmpuLimit, ruleId : ruleId, cm:cm,gm:gm,valueOfx:valueOfX,valueOfxAbs:valueOfXAbs,matchComp:matchComp,sellerCode:sellerCode},
				success : function(data)
				{
					if(data == 1)
					{
					hideloader("table.productrules tr[id=\"" +id+ "\"] td:last-child");
					$("table.productrules tr[id=\"" +id+ "\"] td:last-child").html("<span>Success</span>");
					}
					else
					{
					var res = data.split("_");

					if(res!=null && res.length>1 && res[0] == 2)
					{
					hideloader("table.productrules tr[id=\"" +id+ "\"] td:last-child");
					document.getElementsByClassName("ruleId")[0].innerHTML=data[1];
					$("table.productrules tr[id=\"" +id+ "\"] td:last-child").html("<span>Success & Auto Approved</span>");
					}
					else
					{
					hideloader("table.productrules tr[id=\"" +id+ "\"] td:last-child");
					$("table.productrules tr[id=\"" +id+ "\"] td:last-child").html("<span style=\"color:red;\">Failed "+ data+"</span>");
					}
					}}
			});
	}
}

function updateData(row)
{
	var id = $(row).parent().parent().parent().attr("id");
	var offer = $(row).val();
	var CMPUlimit = $("table.productrules tr[id='" +id+ "'] > td input.CMPU").val() ;
	var tp = $(row).parent().parent().find("span.TP").text();
	var seller = $(row).parent().parent().parent().find("span.VP").text();	
	var marginType = $(row).parent().parent().find("span.MarginType").text();
	var selling = $(row).parent().parent().parent().find("span.SP").text();
	var subcategoryCmLimit = $(row).parent().parent().find("span.subcategoryCmLimit").text();
	var margin = $(row).parent().parent().find("span.Margin").text();
	var overheadCharges = $(row).parent().parent().find("span.OverheadCharges").text();
	var paymentCharges = $(row).parent().parent().find("span.PaymentCharges").text();
	var int_cb_v  =$(row).parent().parent().parent().find("span.Int_cb_v").text();
	var shippingCharges = $(row).parent().parent().parent().find("span.shippingCharges").text();
	var ext = $(row).parent().parent().find("span.EXTCB").text();
	var TP_dash = parseFloat($("table.productrules tr[id='" +id+ "'] > td span.VP").text().replace(/,/g,''));
	var newTP = TP_dash - parseFloat(paymentCharges).toFixed(2)- parseFloat(overheadCharges).toFixed(2);
	var taxFactor = parseFloat ($(".taxFactor").text());
	$.ajax(
			{
				type : "POST",
				dataType: 'html',
				async : false,
				url : '/PriceSimulator/ajax/rules/calculateCM.action',
				data : {sellingPrice : selling, offerPrice : offer, shippingCharges : shippingCharges , tpWithOverhead : seller , internalSellerCashback : int_cb_v},
				
				success : function(data)
				{	
					var CMPostCBPercent = parseFloat (data).toFixed(2);
					$("table.productrules tr[id='" +id+ "'] > td span.CM").html(CMPostCBPercent);
				}
				
				
			});
	$("table.productrules tr[id='" +id+ "'] > td span.GM").html(""+((parseFloat(offer).toFixed(2) - newTP) * 100 /parseFloat(selling)).toFixed(2));
	$.ajax(
			{
				type : "POST",
				dataType: 'html',
				async : false,
				url : '/PriceSimulator/ajax/rules/calculateCmpu.action',
				data : {offerPrice : offer, tpWithOverhead : seller, shippingCharge : shippingCharges, taxFactor : taxFactor},
				
				success : function(data)
				{	
					
					var CmpuForOfferPrice = parseFloat (data).toFixed(2);
					$("table.productrules tr[id='" +id+ "'] > td span.CmpuComputed").html(CmpuForOfferPrice);
				}
			});
}

function validate(evt)
{
	var theEvent = evt || window.event;
	var key = theEvent.keyCode || theEvent.which;
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

function validateMatchComp(row)
{
	if(row.checked)
	{
		$(row).parent().parent().parent().find(".matchComp").show();
	}
	else
	{
		$(row).parent().parent().parent().find(".matchComp").hide();
	}
}

$( document ).ready(function() {
	$table = $(".productrules")[0];
	$($table).find(".matchCompCM").each(function(index,row){
		if(row.value != "")
		{
			$(row).parent().parent().parent().find("input[type='checkbox']").prop("checked",true);
			$(row).parent().parent().show();
		}
		else
		{
			$(row).parent().parent().parent().find("input[type='checkbox']").prop("checked",false);
			$(row).parent().parent().hide();
		}
	});
});