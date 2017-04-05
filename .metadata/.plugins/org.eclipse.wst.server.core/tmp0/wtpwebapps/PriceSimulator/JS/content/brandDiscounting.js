$(document).ready(function()
		{
	debugger
	
	$("input.brandDiscountingBtn").click(function()
			{	

		$.ajax(
				{
					type : "POST",
					dataType: 'html',
					url : '/PriceSimulator/exceptions/uploadBrandDiscountingConfig.action',
					success : function(data)
					{
						if(data != null)
						{
							$("div.report > div.bar").html("<s:property value=\"%{#session.brandDiscountStatus}\"/>");
						}
					}
				});
		
		$.ajax(
				{
					type : "POST",
					dataType: 'html',
					url : '/PriceSimulator/exceptions/downloadBrandDiscountingConfig.action',
					success : function(data)
					{
						if(data != null)
						{
							$("div.report > div.bar").html("<s:property value=\"%{#session.brandDiscountStatus}\"/>");
						}
					}
				});
			});
		});