function uploadSheet()
{

	var data = new FormData();
	jQuery.each(jQuery('#file')[0].files, function(i, file) {
	    data.append('file', file);
	});
	

	$.ajax({
	    url: '/PriceSimulator/ajax/savebulkuploadproducttemp.action?downloadFileType=none',
	    data: data,
	    cache: false,
	    contentType: false,
	    processData: false,
	    type: 'POST',
	    success: function(data){
	    	
	    	if(data=='1')
	    		$("div.bulkupload > div.report > div.bar").html("<span>Uploaded Successfully</span>");
	    	else
	    		$("div.bulkupload > div.report > div.bar").html("<span>"+data+"</span>");
	    }
	});

}

/*function testMethod(){
	
	var data = new FormData();
	jQuery.each(jQuery('#file')[0].files, function(i, file) {
		    data.append('file', file);
	});
	
	$.ajax({
	    url: '/PriceSimulator/ajax/savebulkuploadproducttemp.action?downloadFileType=none',
	    data: data,
	    cache: false,
	    contentType: false,
	    processData: false,
	    type: 'POST',
	    success: function(data){
	        alert(data);
	    }
	});
	
}*/

function downloadSheet(actionType)
{
	
	
	
	$.ajax(
			{
				type : "POST",
				dataType: 'html',
				url : '/PriceSimulator/ajax/savebulkuploadproducttemp.action?downloadFileType='+actionType,
				success : function(data)
				{
					alert("data");
				}
			});



}



