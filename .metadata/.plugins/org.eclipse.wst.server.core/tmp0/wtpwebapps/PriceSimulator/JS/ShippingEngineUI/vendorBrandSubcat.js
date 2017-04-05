/**
 * 
 */

function handleAddEvent() {
	if (!validationforDelete ()) {
		return ;
	}
	$(".UIForm").find(".action").val("ADD");
	if ($.trim($("#shippingCharge").val()).length == 0) {
		alert ("Please Fill the Shipping charge") ;
		return ;
	}
	$(".UIForm").submit();
}

function handleDeleteEvent() {
	

	if (!validationforDelete ()) {
		return ;
	}
	var r = confirm("Are you sure you want to delete.");
	if (r == false) {
		requestValid=false;
	   return;
	}
	$(".UIForm").find(".action").val("DELETE");
	$(".UIForm").submit();
}

function validationforDelete () {
	if ($.trim($(".subcatId").val()).length == 0) {
		alert ("Please Select Subcategory") ;
		return false ;
	}
	if ($.trim($(".brandId").val()).length == 0){
		alert ("Please Select Brand") ;
		return false ;
	}
	var length = $('#SellerRightList').children('option').length;
	if (length == 0) {
		alert ("Please Select the sellers") ;
		return false ;
	}
	return true ;
}

var subcatMapping = {};
var brandMapping = {};
$(document).ready(function() {
			
	var jsonObj ={};

	$.ajax({
		type : "POST",
		dataType : 'json',
		async : false,
		url : 'vendorBrandSubcat.action?action=ListSubcat',
		success : function(data) {

			if (data != -1) {
				jsonObj.data = data;
				//console.log (jsonObj) ;
			} else {
				alert("Internal Server Error");
			}
		}
	});

	var subcatList = [];
	
	for ( var i in jsonObj.data) {
		subcatList.push(jsonObj.data[i]);
		var key = Object.getOwnPropertyNames(jsonObj.data[i]);
		subcatMapping[key] = jsonObj.data[i][key]
		//console.log(jsonObj[i][key]);
	}
	for (key in subcatMapping) {
		subcatList.push(key) ;
	}
	//console.log(subcatList);
/*	 var k = Object.getOwnPropertyNames(subcatList[0]);
	 console.log (k[0]) ;
	for ( var i in jsonObj) {
		var key = Object.getOwnPropertyNames(i);
		console.log(key);
	}*/

           var availableTutorials = [
              "ActionScript",
              "Boostrap",
              "C",
              "C++",
           ];
           $( "#subcategory" ).autocomplete({
              source: subcatList
           });
       
	/*var jsonObj;

	$.ajax({
		type : "POST",
		dataType : 'json',
		async : false,
		url : 'vendorBrandSubcat.action?action=ListSubcat',
		success : function(data) {

			if (data != -1) {
				jsonObj = data;
			} else {
				$("div.load").html("Internal Error");
			}
		}
	});

	var subcatList = [];
	for ( var i in jsonObj) {
		subcatList.push(jsonObj[i].value);
	}

	var options = {

		data : jsonObj,

		getValue : function(element) {
			return element.value;
		}
	};

	$(".subcategory").easyAutocomplete(options);

	    $(function(){
	 $('#hero-demo').autoComplete({
	 minChars: 1,
	 source: function(term, suggest){
	 term = term.toLowerCase();
	 var choices = ['ActionScript', 'AppleScript', 'Asp', 'Assembly', 'BASIC', 'Batch', 'C', 'C++', 'CSS', 'Clojure', 'COBOL', 'ColdFusion', 'Erlang', 'Fortran', 'Groovy', 'Haskell', 'HTML', 'Java', 'JavaScript', 'Lisp', 'Perl', 'PHP', 'PowerShell', 'Python', 'Ruby', 'Scala', 'Scheme', 'SQL', 'TeX', 'XML'];
	 var suggestions = [];
	 for (i=0;i<choices.length;i++)
	 if (~choices[i].toLowerCase().indexOf(term)) suggestions.push(choices[i]);
	 suggest(suggestions);
	 }
	 })});*/

});

function fetchBrandListVendorBrand () {
	var subcatName = $(".subcategory").val();
	$(".subcatId").val(subcatMapping[subcatName]);
	var subcatId = subcatMapping[subcatName];
	var brandJson = {} ;

	$.ajax({
		type : "POST",
		dataType : 'json',
		async : false,
		url : 'vendorBrandSubcat.action?action=ListBrand&subcategory=' + subcatId ,
		success : function(data) {

			if (data != -1) {
				brandJson.data = data;
				//console.log (jsonObj) ;
			} else {
				alert("Internal Server Error");
			}
		}
	});
	var brandList = [] ;
	for ( i in brandJson.data) {
		var key = Object.getOwnPropertyNames(brandJson.data[i]);
		brandList.push(String(key));
		brandMapping[key] = brandJson.data[i][key];
	} 
	
	
	$( "#brandIdVBS" ).autocomplete({
        source: brandList
     });
	
	fetchExistingRuleVendorBrandSubcat();
	
 }

function fetchBrandListVendorBrandDelete () {
	var subcatName = $(".subcategory").val();
	$(".subcatId").val(subcatMapping[subcatName]);
	var subcatId = subcatMapping[subcatName];
	var brandJson = {} ;

	$.ajax({
		type : "POST",
		dataType : 'json',
		async : false,
		url : 'vendorBrandSubcat.action?action=ListBrand&subcategory=' + subcatId ,
		success : function(data) {

			if (data != -1) {
				brandJson.data = data;
				//console.log (jsonObj) ;
			} else {
				alert("Internal Server Error");
			}
		}
	});
	var brandList = [] ;
	for ( i in brandJson.data) {
		var key = Object.getOwnPropertyNames(brandJson.data[i]);
		brandList.push(String(key));
		brandMapping[key] = brandJson.data[i][key];
	}
	
	
	$( "#brandIdVBS" ).autocomplete({
        source: brandList
     });
	

 }

/*$( ".subcat" ).change(function() {
	  alert( "Handler for .change() called." );
	});*/

function changeSubcategory() {
	var subcatName = $(".subcategoryList").val();
	$(".subcatId").val(subcatMapping[subcatName]);
	alert(subcatName);
} 

function fetchSellerList() {
	console.log (brandMapping);
	var sellerList = {};
	var subcatName = $(".subcategory").val();
	var brandName = $("#brandIdVBS").val();
	$(".subcatId").val(subcatMapping[subcatName]);
	var subcatId = subcatMapping[subcatName];
	var brandId = brandMapping[brandName];
	console.log (brandId + " " + brandName) ;
	$(".brandId").val(brandId);
	$.ajax({
		type : "POST",
		dataType : 'json',
		async : false,
		url : 'vendorBrandSubcat.action?action=ListSellers&subcategory=' + subcatId+'&brand='+brandId ,
		success : function(data) {

			if (data != -1) {
				sellerList = data;
				//console.log (jsonObj) ;
			} else {
				alert("Internal Server Error");
			}
		}
	});
	$("#SellerLeftList option").remove();
	for (i in sellerList) {
		var key = Object.getOwnPropertyNames(sellerList[i]);
		$("#SellerLeftList").append(new Option(key,sellerList[i][key] ));
	}
	
	fetchExistingRuleVendorBrandSubcat();
}

function move (direction , all , type) {
	if (direction) {
		if (all) {
			$("#SellerLeftList option").prop('selected',true);
		}
		$("#SellerLeftList :selected").each(function()
				{	
			$("#SellerRightList").append ($(this)) ;
				});
	}
	else {
		if (all) {
			$("#SellerRightList option").prop('selected',true);
		}
		$("#SellerRightList :selected").each(function()
				{	
			$("#SellerLeftList").append ($(this)) ;
				});
	}

}