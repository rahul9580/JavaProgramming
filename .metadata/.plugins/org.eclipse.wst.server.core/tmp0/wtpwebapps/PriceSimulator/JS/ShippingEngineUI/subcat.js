/*var subcatMapping = {};
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
           $( "#subcategorySR" ).autocomplete({
              source: subcatList
           });
});*/

function fetchBrandList () {
	var subcatName = $(".subcategorySR").val();
	$(".subcatSR").val(subcatMapping[subcatName]);
	
 }

/*$( ".subcat" ).change(function() {
	  alert( "Handler for .change() called." );
	});*/

function changeSubcategory() {
	var subcatName = $(".subcat").val();
	$(".subcatId").val(subcatMapping[subcatName]);
	//alert(subcatName);
} 

function deleteRow(row)
{
	document.getElementById("rangeTable1").deleteRow(row);
	orderSubcatRows() ;
}



function addRow(tableID) 
        {
                var table = document.getElementById(tableID);

                var rowCount = table.rows.length;
                var row = table.insertRow(rowCount);
                var counts = rowCount - 1;

                var cell1 = row.insertCell(0);
                var houseNo = document.createElement("input");
                houseNo.type = "number";
                houseNo.id= "price[" + counts + "].lowerLimitSR";
                houseNo.name = "price[" + counts + "].lowerLimit";
                houseNo.style.width = "100px";
                houseNo.onkeypress = function(evt)
                {
                	var theEvent = evt || window.event;
                	var key = theEvent.keyCode || theEvent.which;
                	if (key == 8 ) {
                		theEvent.returnValue = true ;
                		return;
                	}
                	key = String.fromCharCode( key );
                	 var regex = /[0-9]/;
                	if(!regex.test(key))
                	{
                		theEvent.returnValue = false;
                		if(theEvent.preventDefault) theEvent.preventDefault();
                	}   
                	
                };;
                cell1.appendChild(houseNo);

                var cell2 = row.insertCell(1);
                var street = document.createElement("input");
                street.type = "number";
                street.name = "price[" + counts + "].higherLimit";
                street.id = "price[" + counts + "].higherLimitSR";
                street.style.width = "100px";
                street.onkeypress = function(evt)
                {
                	var theEvent = evt || window.event;
                	var key = theEvent.keyCode || theEvent.which;
                	if (key == 8 ) {
                		theEvent.returnValue = true ;
                		return;
                	}
                	key = String.fromCharCode( key );
                	 var regex = /[0-9]/;
                	if(!regex.test(key))
                	{
                		theEvent.returnValue = false;
                		if(theEvent.preventDefault) theEvent.preventDefault();
                	}   
                	
                };;
                cell2.appendChild(street);

                var cell3 = row.insertCell(2);
                var city = document.createElement("input");
                city.type = "number";
                city.name = "price[" + counts + "].shipping_charge";
                city.id = "price[" + counts + "].shipping_chargeSR";
                city.style.width = "100px";
                city.onkeypress = function(evt)
                {
                	var theEvent = evt || window.event;
                	var key = theEvent.keyCode || theEvent.which;
                	if (key == 8 ) {
                		theEvent.returnValue = true ;
                		return;
                	}
                	key = String.fromCharCode( key );
                	 var regex = /[0-9]/;
                	if(!regex.test(key))
                	{
                		theEvent.returnValue = false;
                		if(theEvent.preventDefault) theEvent.preventDefault();
                	}   
                	
                };
                cell3.appendChild(city);
                counts += 1 ;
                $("#rangeTable1 tr:last").append('<td><button type="button" style="width:50px;" onclick="deleteRow (' + counts  + ')" class="btn btn-sm btn-danger">X</button> </td>');

        }

function orderSubcatRows() {
	var row = 0 ;
	$('#rangeTable1 > tbody  > tr').each(function() {
		//$(this).attr("id","price[" + row.toString() +"].shipping_chargeSR") ;
		$(this).children().first().find("input").attr ("id","price[" + row.toString() +"].lowerLimitSR") ;
		$(this).children().first().next().find("input").attr ("id","price[" + row.toString() +"].higherLimitSR");
		$(this).children().first().next().next().find("input").attr ("id","price[" + row.toString() +"].shipping_chargeSR");
		
		$(this).children().first().find("input").attr ("name","price[" + row.toString() +"].lowerLimit") ;
		$(this).children().first().next().find("input").attr ("name","price[" + row.toString() +"].higherLimit");
		$(this).children().first().next().next().find("input").attr ("name","price[" + row.toString() +"].shipping_charge");
	/*	$(this).find("td").children()[2].attr ("id","price[" + row.toString() +"].lowerLimitSR") ;
		$(this).find("td").children()[2].attr ("id","price[" + row.toString() +"].higherLimitSR");
		$(this).find("td").children()[2].attr ("id","price[" + row.toString() +"].shipping_chargeSR");
		
		$(this).find("td").children()[3].attr ("id","price[" + row.toString() +"].lowerLimitSR") ;
		$(this).find("td").children()[3].attr ("id","price[" + row.toString() +"].higherLimitSR");
		$(this).find("td").children()[3].attr ("id","price[" + row.toString() +"].shipping_chargeSR");*/
		
/*		$(this).find("td").children()[4].attr ("id","price[" + row.toString() +"].lowerLimitSR") ;
		$(this).find("td").children()[4].attr ("id","price[" + row.toString() +"].higherLimitSR");
		$(this).find("td").children()[4].attr ("id","price[" + row.toString() +"].shipping_chargeSR");*/
		row = row + 1;
	});
}

/*function validate12(evt)
{
	var theEvent = evt || window.event;
	var key = theEvent.keyCode || theEvent.which;
	if (key == 8 ) {
		theEvent.returnValue = true ;
		return;
	}
	key = String.fromCharCode( key );
	 var regex = /[0-9]/;
	if(!regex.test(key))
	{
		theEvent.returnValue = false;
		if(theEvent.preventDefault) theEvent.preventDefault();
	}   
	
}*/