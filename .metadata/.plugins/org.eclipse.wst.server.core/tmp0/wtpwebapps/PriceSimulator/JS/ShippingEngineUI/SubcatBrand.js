function deleteRowSubcatBrand(row)
{	
	document.getElementById("rangeTable").deleteRow(row);
	orderSubcatBrandRows() ;
}


function orderSubcatBrandRows() {
	var row = 0 ;
	var isHead = 0 ;
	$('#rangeTable > tbody  > tr').each(function() {
		if (isHead === 0) {
			isHead = 1 ;
		}else {
		//$(this).attr("id","price[" + row.toString() +"].shipping_chargeSR") ;
		$(this).children().first().find("input").attr ("id","price[" + row.toString() +"].lowerLimitSBR") ;
		$(this).children().first().next().find("input").attr ("id","price[" + row.toString() +"].higherLimitSBR");
		$(this).children().first().next().next().find("input").attr ("id","price[" + row.toString() +"].shipping_chargeSBR");
		
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
		}
	});
}


function addRow1(tableID) 
        {
                var table = document.getElementById(tableID);

                var rowCount = table.rows.length;
                var row = table.insertRow(rowCount);
                var counts = rowCount - 1;

                var cell1 = row.insertCell(0);
                var houseNo = document.createElement("input");
                houseNo.type = "number";
                houseNo.id= "price[" + counts + "].lowerLimitSBR";
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
                	
                };
                cell1.appendChild(houseNo);

                var cell2 = row.insertCell(1);
                var street = document.createElement("input");
                street.type = "number";
                street.name = "price[" + counts + "].higherLimit";
                street.id = "price[" + counts + "].higherLimitSBR";
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
                	
                };
                cell2.appendChild(street);

                var cell3 = row.insertCell(2);
                var city = document.createElement("input");
                city.type = "number";
                city.name = "price[" + counts + "].shipping_charge";
                city.id = "price[" + counts + "].shipping_chargeSBR";
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
               $("#rangeTable tr:last").append('<td><button type="button" style="width:50px;" onclick="deleteRowSubcatBrand (' + counts + ')" class="btn btn-sm btn-danger">X</button> </td>');
            //   console.log($(".table").children());
               // $("#price[" + counts + "].shipping_chargeSBR").parent().parent().append('<td><button type="button" style="width:50px;" class="btn btn-sm btn-danger">X</button> </td>');;
                //parent.append('<td><button type="button" style="width:50px;" class="btn btn-sm btn-danger">X</button> </td>');

                 
        }

/*function validate11(evt)
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
	
}
*/
