function setTypeAndSubmit(val) {
		$(".heading").hide();
		document.getElementById("operationType").value = val;
		document.fetchVendor.submit();
}

function updateData(row)
{
	var id = $(row).parent().parent().attr("id");
	var offer = $(row).parent().parent().find("span.OP").text();
	var seller = $(row).parent().parent().find("span.VP").text();
	var marginType = $(row).parent().parent().find("span.MarginType").text();
	var selling = $(row).parent().parent().find("span.SP").text();
	var margin = $(row).parent().parent().find("span.Margin").text();
	var overheadCharges = $(row).parent().parent().find("span.OverheadCharges").text();
	var paymentCharges = $(row).parent().parent().find("span.PaymentCharges").text();
	var int_cb_v  =parseFloat($(row).parent().parent().find("span.Int_cb_v").text());
	var shippingCharges = $(row).parent().parent().find("span.shippingCharges").text();
	
	
	var optionIndex=$("table.products tr[id='" +id+ "'] > td select.discountType").val();
	var instant=parseFloat($("table.products tr[id='" +id+ "'] > td input.instant").val());
	
	if($("table.products tr[id='" +id+ "'] > td input.instant").val() == '')
		instant = 0.0;
	var wallet=parseFloat($("table.products tr[id='" +id+ "'] > td input.wallet").val());
	if($("table.products tr[id='" +id+ "'] > td input.wallet").val() == '')
		wallet = 0.0;
	var effectivePrice;
	/*if(effectivePrice == '')
		effectivePrice = 0;*/
	if(optionIndex =='0'){
		effectivePrice=((selling-int_cb_v) - (((selling-int_cb_v) * (instant/100)) +((selling - int_cb_v) * (wallet/100)))); 
		 
	}else{
		effectivePrice=((selling-int_cb_v) - (instant  + wallet));
	}
	
	$.ajax(
			{
				type : "POST",
				dataType: 'html',
				url : '/PriceSimulator/ajax/rules/calculateCM.action',
				data : {sellingPrice : selling, offerPrice : effectivePrice, shippingCharges : shippingCharges , tpWithOverhead : seller , internalSellerCashback : int_cb_v },
				
				success : function(data)
				{	
					var CMPostCBPercent = parseFloat(data).toFixed(2);
					$("table.products tr[id='" +id+ "'] > td span.CM").html(CMPostCBPercent);
					$("table.products tr[id='" +id+ "'] > td span.CMPU").html(parseFloat((CMPostCBPercent * selling) / 100).toFixed(2));
					
				}
			});
	$("table.products tr[id='" +id+ "'] > td span.EP").html(effectivePrice);

}
function updateEditData(row)
{
	var id = $(row).parent().parent().attr("id");
	var offer = $(row).parent().parent().find("span.OP").text();
	var seller = $(row).parent().parent().find("span.VP").text();
	var marginType = $(row).parent().parent().find("span.MarginType").text();
	var selling = $(row).parent().parent().find("span.SP").text();
	var margin = $(row).parent().parent().find("span.Margin").text();
	var overheadCharges = $(row).parent().parent().find("span.OverheadCharges").text();
	var paymentCharges = $(row).parent().parent().find("span.PaymentCharges").text();
	var int_cb_v  =parseFloat($(row).parent().parent().find("span.Int_cb_v").text());
	var shippingCharges = $(row).parent().parent().find("span.shippingCharges").text();
	
	
	var optionIndex=$("table.products tr[id='" +id+ "'] > td select.discType").val();
	var instant=parseFloat($("table.products tr[id='" +id+ "'] > td input.instant").val());
	if($("table.products tr[id='" +id+ "'] > td input.instant").val() == '')
		instant = 0.0;

	var wallet=parseFloat($("table.products tr[id='" +id+ "'] > td input.wallet").val());
	if($("table.products tr[id='" +id+ "'] > td input.wallet").val() == '')
		wallet = 0.0;

	var effectivePrice;
	if(effectivePrice == '')
		effectivePrice = 0.0;
	if(optionIndex =='0'){
		effectivePrice=((selling-int_cb_v)- (((selling-int_cb_v) * (instant/100)) +((selling - int_cb_v) * (wallet/100)))); 
		 
	}else if(optionIndex == '1'){
		effectivePrice=((selling-int_cb_v) - (instant  + wallet));
	}
	
	$.ajax(
			{
				type : "POST",
				dataType: 'html',
				url : '/PriceSimulator/ajax/rules/calculateCM.action',
				data : {sellingPrice : selling, offerPrice : effectivePrice, shippingCharges : shippingCharges , tpWithOverhead : seller , internalSellerCashback : int_cb_v },
				
				success : function(data)
				{	
					var CMPostCBPercent = parseFloat (data).toFixed(2);
					$("table.products tr[id='" +id+ "'] > td span.CM").html(CMPostCBPercent);
					$("table.products tr[id='" +id+ "'] > td span.CMPU").html(parseFloat((CMPostCBPercent * selling) / 100).toFixed(2));
					
				}
			});
	$("table.products tr[id='" +id+ "'] > td span.EP").html(effectivePrice);

}

function editOCP(){
	var supc;
	var vendorCode ;
	var instant;
	var walletCB;
	
	var discountType ;
	var startTime;
	var endTime;
	var createdTime;
	var int_cb_v;
	var mop;
	var EffectivePrice;
	var cmpu;
	$("table.products tr[id]").each(function()
    		{var id = $(this).attr("id");
			if(id.length){
				updateEditData($("table.products tr[id='" +id+ "'] > td input.instant") );
				showloader("table.products tr[id=\"" +id+ "\"] td:last-child");
				supc=$("table.products tr[id='" +id+ "'] > td span.supc").text();
				vendorCode=$("table.products tr[id='" +id+ "'] > td span.vendorCode").text();
				mop=$("table.products tr[id='" +id+ "'] > td span.MOP").text();
				
				int_cb_v=$("table.products tr[id='" +id+ "'] > td span.Int_cb_v").text();
				instant=parseFloat($("table.products tr[id='" +id+ "'] > td input.instant").val());
				walletCB=parseFloat($("table.products tr[id='" +id+ "'] > td input.wallet").val());
				discountType=$("table.products tr[id='" +id+ "'] > td select.discType").val();
				
				startTime=$("table.products tr[id='" +id+ "'] > td input.startTime").val();
				endTime=$("table.products tr[id='" +id+ "'] > td input.endTime").val();
				cmpu =  $("table.products tr[id='" +id+ "'] > td span.CMPU").text();
				createdTime=$("table.products tr[id='" +id+ "'] > td input.createdTime").val();
				EffectivePrice=$("table.products tr[id='" +id+ "'] > td span.EP").text();
				var selling = $("table.products tr[id='" +id+ "'] > td span.SP").text();
				$.ajax(
						{
							type : "POST",
							dataType: 'html',
							url : '/PriceSimulator/ajax/updateocp.action',
							data : {supc : supc, vendorCode :vendorCode, instant : instant, walletCB : walletCB
							,	discountType : discountType,startTime : startTime , endTime : endTime, createdTime : createdTime,sellingPrice : selling,
							mop : mop, int_cb_v : int_cb_v  , EffectivePrice : EffectivePrice, cmpu : cmpu},
							success : function(data)
							{
								if(data == 1)
								{
									hideloader("table.products tr[id=\"" +id+ "\"] td:last-child");
									$("table.products tr[id=\"" +id+ "\"] td:last-child").html("<span>Success</span>");
								}
								else
								{
									hideloader("table.products tr[id=\"" +id+ "\"] td:last-child");
									$("table.products tr[id=\"" +id+ "\"] td:last-child").html("<span style=\"color:red;\">Failed"+data+"</span>");
									
								}
							}
						});
			
			}
			
	
	
});

}

function updateAllProduct()
{
	var supc;
	var vendorCode ;
	var instant;
	var walletCB;
	
	var discountType ;
	var startTime;
	var endTime;
	var createdTime;
	var int_cb_v;
	var mop;
	var EffectivePrice;
	//alert('To process your changes please click PROCESS button at subcategory page');
    var ocpCheckboxes;
    var cmpu;
    var i=-1;
    $("table.products tr[id]").each(function()
    		{
    			ocpCheckboxes = document.getElementsByName('ocp');
    			i=i+1;
    				if (ocpCheckboxes[i].checked == true) {
    					var id = $(this).attr("id");
    					if(id.length){
    						updateData($("table.products tr[id='" +id+ "'] > td input.instant") );
    						showloader("table.products tr[id=\"" +id+ "\"] td:last-child");
    						supc=$("table.products tr[id='" +id+ "'] > td span.supc").text();
    						vendorCode=$("table.products tr[id='" +id+ "'] > td span.vendorCode").text();
    						mop=$("table.products tr[id='" +id+ "'] > td span.MOP").text();
    						int_cb_v=$("table.products tr[id='" +id+ "'] > td span.Int_cb_v").text();
    						instant=parseFloat($("table.products tr[id='" +id+ "'] > td input.instant").val());
    						walletCB=parseFloat($("table.products tr[id='" +id+ "'] > td input.wallet").val());
    						discountType=$("table.products tr[id='" +id+ "'] > td select.discountType").val();
    						startTime=$("table.products tr[id='" +id+ "'] > td input.startTime").val();
    						endTime=$("table.products tr[id='" +id+ "'] > td input.endTime").val();
    						
    						createdTime=$("table.products tr[id='" +id+ "'] > td input.createdTime").val();
    						EffectivePrice=$("table.products tr[id='" +id+ "'] > td span.EP").text();
    						var selling = $("table.products tr[id='" +id+ "'] > td span.SP").text();
    						cmpu =  $("table.products tr[id='" +id+ "'] > td span.CMPU").text();
    						$.ajax(
    								{
    									type : "POST",
    									dataType: 'html',
    									url : '/PriceSimulator/ajax/updateocp.action',
    									data : {supc : supc, vendorCode :vendorCode, instant : instant, walletCB : walletCB
    									,	discountType : discountType,startTime : startTime , endTime : endTime, createdTime : createdTime,sellingPrice : selling,
    									mop : mop, int_cb_v : int_cb_v  , EffectivePrice : EffectivePrice , cmpu : cmpu},
    									success : function(data)
    									{
    										if(data == 1)
    										{
    											hideloader("table.products tr[id=\"" +id+ "\"] td:last-child");
    											$("table.products tr[id=\"" +id+ "\"] td:last-child").html("<span>Success</span>");
    										}
    										else
    										{
    											hideloader("table.products tr[id=\"" +id+ "\"] td:last-child");
    											$("table.products tr[id=\"" +id+ "\"] td:last-child").html("<span style=\"color:red;\">Failed"+data+"</span>");
    											
    										}
    									}
    								});
    					
    					}
    					
    			}
    			
    		});
}


function removeProduct(){
	
	//alert('To process your changes please click PROCESS button at subcategory page');
    var ocpCheckboxes;
    var i=0;
   
    $("table.products tr[id]").each(function()
    		{
    	
    			ocpCheckboxes = document.getElementsByName('ocp');
    			
    				if (ocpCheckboxes[i].checked == true) {
    					var id = $(this).attr("id");
    					if(id.length){
    						vendorCode=$("table.products tr[id='" +id+ "'] > td span.vendorCode").text();
    						ocp=1;
    						$.ajax(
    								{
    									type : "POST",
    									dataType: 'html',
    									url : '/PriceSimulator/ajax/updateocp.action',
    									data : {vendorCode : vendorCode, ocp : ocp},
    									success : function(data)
    									{
    										
    									}
    								});
    					
    					}
    					i++;
    			}
    			
    		});
    $('.Toggle').attr('checked', false);
    $("#products tr:has(td > input[type=checkbox]:checked)").remove();
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