/**
 * 
 */

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
	 	 $( "#subcategoryPreCb" ).autocomplete({
         source: subcatList
      });
           $( "#subcategorySR" ).autocomplete({
              source: subcatList
           });
           
           $( "#subcategorySBR" ).autocomplete({
               source: subcatList
            });
           
});

/*function fetchBrandList () {
	var subcatName = $(".subcat").val();
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
		brandMapping[key] = brandJson.data[i][key]
	}
	
	for (key in brandMapping) {
		$(".brand").append(new Option(key, brandMapping[key]));
	}
	
 }*/

/*$( ".subcat" ).change(function() {
	  alert( "Handler for .change() called." );
	});*/

function changeSubcategory() {
	var subcatName = $(".subcat").val();
	$(".subcatId").val(subcatMapping[subcatName]);
	alert(subcatName);
} 




function change() {
	$(".ruleList").addClass ("hidden") ;
	$(".fileLink").addClass ("hidden") ;
	var optionIndex = document.getElementById("options").value;
	if (optionIndex == "select") {
		document.getElementById('exception').style.display = "none";
		document.getElementById('vendorBrandSubcat').style.display = "none";
		document.getElementById('SubcatBrand').style.display = "none";
		document.getElementById('PreCB').style.display = "none";
		document.getElementById('Subcat').style.display = "none";
	}else if (optionIndex == "exception") {
		document.getElementById('exception').style.display = "block";
		document.getElementById('vendorBrandSubcat').style.display = "none";
		document.getElementById('SubcatBrand').style.display = "none";
		document.getElementById('PreCB').style.display = "none";
		document.getElementById('Subcat').style.display = "none";
		$(".mainHeader").text("Shipping Engine Rules - Seller Supc");
	} else if (optionIndex == "vendorBrandSubcat") {
		document.getElementById('exception').style.display = "none";
		document.getElementById('vendorBrandSubcat').style.display = "block";
		document.getElementById('SubcatBrand').style.display = "none";
		document.getElementById('PreCB').style.display = "none";
		document.getElementById('Subcat').style.display = "none";
		$(".mainHeader").text("Shipping Engine Rules - Vendor Brand Subcat");
	} else if (optionIndex == "SubcatBrand") {
		document.getElementById('exception').style.display = "none";
		document.getElementById('vendorBrandSubcat').style.display = "none";
		document.getElementById('SubcatBrand').style.display = "block";
		document.getElementById('PreCB').style.display = "none";
		document.getElementById('Subcat').style.display = "none";
		$(".mainHeader").text("Shipping Engine Rules - Subcategory Brand Price Point");
	} else if (optionIndex == "PreCB") {
		document.getElementById('exception').style.display = "none";
		document.getElementById('vendorBrandSubcat').style.display = "none";
		document.getElementById('SubcatBrand').style.display = "none";
		document.getElementById('PreCB').style.display = "block";
		document.getElementById('Subcat').style.display = "none";
		$(".mainHeader").text("Shipping Engine Rules - Pre CB Margin");
	}else if (optionIndex == "Subcat") {
		document.getElementById('exception').style.display = "none";
		document.getElementById('vendorBrandSubcat').style.display = "none";
		document.getElementById('SubcatBrand').style.display = "none";
		document.getElementById('PreCB').style.display = "none";
		document.getElementById('Subcat').style.display = "block";
		$(".mainHeader").text("Shipping Engine Rules - Subcategory");
	}
}