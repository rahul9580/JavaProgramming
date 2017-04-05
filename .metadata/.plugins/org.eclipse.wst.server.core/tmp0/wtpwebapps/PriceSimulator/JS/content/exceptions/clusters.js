$(document).ready(function()
{
	$("div.createcluster > span.create").click(function()
	{
		showloader("div.clusterleftpanel > div.report > div.bar");
		var clustername = $("div.createcluster > input.name").val();
		if(clustername == "")
		{
			$("div.createcluster > input.name").css("border-color", "#ff0000");
			$("div.createcluster > span.namehead").css("color", "#ff0000");
			$("div.clusterleftpanel > div.report > div.bar").html("");
		}
		else
		{
			$.ajax(
			{
				type : "POST",
				dataType: 'html',
				url : '/PriceSimulator/ajax/createcluster.action',
				data : {name : clustername},
				success : function(data)
				{
					if(data > 0)
					{
						hideloader("div.clusterleftpanel > div.report > div.bar");
						$("div.clusterrightpanel").append("" +
							"<div id=\"" +data+ "\" class=\"cluster\">" +
								"<div class=\"head\"><h2>" +clustername+ "</h2><span class=\"button button_pink delete\" onclick=\"deleteCluster(this)\">X</span></div>" +
								"<div class=\"products\">" +
									"<table></table>" +
								"</div>" +
							"</div>");
						$("div.clusterleftpanel > div.actions select.choosecluster").append("" +
								"<option value=\"" +data+ "\">" +clustername+ "</option>");
						$("div.clusterleftpanel > div.report > div.bar").html("");
					}
					else
					{
						hideloader("div.clusterleftpanel > div.report > div.bar");
						$("div.clusterleftpanel > div.report > div.bar").html("<span>Internal Error! Cluster Cloud not be created</span>");
					}
				}
			});					
		}
	});
	
	$("div.actions select.choosecluster").change(function()
	{
		showloader("div.clusterleftpanel > div.report > div.bar");
		var select = $("div.actions select.choosecluster").val();
		if(select != -1)
		{
			$.ajax(
			{
				type : "POST",
				dataType: 'html',
				url : '/PriceSimulator/ajax/prepareclustertemp.action',
				data : {clusterid : select},
				success : function(data)
				{
					if(data != "-1")
					{
						hideloader("div.clusterleftpanel > div.report > div.bar");
						$("div.actions > select.choosecluster option[value='-1']").remove();	
						$("div.actions a").attr("href", "/PriceSimulator/Temp/" + data);
						$("div.clusterleftpanel > div.report > div.bar").html("");
					}
					else
					{
						hideloader("div.clusterleftpanel > div.report > div.bar");
						$("div.clusterleftpanel > div.report > div.bar").html("<span>Internal Error! Downloadable template not created</span>");
					}
				}
			});
		}
	});
});

function deleteCluster(obj)
{
	if(confirm("Please click on PROCESS BUTTON at Subcategory Page to apply changes."))
	{
		showloader("div.clusterleftpanel > div.report > div.bar");
		var id = $(obj).parent().parent().attr("id");
		if(id.length)
		{
			$.ajax(
			{
				type : "POST",
				dataType: 'html',
				url : '/PriceSimulator/ajax/deletecluster.action',
				data : {clusterid : id},
				success : function(data)
				{
					if(data == 1)
					{
						hideloader("div.clusterleftpanel > div.report > div.bar");
						$("div.actions > select.choosecluster option[value='" +id+ "']").remove();
						$("div.clusterrightpanel > div[id='" +id+ "']").remove();
						$("div.clusterleftpanel > div.report > div.bar").html("");
					}
					else
					{
						hideloader("div.clusterleftpanel > div.report > div.bar");
						$("div.clusterleftpanel > div.report > div.bar").html("Internal Error! Unable to delete Cluster");
					}
				}
			});					
		}
		else
		{
			hideloader("div.clusterleftpanel > div.report > div.bar");
			$("div.clusterleftpanel > div.report > div.bar").html("Internal Error! Cluster malformed link");
		}
	}
}

function deleteSUPC(obj)
{
	
	
	showloader("div.clusterleftpanel > div.report > div.bar");
	
	var id = $(obj).parent().parent().parent().parent().parent().parent().attr("id");
	if(id.length)
	{
		$.ajax(
		{
			type : "POST",
			dataType: 'html',
			url : '/PriceSimulator/ajax/deleteclustersupc.action',
			data : {clusterid : id},
			success : function(data)
			{
				if(data != -1)
				{
					hideloader("div.clusterleftpanel > div.report > div.bar");
					$(obj).parent().parent().remove();
					$("div.clusterleftpanel > div.report > div.bar").html("");
				}
				else
				{
					hideloader("div.clusterleftpanel > div.report > div.bar");
					$("div.clusterleftpanel > div.report > div.bar").html("Internal Error! Unable to delete SUPC");
				}
			}
		});					
	}
	else
	{
		hideloader("div.clusterleftpanel > div.report > div.bar");
		$("div.clusterleftpanel > div.report > div.bar").html("Internal Error! malformed link");
	}
}
function pop(div) {
	document.getElementById(div).style.display = 'block';
}
function hide(div) {
	document.getElementById(div).style.display = 'none';
}
//To detect escape button
document.onkeydown = function(evt) {
	evt = evt || window.event;
	if (evt.keyCode == 27) {
		hide('popDiv');
		hide('parentpopDiv');
	}
};
function exportData(type,obj)
{	
	 
	var table = document.getElementById("popup");
	table.innerHTML = "";
	var header = table.createTHead();

	// Create an empty <tr> element and add it to the first position of <thead>:
	var row = header.insertRow(0); 
	var cell = row.insertCell(0);

	// Add some bold text in the new cell:
	cell.innerHTML = "<u><b>"+type +" list</b></u>";
	var clusterId=obj.parentNode.parentNode.parentNode.id;
	var url="fetchData.action?type="+type+"&clusterId="+clusterId;
	

$.ajax(
		{
			type : "GET",
			dataType: 'html',
			url : url,
			success : function(data)
			{
				
				if(data != -1)
				{
					
					var list = data.split(";");
					  
					$.each(list, function(idx, obj)
							{
								
						/* var o = new Option(obj.split(":")[0], obj.split(":")[1]);
		            $(o).html(obj.split(":")[0]);
		            $("#SellerLeftList").append(o);*/
						
						
					 
						var rowCount = table.rows.length;
						 var row = table.insertRow(rowCount);
					   
					    row.insertCell(0).innerHTML= obj;
					    
				            
					   
					});
					
				}
				
			}
		});
pop('parentpopDiv');	
pop('popDiv');
	
	}
