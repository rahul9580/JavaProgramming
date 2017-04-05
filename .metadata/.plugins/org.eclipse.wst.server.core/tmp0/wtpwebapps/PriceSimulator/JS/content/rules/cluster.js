function updateCluster(row)
{
	//alert('To process your changes please click PROCESS button at subcategory page');
    
	var id = $(row).parent().parent().attr("id");
	if(id.length)
	{
		showloader("table.clusterrules tr[id=\"" +id+ "\"] td:last-child");
		var clusterid = [];
		var clustername = [];
		var cm = [];
		var gm = [];
		var cd = [];
		var md = [];
		var nc = [];
		var ncgm=[];
		
		clusterid.push(id);
		clustername.push($("table.clusterrules tr[id='" +id+ "'] > th").text());
		cm.push($("table.clusterrules tr[id='" +id+ "'] > td.CM input").val());
		gm.push($("table.clusterrules tr[id='" +id+ "'] > td.GM input").val());
		cd.push($("table.clusterrules tr[id='" +id+ "'] > td.CD input").val());
		md.push($("table.clusterrules tr[id='" +id+ "'] > td.MD input").val());
		nc.push($("table.clusterrules tr[id='" +id+ "'] > td.NC input").val());
		ncgm.push($("table.clusterrules tr[id='" +id+ "'] > td.NCGM input").val());
	
		$.ajax(
		{
			type : "POST",
			dataType: 'html',
			url : '/PriceSimulator/ajax/updatecluster.action',
			data : {clusterid : JSON.stringify(clusterid), clustername : JSON.stringify(clustername), ncgm : JSON.stringify(ncgm) ,cm : JSON.stringify(cm), gm : JSON.stringify(gm), cd : JSON.stringify(cd), md : JSON.stringify(md), nc : JSON.stringify(nc)},
			success : function(data)
			{
				if(data == 1){
					hideloader("table.clusterrules tr[id=\"" +id+ "\"] td:last-child");
					$("table.clusterrules tr[id=\"" +id+ "\"] td:last-child").html("<span>Updated</span>");
				}else if(data == -1){
					hideloader("table.clusterrules tr[id=\"" +id+ "\"] td:last-child");
					$("table.clusterrules tr[id=\"" +id+ "\"] td:last-child").html("<span style=\"color:red;\">Failed</span>");
				}else 
				{
					hideloader("table.clusterrules tr[id=\"" +id+ "\"] td:last-child");
					var st = "<span style=\"color:red;\">Failed ! "+data+"</span>"
					$("table.clusterrules tr[id=\"" +id+ "\"] td:last-child").html(st);
				}	
			}
		});
	}
}
function deleteCluster(row)
{
	if(confirm("Please click on PROCESS BUTTON in Subcategory Page to apply changes."))
	{	
		var id = $(row).parent().parent().attr("id");
		if(id.length)
		{
			showloader("table.clusterrules tr[id=\"" +id+ "\"] td:last-child");
			$.ajax(
			{
				type : "POST",
				dataType: 'html',
				url : '/PriceSimulator/ajax/deletecluster.action',
				data : {clusterid : id},
				success : function(data)
				{
					if(data == 1)
					{	$("table.clusterrules tr[id='" +id+ "']").remove();
					}
					else if(data ==2)
						$("table.clusterrules tr[id='" +id+ "']").remove();
					else{
						hideloader("table.clusterrules tr[id=\"" +id+ "\"] td:last-child");
						$("table.clusterrules tr[id=\"" +id+ "\"] td:last-child").html("<span style=\"color:red;\">Failed</span>");
					}
				}
			});
		}
	}
}
function updateAllCluster()
{	
	var clusterid = [];
	var clustername = [];
	var cm = [];
	var gm = [];
	var cd = [];
	var md = [];
	var nc = [];
	var ncgm = [];
	
	//alert('To process your changes please click PROCESS button at subcategory page');
    
	$("table.clusterrules tr[id]").each(function()
	{
		var id = $(this).attr("id");
		if(id > 0)
		{
			clusterid.push(id);
			clustername.push($("table.clusterrules tr[id='" +id+ "'] > th").text());
			cm.push($("table.clusterrules tr[id='" +id+ "'] > td.CM input").val());
			gm.push($("table.clusterrules tr[id='" +id+ "'] > td.GM input").val());
			cd.push($("table.clusterrules tr[id='" +id+ "'] > td.CD input").val());
			md.push($("table.clusterrules tr[id='" +id+ "'] > td.MD input").val());
			nc.push($("table.clusterrules tr[id='" +id+ "'] > td.NC input").val());
			ncgm.push($("table.clusterrules tr[id='" +id+ "'] > td.NCGM input").val());
			showloader("table.clusterrules tr[id='" +id+ "'] td:last-child");
			
		}
	});
	
	$.ajax(
	{
		type : "POST",
		dataType: 'html',
		url : '/PriceSimulator/ajax/updatecluster.action',
		data : {clusterid : JSON.stringify(clusterid), clustername : JSON.stringify(clustername), ncgm : JSON.stringify(ncgm), cm : JSON.stringify(cm), gm : JSON.stringify(gm), cd : JSON.stringify(cd), md : JSON.stringify(md), nc : JSON.stringify(nc)},
		success : function(data)
		{
			if(data == 1)
			{
				$("table.clusterrules tr[id]").each(function()
				{
					hideloader("table.clusterrules tr[id='" +id+ "'] td:last-child");
					var id = $(this).attr("id");
					$("table.clusterrules tr[id=\"" +id+ "\"] td:last-child").html("<span>Updated</span>");
				});
			}
			else if(data == -1)
			{	hideloader("table.clusterrules tr[id='" +id+ "'] td:last-child");
				$("table.clusterrules tr[id]").each(function()
						{
							var id = $(this).attr("id");
							$("table.clusterrules tr[id=\"" +id+ "\"] td:last-child").html("<span style=\"color:red;\">Failed</span>");
						});
			}
			else
			{
				hideloader("table.clusterrules tr[id='" +id+ "'] td:last-child");
				$("table.clusterrules tr[id]").each(function()
				{
					var st = "<span style=\"color:red;\">Failed !</span>";
					var id = $(this).attr("id");
					$("table.clusterrules tr[id=\"" +id+ "\"] td:last-child").html(st);
				});
			}
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

function exportData(type)
{
	//alert(type);
	}

