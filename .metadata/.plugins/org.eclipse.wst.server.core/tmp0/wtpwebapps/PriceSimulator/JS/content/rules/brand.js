
function updateBrandID(obj)
{
	$(obj).find("option[value='-1']").remove();
	var row = $(obj).parent();
	var id = $(obj).val();
	row.attr("id",id);
}
function updateBrand(row)
{ 	
	
	//alert('To process your changes please click PROCESS button at subcategory page');
	showloader("div.action > div.report1 > div.bar");
	$("#updatebrandBtn1").attr('disabled',true);
	var id = $(".brand option:selected").val();
	if(id.length)
	{
		
		var brandid = [];
		var brandname = [];
		var cm = [];
		var gm = [];
		var cd = [];
		var md = [];
		var nc = [];
		var ncgm=[];
		var cmpu=[];
		var ncCmpu=[];
		var gmpu=[];
		var ncGmpu=[];
		var startTime;
		var endTime;
		var idp;//instant Discount Percentage
		var wma;//Wallet min abs

		var compList = [];
		brandid.push(id);
		
		if($("select").length)
			brandname.push($(".brand").find(':selected').text());
		cm.push($(" td.CM input").val());

		
		gm.push($(" td.GM input").val());
		cd.push($(" td.CD input").val());
		md.push($(" td.MD input").val());
		nc.push($("td.NC input").val());
		ncgm.push($("td.NCGM input").val());
		startTime=$("td.startTime input").val();
		endTime=$("td.endTime input").val();
		idp = $(".idp").val();
		wma = $(".wma").val();
		cmpu.push($(".CMPerUnit").val());
		ncCmpu.push($(".noCompetitorCMPerUnit").val());
		gmpu.push($(".GMPerUnit").val());
		ncGmpu.push($(".noCompetitorGMPerUnit").val());
		$("div.compListBrand input:checkbox:checked").map(function(){
			compList = compList +$(this).val()+",";
		  });
		$.ajax(
		{
			type : "POST",
			dataType: 'html',
			url : '/PriceSimulator/ajax/updatebrand.action',

			data : {brandid : JSON.stringify(brandid), brandname : JSON.stringify(brandname), ncgm : JSON.stringify(ncgm), cm : JSON.stringify(cm), gm : JSON.stringify(gm), cd : JSON.stringify(cd), md : JSON.stringify(md), nc : JSON.stringify(nc),cmpu:JSON.stringify(cmpu),nccmpu:JSON.stringify(ncCmpu),cmpu:JSON.stringify(gmpu),nccmpu:JSON.stringify(ncGmpu),competitorList : compList,
				idp : idp ,wma : wma,startTime : startTime , endTime : endTime},


			success : function(data)
			{
				if(data == 1)
				{
					hideloader("div.action > div.report1 > div.bar");
					$("div.action > div.report1 > div.bar").html("<span>Updated</span>");
					redirectToViewSummary();
					
				}
				else if(data == 2)
				{
					hideloader("div.action > div.report1 > div.bar");
					$("div.action > div.report1 > div.bar").html("<span>Updated & Auto Approved</span>");
					redirectToViewSummary();
				}
				else if (data ==-1)
				{
					hideloader("div.action > div.report1 > div.bar");
					$("div.action > div.report1 > div.bar").html$("div.action > div.report1 > div.bar").html("<span style=\"color:red;\">Failed !Error in input</span>");
				}
				else 
				{
					hideloader("div.action > div.report1 > div.bar");
					$("div.action > div.report1 > div.bar").html("<span style=\"color:red;\">Failed ! "+data+"</span>");
				}
				$("#updatebrandBtn1").attr('disabled',false);
			},
			error: function(data){
				alert("Failed !");
				hideloader("div.action > div.report1 > div.bar");
				   $("#updatebrandBtn1").attr('disabled',false);
				   $("div.action > div.report > div.bar").html("<span>"+"Failed ! "+data+"</span>");
			}
		});
	}
}
function deleteBrand(row)
{
	if(confirm("Please click on PROCESS BUTTON in Subcategory Page to apply changes."))
	{
		if($(row).parent().parent().find("th select").length)
			$(row).parent().parent().remove();
		else
		{
			var id = $(row).parent().parent().attr("id");
			if(id.length)
			{
				showloader("table.brandrules tr[id=\"" +id+ "\"] td:last-child");
				$.ajax(
				{
					type : "POST",
					dataType: 'html',
					url : '/PriceSimulator/ajax/deletebrand.action',
					data : {brandid : id},
					success : function(data)
					{
						if(data == 1)
						{
							
							$("table.brandrules tr[id='" +id+ "']").remove();
						}
						else if(data==2)
							$("table.brandrules tr[id='" +id+ "']").remove();
						else
						{
							hideloader("table.brandrules tr[id=\"" +id+ "\"] td:last-child");
							var cm = data;
							var st = "<span style=\"color:red;\">Failed ! </span>"
							$("table.brandrules tr[id=\"" +id+ "\"] td:last-child").html(st);
						}
					}
				});
			}
		}
	}
}
function addBrand()
{
	if(!$("table.brandrules tr th select").length)
	{
		showloader("div.load");
		$.ajax(
		{
			type : "POST",
			dataType: 'html',
			url : '/PriceSimulator/ajax/listbrand.action',
			success : function(data)
			{
				if(data != -1)
				{
					hideloader("div.load");
					var listBrand = data.split(";");
					var tempBrand =" Brand : <select id=brand>";
					//var temp = "<tr><th><select onChange=\"updateBrandID(this)\">";
					tempBrand = tempBrand + "<option value='-1'>Select</option>";
					$.each(listBrand, function(idx, obj)
					{
						tempBrand = tempBrand + "<option value='" +obj.split(":")[0]+ "'>" +obj.split(":")[1]+ "</option>";
					});
					tempBrand=tempBrand + "</select>"
					/*temp = temp + "</select></th>" + 
								"<td class=\"CM\"><input type=\"number\" step=\"0.1\" onkeypress=\"validate(event)\"></td>" +
								"<td class=\"GM\"><input type=\"number\" step=\"0.1\" onkeypress=\"validate(event)\"></td>" +
								"<td class=\"CD\"><input type=\"number\" step=\"0.1\" onkeypress=\"validate(event)\"></td>" +
								"<td class=\"MD\"><input type=\"number\" step=\"0.1\" onkeypress=\"validate(event)\"></td>" +
								"<td class=\"NC\"><input type=\"number\" step=\"0.1\" onkeypress=\"validate(event)\"></td>" +
								"<td class=\"NCGM\"><input type=\"number\" step=\"0.1\" onkeypress=\"validate(event)\"></td>" +
							
								"<td>" +
									"<span class=\"button button_green updatebrand\" onclick=\"updateBrand(this)\">Update</span>" +
									"<span class=\"button button_pink deletebrand\" onclick=\"deleteBrand(this)\">X</span>" +
								"</td>" +
								"<td></td>" +
							"</tr>";*/	
					$("table.brandrules").append(tempBrand);
					$("div.load").html("");
				}
				else
				{
					hideloader("div.load");
					$("div.load").html("Internal Error");
				}
			}
		});
	}
}

function EditBrand()
{
	//alert('To process your changes please click PROCESS button at subcategory page');
	showloader("div.action > div.report1 > div.bar");
	$("#editbrandBtn1").attr('disabled',true);
	var id = $(".id").val();
	var brandid = [];
	var brandname = [];
	var cm = [];
	var gm = [];
	var cd = [];
	var md = [];
	var nc = [];
	var ncgm=[];
	var startTime;
	var endTime;
	var cmpu=[] ;
	var ncCmpu=[];
	var idp;//instant Discount Percentage
	var wma;//Wallet min abs
	var compList = [];
	brandid.push(id);
	brandname.push($(".brand").val());
		
	cm.push($(" td.CM input").val());
	gm.push($(" td.GM input").val());
	cd.push($(" td.CD input").val());
	md.push($(" td.MD input").val());
	nc.push($("td.NC input").val());
	ncgm.push($("td.NCGM input").val());
	startTime=$("td.startTime input").val();
	endTime=$("td.endTime input").val();
	idp = $("table.walletConf td.IDP input").val();
	wma = $("table.walletConf td.WMA input").val();
	cmpu.push($(".CMPerUnit").val());
	ncCmpu.push($(".noCompetitorCMPerUnit").val()) ;
	$("div.compListBrand input:checkbox:checked").map(function(){
		compList = compList +$(this).val()+",";
	  });
	$.ajax(
	{
		type : "POST",
		dataType: 'html',
		url : '/PriceSimulator/ajax/updatebrand.action',
		data : {brandid : JSON.stringify(brandid), brandname : JSON.stringify(brandname), ncgm : JSON.stringify(ncgm), cm : JSON.stringify(cm), gm : JSON.stringify(gm), cd : JSON.stringify(cd), md : JSON.stringify(md), nc : JSON.stringify(nc),cmpu:JSON.stringify(cmpu),nccmpu:JSON.stringify(ncCmpu),competitorList : compList,
			idp : idp ,wma : wma,startTime : startTime , endTime : endTime},
	
		success : function(data)
		{
			if(data == 1)
			{	
				hideloader("div.action > div.report1 > div.bar");
				$("div.action > div.report1 > div.bar").html("<span>Updated</span>");
				redirectToViewSummary();
			}
			else if(data == 2)
			{
				hideloader("div.action > div.report1 > div.bar");
				$("div.action > div.report1 > div.bar").html("<span>Updated & Auto Approved</span>");
				redirectToViewSummary();
			}
			else if (data ==-1)
			{
				
				hideloader("div.action > div.report1 > div.bar");
				$("div.action > div.report1 > div.bar").html("<span style=\"color:red;\">Failed !Error in input</span>");
			}
			else 
			{
				hideloader("div.action > div.report1 > div.bar");
				$("div.action > div.report1 > div.bar").html("<span style=\"color:red;\">Failed ! "+data+"</span>");
			}
			$("#editbrandBtn1").attr('disabled',false);
		},
		error: function(data){
			alert("Failed");
			
			   hideloader("div.action > div.report1 > div.bar");
			   $("#editbrandBtn1").attr('disabled',false);
			   $("div.action > div.report > div.bar").html("<span>"+"Failed ! "+data+"</span>");
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

function redirectToViewSummary(){
	var currurl = window.location.href;
	var tokens = currurl.split('/');
	window.location = tokens[0]+'//'+tokens[2]+'/'+tokens[3]+'/viewSummary.action';
}

