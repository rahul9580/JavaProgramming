$(document).ready(function()
{

	/*$("table.products span.deleteall").click(function()*/
	$("input.deleteall").click(function()
	{
		var x = confirm("Are you sure you want to delete?");
		if (!x)
			return false;
		showloader("div.report > div.bar");
		$.ajax(
		{
			type : "POST",
			dataType: 'html',
			url : '/PriceSimulator/ajax/deletemop.action',
			success : function(data)
			{
				if(data == 1)
				{
					hideloader("div.report > div.bar");
					$("table.products tr[id]").remove();
					$("div.report > div.bar").html("<span style=\"color:red;\"> SUPC removed from MOP");
				}else if(data == -1)
				{
					hideloader("div.report > div.bar");
					$("table.products tr[id]").remove();
					$("div.report > div.bar").html("<span style=\"color:red;\"> NO SUPC present in MOP to delete");
				}
				else
				{
					hideloader("div.report > div.bar");
					$("div.report > div.bar").html("<span>Internal Error! Could not delete All Products MOP</span>");
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
		showloader("div.report > div.bar");
		$.ajax(
		{
			type : "POST",
			dataType: 'html',
			url : '/PriceSimulator/ajax/deletemop.action',
			data : {supc : id},
			success : function(data)
			{
				if(data == 1)
				{
					hideloader("div.report > div.bar");
					$(obj).parent().parent().remove();
					$("div.report > div.bar").html("<span style=\"color:red;\"> SUPC removed from MOP");
				}
				else
				{
					hideloader("div.report > div.bar");
					$("div.report > div.bar").html("<span>Internal Error! Could not delete Products MOP</span>");
				}
			}
		});		
	}
	else
	{
		hideloader("div.report > div.bar");
		$("div.report > div.bar").html("<span>Internal Error! Could not delete Products MOP</span>");
	}
}

function ConfirmDelete(obj)
{
  var x = confirm("Are you sure you want to delete?");
  if (x)
	  removeSUPC(obj);
  else
    return false;
}
