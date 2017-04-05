$(document).ready(function()
{	
	$(".SPTable").hide();
	$(".popularityTable").hide();
	$(".filterType").click(function()
			{
				if ($('#overall').is(':checked')){
					$(".SPTable").hide();
					$(".popularityTable").hide();
				}
				else if ($('#sellingPrice').is(':checked')){
					$(".SPTable").show();
					$(".popularityTable").hide();
				}
				else if ($('#popularity').is(':checked')){
					$(".SPTable").hide();
					$(".popularityTable").show();
				}
				else if ($('#popsell').is(':checked')){
					
					$(".SPTable").show();
					$(".popularityTable").show();
				}
			}
	);
	
	$("div.action > span.processesubcat").click(function()
			{
		
			showloader("div.action > div.report > div.bar");
			$.ajax(
					{
						type : "POST",
						dataType: 'html',
						url : '/PriceSimulator/ajax/updatesubcat.action',
						data : {operationType : "process"},
						success : function(data)
						{
			
							if(data == 1)
							{
								hideloader("div.action > div.report > div.bar");
								$("div.action > div.report > div.bar").html("<span>Request Accepted!</span>");
							}
							else
							{
								hideloader("div.action > div.report > div.bar");
								$("div.action > div.report > div.bar").html("<span style=\"color:red;\">Failed ! "+data+"</span>");
							}
						}
					});	
			});

	
	
	$("#updateSubcatBtn1").click(function()
	{
		showloader("div.action > div.report > div.bar");
		$(".subcattables").hide();
		$("#updateSubcatBtn1").attr('disabled',true);
		var active = $("div.criteriamenu ul > li.active").attr("rel");
		$("#"+active).fadeIn();

		$("div.criteriamenu ul > li").click(function()
		{
			if($(this).attr("rel") != null)
			{
				$("div.criteriamenu ul > li").removeClass("active");
				$(this).addClass("active");
				$(".subcattables").hide();
				var activeTab = $(this).attr("rel"); 
				$("#"+activeTab).fadeIn();
			}
		});
		
		var type;
		var filter = [];
		var cm = [];
		var gm = [];
		var cd = [];
		var md = [];
		var nc = [];
		var ncgm = [];
		var cmpu = [];
		var nccmpu =[];
		var startTime;
		var endTime;
		var idp;//instant Discount Percentage
		var wma;//Wallet min abs
		var compList = [];

		if($('#overall').is(':checked')){
			type = "OA";
		}
		else if($('#sellingPrice').is(':checked')){
			type = "SP";
		}
		else if($('#popularity').is(':checked')){
			type = "PR";
			}
		else{
			type = "PR;SP";
		}	
	
		if(type == "OA")
		{
			filter.push("NONE");
			cm.push($("table.subcatrules td.CM input").val());
			
			gm.push($("table.subcatrules td.GM input").val());
			cd.push($("table.subcatrules td.CD input").val());
			md.push($("table.subcatrules td.MD input").val());
			
			nc.push($("table.subcatrules td.NC input").val());
			
			ncgm.push($("table.subcatrules td.NCGM input").val());
			cmpu.push($("table.subcatrules td.CMPU input").val());
			nccmpu.push($("table.subcatrules td.NCCMPU input").val());

			startTime=$("table.subcatrules td.startTime input").val();
			endTime=$("table.subcatrules td.endTime input").val();
			idp = $("table.walletConf td.IDP input").val();
			wma = $("table.walletConf td.WMA input").val();

			$("div.compListSubcategory input:checkbox:checked").map(function(){
				compList = compList +$(this).val()+",";
			  });
			
			console.log(compList);
			
			
		}
		else if(type == "SP" || type == "PR")
		{
			//var row = $("div[id='" +table+ "'] > table.subcatrules").find("tr.rule");
			//for(var i=0; i<row.length; i++)
			//{
				if(type== "SP"){
					if(parseInt($("td.SPTo input").val()) == 0){
						$("div.action > div.report > div.bar").html("<span style=\"color:red;\">Invalid SP Range</span>");
						$("#updateSubcatBtn1").attr('disabled',false);
						return;
					}
						if($("td.SPTo input").val() == '' || $("td.SPFrom input").val()== ''){
							$("div.action > div.report > div.bar").html("<span style=\"color:red;\">SP Range should not be empty</span>");
							$("#updateSubcatBtn1").attr('disabled',false);
							return;
						}
					if(parseInt($("td.SPTo input").val()) <= parseInt($("td.SPFrom input").val())){
						$("div.action > div.report > div.bar").html("<span style=\"color:red;\">Invalid  Entry</span>");
						$("#updateSubcatBtn1").attr('disabled',false);
						return;
					}
					
					filter.push($("td.SPFrom input").val() + ":"+$("td.SPTo input").val());
				}else{
					if(parseInt($("td.PopularityTo input").val()) == 0){
						$("div.action > div.report > div.bar").html("<span style=\"color:red;\">Invalid Popularity Range</span>");
						$("#updateSubcatBtn1").attr('disabled',false);
						return;
					}if($("td.PopularityTo input").val() == '' || $("td.PopularityFrom input").val()== ''){
						$("div.action > div.report > div.bar").html("<span style=\"color:red;\">Popularity Range should not be empty</span>");
						$("#updateSubcatBtn1").attr('disabled',false);
						return;
					}
					if(parseInt($("td.PopularityTo input").val()) <= parseInt($("td.PopularityFrom input").val())){
						$("div.action > div.report > div.bar").html("<span style=\"color:red;\">Invalid  Entry</span>");
						$("#updateSubcatBtn1").attr('disabled',false);
						return;
					}
					filter.push($("td.PopularityFrom input").val() + ":"+$("td.PopularityTo input").val());
				}
				//filter.push($(row[i-1]).find("th.filter select").val() +":"+ $(row[i]).find("th.filter select").val());
				cm.push($("table.subcatrules td.CM input").val());
				gm.push($("table.subcatrules td.GM input").val());
				cd.push($("table.subcatrules td.CD input").val());
				md.push($("table.subcatrules td.MD input").val());
				nc.push($("table.subcatrules td.NC input").val());
				ncgm.push($("table.subcatrules td.NCGM input").val());
				cmpu.push($("table.subcatrules td.CMPU input").val());
				nccmpu.push($("table.subcatrules td.NCCMPU input").val());

				startTime=$("table.subcatrules td.startTime input").val();
				endTime=$("table.subcatrules td.endTime input").val();
				idp = $("table.walletConf td.IDP input").val();
				
				wma = $("table.walletConf td.WMA input").val();
				$("div.compListSubcategory input:checkbox:checked").map(function(){
					compList = compList +$(this).val()+",";
				  });
				
				console.log(compList);
			//}
		}
		else if(type == "PR;SP"){
			if(parseInt($("td.SPTo input").val()) == 0 || parseInt($("td.PopularityTo input").val()) == 0){
				$("div.action > div.report > div.bar").html("<span style=\"color:red;\">Invalid Range</span>");
				$("#updateSubcatBtn1").attr('disabled',false);
				return;
			}if($("td.SPTo input").val() == '' || $("td.SPFrom input").val()== ''||$("td.PopularityTo input").val() == '' || $("td.PopularityFrom input").val() == '' ){
				$("div.action > div.report > div.bar").html("<span style=\"color:red;\">SP/Popularity should not be empty</span>");
				$("#updateSubcatBtn1").attr('disabled',false);
				return;
			}
			
			if(parseInt($("td.PopularityTo input").val()) <= parseInt($("td.PopularityFrom input").val()) || parseInt($("td.SPTo input").val()) <= parseInt($("td.SPFrom input").val())){
				$("div.action > div.report > div.bar").html("<span style=\"color:red;\">Invalid  Entry</span>");
				$("#updateSubcatBtn1").attr('disabled',false);
				return;
			}
			
					filter.push($("td.PopularityFrom input").val() + ":"+$("td.PopularityTo input").val()+";"+$("td.SPFrom input").val() + ":"+$("td.SPTo input").val());
					cm.push($("table.subcatrules td.CM input").val());
					gm.push($("table.subcatrules td.GM input").val());
					cd.push($("table.subcatrules td.CD input").val());
					md.push($("table.subcatrules td.MD input").val());
					nc.push($("table.subcatrules td.NC input").val());
					ncgm.push($("table.subcatrules td.NCGM input").val());
					cmpu.push($("table.subcatrules td.CMPU input").val());
					nccmpu.push($("table.subcatrules td.NCCMPU input").val());
					startTime=$("table.subcatrules td.startTime input").val();
					endTime=$("table.subcatrules td.endTime input").val();
					idp= $("table.walletConf td.IDP input").val();
					wma = $("table.walletConf td.WMA input").val();
					$("div.compListSubcategory input:checkbox:checked").map(function(){
						compList = compList +$(this).val()+",";
					  });
					
					console.log(compList);
				//}
			//} 
					
		}
		
	
	/*	try {
			if (type == "OA" && cm[0] == "" && gm[0] == "" && md[0] == "" && cd[0] == ""
					&& nc[0] == "" && ncgm[0] == "") {
				var r = confirm("Update with all empty field will delete all subcategory rules.");
				if (r == false) {
				   return false;
				}

			}
		} catch (e) {
			// TODO: handle exception
		}*/
		
		$.ajax(
		{
			
			type : "POST",
			dataType: 'html',
			url : '/PriceSimulator/ajax/updatesubcat.action',
			data : {type : type, filter : JSON.stringify(filter), ncgm : JSON.stringify(ncgm),cm : JSON.stringify(cm), gm : JSON.stringify(gm), cd : JSON.stringify(cd), md : JSON.stringify(md), nc : JSON.stringify(nc),competitorList : compList,
				cmpu : JSON.stringify(cmpu), nccmpu : JSON.stringify(nccmpu), idp : idp ,wma : wma , startTime : startTime, endTime : endTime},
			success : function(data)
			{
				if(data==2)
				{
					hideloader("div.action > div.report > div.bar");
					$("div.action > div.report > div.bar").html("<span>Updated & Auto-Approved!</span>");
					redirectToViewSummary();
				}
				else if(data == 1)
				{
					hideloader("div.action > div.report > div.bar");
					$("div.action > div.report > div.bar").html("<span>Updated!</span>");
					redirectToViewSummary();
				}
				else if(data == -1)
				{
					$("div.action > div.report > div.bar").html("<span style=\"color:red;\">Internal Error! Sub Category rules not updated</span>");
				}
				else if(data.indexOf("del") !=-1)
					{
					hideloader("div.action > div.report > div.bar");
					alert("Subcategory level rules deleted.");
					$("div.action > div.report > div.bar").html("<span>Updated!</span>");
					}
				else
					{
					
					hideloader("div.action > div.report > div.bar");
					$("div.action > div.report > div.bar").html("<span style=\"color:red;\">"+"Failed !"+data+" </span>");
					}
				$("#updateSubcatBtn1").attr('disabled',false);
			},
			error: function(data){
				
				hideloader("div.action > div.report > div.bar");
				   $("#updateSubcatBtn1").attr('disabled',false);
				   $("div.action > div.report > div.bar").html("<span>"+"Failed ! "+data+"</span>");
			}
		});					
	});
	
	$("table.subcatrules tr.rule > th.first select").each(function()
	{
		$(this).find("option[value='undefined']").remove();
		var elements = [];
		var val = $(this).val();
		var second = $(this).parent().parent().parent().find("tr.rule > th.second select");
		var sval = second.val();
		$(this).parent().parent().parent().find("tr.rule > th.second select option").remove();
		$(this).find("option").each(function()
		{
			elements.push($(this).val());
		});
		for(var i=0; i<elements.length; i++)
			if(parseInt(elements[i]) > parseInt(val))
				if(sval == elements[i])
					second.append("<option selected='selected' value='" +elements[i]+ "'>" +elements[i]+ "</option>");
				else
					second.append("<option value='" +elements[i]+ "'>" +elements[i]+ "</option>");
	
	});
	
	$("table.subcatrules tr.rule > th.first select").change(function()
	{
		var elements = [];
		var val = $(this).val();
		var second = $(this).parent().parent().parent().find("tr.rule > th.second select");
		var sval = second.val();
		$(this).parent().parent().parent().find("tr.rule > th.second select option").remove();
		$(this).find("option").each(function()
		{
			elements.push($(this).val());
		});
		for(var i=0; i<elements.length; i++)
			if(parseInt(elements[i]) > parseInt(val))
				if(sval == elements[i])
					second.append("<option selected='selected' value='" +elements[i]+ "'>" +elements[i]+ "</option>");
				else
					second.append("<option value='" +elements[i]+ "'>" +elements[i]+ "</option>");
					
	});
	
	$("table.subcatrules tr > th.mainfirst select").each(function()
	{
		$(this).find("option[value='undefined']").remove();
		var elements = [];
		var val = $(this).val();
		var second = $(this).parent().parent().parent().parent().parent().find("table.subcatrules tr > th.mainsecond select");
		var sval = second.val();
		$(this).parent().parent().parent().parent().parent().find("table.subcatrules tr > th.mainsecond select option").remove();
		$(this).find("option").each(function()
		{
			elements.push($(this).val());
		});
		for(var i=0; i<elements.length; i++)
			if(parseInt(elements[i]) > parseInt(val))
				if(sval == elements[i])
					second.append("<option selected='selected' value='" +elements[i]+ "'>" +elements[i]+ "</option>");
				else
					second.append("<option value='" +elements[i]+ "'>" +elements[i]+ "</option>");
		
	});
			
	$("table.subcatrules tr > th.mainfirst select").change(function()
	{
		var elements = [];
		var val = $(this).val();
		var second = $(this).parent().parent().parent().parent().parent().find("table.subcatrules tr > th.mainsecond select");
		var sval = second.val();
		$(this).parent().parent().parent().parent().parent().find("table.subcatrules tr > th.mainsecond select option").remove();
		$(this).find("option").each(function()
		{
			elements.push($(this).val());
		});
		for(var i=0; i<elements.length; i++)
			if(parseInt(elements[i]) > parseInt(val))
				if(sval == elements[i])
					second.append("<option selected='selected' value='" +elements[i]+ "'>" +elements[i]+ "</option>");
				else
					second.append("<option value='" +elements[i]+ "'>" +elements[i]+ "</option>");
	
	});
});
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

function redirectToViewSummary(){
	var currurl = window.location.href;
	var tokens = currurl.split('/');
	window.location = tokens[0]+'//'+tokens[2]+'/'+tokens[3]+'/viewSummary.action';
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
