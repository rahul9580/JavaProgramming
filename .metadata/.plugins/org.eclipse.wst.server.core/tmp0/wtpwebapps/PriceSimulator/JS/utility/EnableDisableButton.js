
function enableDisableButton(access,privlage)
{
	if(access=='' || access==null)
	{
		var inputs = document.getElementsByTagName("INPUT");
		for (var i = 0; i < inputs.length; i++) {
			if (inputs[i].type === 'checkbox') {
				inputs[i].disabled = true;
	    	}	
		}
	}
	if(privlage.toLowerCase()!='admin' || privlage.toLowerCase()=="" || privlage ==null)
	{
		
		if((access.toLowerCase()=='read'))
		{
			$("span").css("pointer-events", "none");
			$("span.name").css("pointer-events", "auto");
			var inputs = document.getElementsByTagName("INPUT");
			for (var i = 0; i < inputs.length; i++) {
			        inputs[i].disabled = true;
			}
			var input = document.getElementsByTagName("button");
			for (var i = 0; i < input.length; i++) {
			        input[i].disabled =true;
			}
			//document.getElementById("previousPage").disabled = false;
			var pagerButton = document.getElementsByName("Page");
			for (var i = 0; i < pagerButton.length; i++) {
				pagerButton[i].disabled =false;
		}
		}
		else if((access.toLowerCase()=='write')||(access.toLowerCase()=='approve'))
		{
			$("span").css("pointer-events", "auto");
			var inputs = document.getElementsByTagName("INPUT");
			for (var i = 0; i < inputs.length; i++) {
			        inputs[i].disabled = false;
			}
			var input = document.getElementsByTagName("button");
			for (var i = 0; i < input.length; i++) {
			        input[i].disabled =false;
			}
		}
		
		
		else{
			var inputs = document.getElementsByTagName("INPUT");
			for (var i = 0; i < inputs.length; i++) {
			    if (inputs[i].type === 'checkbox') {
			        inputs[i].disabled = true;
			    }
			}
			
		}
		
		//revoking buttons
		//
	}
	
	else
	{
		$("span").css("pointer-events", "auto");
		var inputs = document.getElementsByTagName("INPUT");
		for (var i = 0; i < inputs.length; i++) {
		    //if ((inputs[i].type === 'submit')||(inputs[i].type==='number')||(inputs[i].type==='checkbox')||(inputs[i].type==='text')) {
		        inputs[i].disabled = false;
		    //}
		}
		var input = document.getElementsByTagName("button");
		for (var i = 0; i < input.length; i++) {
		    //if ((inputs[i].type === 'submit')||(inputs[i].type==='number')||(inputs[i].type==='checkbox')||(inputs[i].type==='text')) {
		        input[i].disabled =false;
		    //}
		}
	}
}