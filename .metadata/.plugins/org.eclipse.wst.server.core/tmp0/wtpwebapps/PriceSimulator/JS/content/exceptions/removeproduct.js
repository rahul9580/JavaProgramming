

$(document).ready(function()
{	
	var state = { 'page_id': 1, 'user_id': 5 };
	var title = 'Rules';
	var currurl = window.location.href;
	var tokens = currurl.split('/');
	var url = tokens[0]+'//'+tokens[2]+'/'+tokens[3]+'/'+tokens[4]+'/removeproduct.action';
	history.pushState(state, title, url);
	var index = currurl.indexOf("supcSearch");
	if ( index != -1) {
		$(".Pagination").remove();
	}
	$("input.deleteall").click(function()
	{
		var nplUserList = $(".nplUser").val();
		var ipsUserList = $(".ipsUser").val();
		var currentUser = $("#usernameTxt").val();
		var x = confirm("Are you sure you want to delete?");
		if (!x)
			return false;
		showloader("div.report > div.bar");
		var idList = [] ;
		var supc =[];
		var vendor = [];
		var source = [];
		var sourceCode = [];
		var startTime = [];
		var endTime = [] ;
		var username=[];
		$( ".id" ).each(function( index ) {
			  if (isValidForDelete($(this))) {
				  idList.push ($( this ).text());
			  }
			});
		
		$( ".supc" ).each(function( index ) {
			if (isValidForDelete($(this))) {
			  supc.push ($( this ).text());
			}
			});
		
		$( ".seller" ).each(function( index ) {
			if (isValidForDelete($(this))) {
			  vendor.push ($( this ).text());
			}
			});
		
		$( ".source" ).each(function( index ) {
			if (isValidForDelete($(this))) {
			  source.push ($( this ).text());
			}
			});
		
		$( ".sourceCode" ).each(function( index ) {
			if (isValidForDelete($(this))) {
			  sourceCode.push ($( this ).text());
			}
			});
		
		$( ".startTime" ).each(function( index ) {
			if (isValidForDelete($(this))) {
			  var result = $( this ).text();
			  if (!result || result.length == 0) {
				 
				  startTime.push ("0");
				  
			  }
			  else {
			  startTime.push ($( this ).text());
			  }
			}
			});
		
		$( ".endTime" ).each(function( index ) {
			if (isValidForDelete($(this))) {
			 var result = $( this ).text();
			  if (!result || result.length == 0) {
				  endTime.push ("0");
			  }
			  else {
			  endTime.push ($( this ).text());
			  }
			}
			});
		
		$( ".username" ).each(function( index ) {
			if (isValidForDelete($(this))) {
			 var result = $( this ).text();
			  if (!result || result.length == 0) {
				  username.push ("0");
			  }
			  else {
				  username.push ($( this ).text());
			  }
			}
			});
 
	
		$.ajax(
		{
			type : "POST",
			dataType: 'html',
			data: {action : "multipleType","list" : JSON.stringify(idList),"supcList" : JSON.stringify(supc) , "vendorList" : JSON.stringify (vendor) , "sourceList" : JSON.stringify(source) , "sourceCodeList":JSON.stringify(sourceCode) , "startTimeList" : JSON.stringify(startTime) , "endTimeList" : JSON.stringify(endTime), "usernameList" : JSON.stringify(username)},
			url : '/PriceSimulator/ajax/deleteremoveproduct.action',																																										   
			success : function(data)
			{
				
				if(data == 1)
				{
					hideloader("div.report > div.bar");
					$("table.products tr[id]").remove();
					$("div.report > div.bar").html("<span style=\"color:red;\"> SUPC removed from RFS");
				}else if(data == -1)
				{
					hideloader("div.report > div.bar");
					$("table.products tr[id]").remove();
					$("div.report > div.bar").html("<span style=\"color:red;\">No SUPC present to remove from RFS");
				}
				else if(data >0)
				{
					alert("Other Than NPL/IPS you do not own,SUPC removed from RFS");
					location.reload();
				}
				else
				{
					hideloader("div.report > div.bar");
					$("div.report > div.bar").html("<span>Internal Error! Could not delete All Product from Removal System</span>");
				}
			}
		});					
	});
});


function isValidForDelete (obj) {
	var id = $(obj).parent().parent().attr("id");
	var seller = $(obj).parent().parent().find("td.seller").attr("id");
	var source = $(obj).parent().parent().find("td.source").attr("id");
	var sourceCode = $(obj).parent().parent().find("td.sourceCode").attr("id");
	var startTime = $(obj).parent().parent().find("td.startTime").attr("id");
	var endTime = $(obj).parent().parent().find("td.endTime").attr("id");
	var incrementId = $(obj).parent().parent().find("td.id").attr("id");
	var username = $(obj).parent().parent().find("td.username").attr("id");
	var currentUser = $("#usernameTxt").val();
	console.log (startTime) ;
	if(username!=document.getElementById("usernameTxt").value && (sourceCode=="NPL" || sourceCode=="IPS"))
		{
		alert("You cannot delete NPL/IPS rfs.");
		return false;
		}
	else if (sourceCode == "NPL" && !isValidNPLUser(currentUser)) {
		alert("You cannot delete NPL rfs.");
		return false;
	}
	else if (sourceCode == "IPS" && !isValidIPSUser(currentUser)){
		alert("You cannot delete IPS rfs.");
		return false;
	}
	return true;
}

function insRow(data,trLast)
{	
	var trNew = trLast.clone();
	trNew.find (".id").text( data ["id"]);
	trNew.find (".popularityRank").text( data ["popularityRank"]);
	trNew.find (".supc").text( data ["supc"]);
	trNew.find (".Brand").text( data ["Brand"]);
	trNew.find (".Name").text( data ["Name"]);
	trNew.find (".seller").text( data ["seller"]);
	trNew.find (".source").text( data ["source"]);
	trNew.find (".sourceCode").text( data ["sourceCode"]);
	trNew.find (".startTime").text( data ["startTime"]);
	trNew.find (".endTime").text( data ["endTime"]);
	$('.products').append(trNew);
}




function searchBySupcVendor () {
	var supc = $(".supcSearch").val();
	var vendor = $(".vendorSearch").val();
	$.ajax(
			{
				type : "POST",
				dataType: 'html',
				async: false,
				url : '/PriceSimulator/ajax/searchRFS.action',
				data : {supc : supc , vendor : vendor},
				success : function(data)
				{	if (data != "-1") {
						data = data.replace(/&quot;/g,'"');
						var tableBody = $('.products').find("tbody");
						var trLast = tableBody.find("tr:last");
						 $(".products tbody tr").remove(); 
						
						var jsonArray = JSON.parse( data );
						for (var key in jsonArray["searchResult"]) {
					
						        insRow (jsonArray["searchResult"][key]["Name"] , trLast ) ;
						    
						}
					
						
						//insRow (data)
						
					}
				}
			});
}

function isValidNPLUser(username) {
	var nplUserList = $(".nplUser").val();
	return nplUserList.indexOf(username) !== -1 ;
}

function isValidIPSUser(username) {
	var ipsUserList = $(".ipsUser").val();
	return ipsUserList.indexOf(username) !== -1 ;
}

function removeSUPC(obj)
{
	
	var id = $(obj).parent().parent().attr("id");
	var seller = $(obj).parent().parent().find("td.seller").attr("id");
	var source = $(obj).parent().parent().find("td.source").attr("id");
	var sourceCode = $(obj).parent().parent().find("td.sourceCode").attr("id");
	var startTime = $(obj).parent().parent().find("td.startTime").attr("id");
	var endTime = $(obj).parent().parent().find("td.endTime").attr("id");
	var incrementId = $(obj).parent().parent().find("td.id").attr("id");
	var username = $(obj).parent().parent().find("td.username").attr("id");
	var currentUser = $("#usernameTxt").val();
	if(username!=document.getElementById("usernameTxt").value && (sourceCode=="NPL" || sourceCode=="IPS"))
		{
		alert("You cannot delete NPL/IPS rfs.");
		return false;
		}
	else if (sourceCode == "NPL" && !isValidNPLUser(currentUser)) {
		alert("You cannot delete NPL rfs.");
		return false;
	}
	else if (sourceCode == "IPS" && !isValidIPSUser(currentUser)){
		alert("You cannot delete IPS rfs.");
		return false;
	}
	else
		{
	if(id.length)
	{
		showloader("div.report > div.bar");
		$.ajax(
		{
			type : "POST",
			dataType: 'html',
			url : '/PriceSimulator/ajax/deleteremoveproduct.action',
			data : {supc : id, seller : seller,source : source , sourceCode : sourceCode , startTime : startTime , endTime : endTime , action : "singleType" , id : incrementId },
			success : function(data)
			{
				if(data == 1)
				{
					hideloader("div.report > div.bar");
					$(obj).parent().parent().remove();
					$("div.report > div.bar").html("SUPC Removed from RFS");
				}
				else
				{
					hideloader("div.report > div.bar");
					$("div.report > div.bar").html("<span>Internal Error! Could not delete Product from Removal System</span>");
				}
			}
		});		
	}
	else
	{
		hideloader("div.report > div.bar");
		$("div.report > div.bar").html("<span>Internal Error! Could not delete Product from Removal System</span>");
	}
		}
}



function movePage(value, currentPageNo) {

	var temp = parseInt(currentPageNo);
	if (value == "previous" && temp > 1)
		temp = temp - 1;
	if (value == "next")
		temp = temp + 1;

	var tempString = "changeCurrentPage";
	
	window.location
			.replace("/PriceSimulator/exceptions/removeproduct.action?pageNum="+temp);
}

function ConfirmDelete(obj)
{
  var x = confirm("Are you sure you want to delete?");
  if (x)
	  removeSUPC(obj);
  else
    return false;
}