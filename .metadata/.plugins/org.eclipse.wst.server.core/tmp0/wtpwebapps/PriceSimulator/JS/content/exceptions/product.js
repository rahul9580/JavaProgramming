$(document).ready(function()
{
	$("div.expuprightpanel > table.products span.deleteall").click(function()
	{
		showloader("div.expupleftpanel > div.report > div.bar");
		$.ajax(
		{
			type : "POST",
			dataType: 'html',
			url : '/PriceSimulator/ajax/deleteproduct.action',
			success : function(data)
			{
				if(data == 1)
				{
					$("div.expuprightpanel > table.products tr[id]").remove();
					$("div.expupleftpanel > div.report > div.bar").html("");
				}
				else
				{
					$("div.expupleftpanel > div.report > div.bar").html("<span>Internal Error! Could not delete Exceptions</span>");
				}
			}
		});					
	});
});

function removeSUPC(obj)
{
	var id = $(obj).parent().parent().attr("id");
	if(id.length)
	{
		showloader("div.expupleftpanel > div.report > div.bar");
		$.ajax(
		{
			type : "POST",
			dataType: 'html',
			url : '/PriceSimulator/ajax/deleteproduct.action',
			data : {supc : id},
			success : function(data)
			{
				if(data == 1)
				{
					hideloader("div.expupleftpanel > div.report > div.bar");
					$(obj).parent().parent().remove();
					$("div.expupleftpanel > div.report > div.bar").html("");
				}
				else
				{
					hideloader("div.expupleftpanel > div.report > div.bar");
					$("div.expupleftpanel > div.report > div.bar").html("<span>Internal Error! Could not delete SUPC from Exceptions</span>");
				}
			}
		});		
	}
	else
	{
		hideloader("div.expupleftpanel > div.report > div.bar");
		$("div.expupleftpanel > div.report > div.bar").html("<span>Internal Error! Could not delete SUPC from Exceptions</span>");
	}
}
