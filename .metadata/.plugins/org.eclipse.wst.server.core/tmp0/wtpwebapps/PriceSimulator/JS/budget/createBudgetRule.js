function showSupcBlock() {
	document.getElementById('sv').style.display = "block";
	document.getElementById('vb').style.display = "none";
	$(".ruleType").val("SV");
}

function showBrandBlock() {
	document.getElementById('sv').style.display = "none";
	document.getElementById('vb').style.display = "block";
	$(".ruleType").val("VB");
}

function validateString(evt) {
	var theEvent = evt || window.event;
	var key = theEvent.keyCode || theEvent.which;
	key = String.fromCharCode(key);
	var regex = /"|\'/;
	if (regex.test(key)) {
		theEvent.returnValue = false;
		if (theEvent.preventDefault)
			theEvent.preventDefault();
	}
}

function validateInt(evt) {
	var theEvent = evt || window.event;
	var key = theEvent.keyCode || theEvent.which;
	key = String.fromCharCode(key);
	var regex = /[0-9\b]/;
	if (!regex.test(key)) {
		theEvent.returnValue = false;
		if (theEvent.preventDefault)
			theEvent.preventDefault();
	}
}

function validateNoSpecialCharacter(evt) {
	var theEvent = evt || window.event;
	var key = theEvent.keyCode || theEvent.which;
	key = String.fromCharCode(key);
	var regex = /[0-9a-zA-Z\b]/;
	if (!regex.test(key)) {
		theEvent.returnValue = false;
		if (theEvent.preventDefault)
			theEvent.preventDefault();
	}
}

function validateNoSpecialCharacterButComma(evt) {
	var theEvent = evt || window.event;
	var key = theEvent.keyCode || theEvent.which;
	key = String.fromCharCode(key);
	var regex = /[0-9a-zA-Z\b]|\,/;
	if (!regex.test(key)) {
		theEvent.returnValue = false;
		if (theEvent.preventDefault)
			theEvent.preventDefault();
	}
}

function validateTotal(data) {
	var name = $(" td.name input").val();
	var pro = $(" td.pro input").val();
	var ruleType = $(".ruleType").val();
	var supc = $(" td.supc input").val();
	var brand = $("td.brand input").val();
	var vendor = $("td.vendor input").val();
	var budget = $("td.budget input").val();
	var saleTarget= $("td.saleTarget input").val();
	var gsvTarget = $("td.gsvTarget input").val();
	var startTime =$("td.startTime input").val();
	var endTime=$("td.endTime input").val();
	var sv = "SV";
	var comma = ",";
	
	if (budget <= 0) {
		alert('Budget should be greater than zoro.');
		return false;
	}

	if (name.length === 0) {
		alert('Please enter a name for monetization.');
		return false;
	}
	if (pro.length === 0) {
		alert('Please enter PRO/RO for monetization.');
		return false;
	}
	if (ruleType == sv) {
		if (supc.length === 0) {
			alert('Please enter the supc for monetization.');
			return false;
		}
	} else {
		if (brand.length === 0) {
			alert('Please enter the brand id for monetization.');
			return false;
		}
	}
	if (vendor.length === 0) {
		alert('Please enter vendor list for monetization.');
		return false;
	} else {
		if (comma == vendor.charAt(vendor.length-1)) {
			alert('Vendor list must not end with ","');
			return false;
		}
	}
	if (budget.length === 0) {
		alert('Please enter budget for monetization.');
		return false;
	}
	if (saleTarget.length === 0) {
		alert('Please enter budget for monetization.');
		return false;
	}
	if (gsvTarget.length === 0) {
		alert('Please enter budget for monetization.');
		return false;
	}
	if (startTime.length === 0) {
		alert('Please enter start time for monetization.');
		return false;
	}
	if (endTime.length === 0) {
		alert('Please enter budget for monetization.');
		return false;
	}
	var start = new Date(startTime);
	var end = new Date(endTime);
	if (end <= start) {
		alert('End date can not be less than start date.');
		return false;
	}
	if (end.getMonth() > start.getMonth()) {
		alert('End date must expire in same month.');
		return false;
	}
	
	var d = new Date();
	if(end < d) {
		alert('End time must be greater than current time');
		return false;
	}
	return true;
}

function createBudgetRule(data) {
	if(validateTotal(data)) {
		showloader(document.getElementById('status'));
		var ruleId = $(" td.ruleId input").val();
		var name = $(" td.name input").val();
		var pro = $(" td.pro input").val();
		var ruleType = $(".ruleType").val();
		var supc = $(" td.supc input").val();
		var brand = $("td.brand input").val();
		var vendor = $("td.vendor input").val();
		var budget = $("td.budget input").val();
		var saleTarget= $("td.saleTarget input").val();
		var gsvTarget = $("td.gsvTarget input").val();
		var startTime =$("td.startTime input").val();
		var endTime=$("td.endTime input").val();
		var fileName=$("td.fileName input").val();
		//var file = document.getElementById('file').files[0];
		
		$.ajax({
				type : "POST",
				dataType : 'html',
				url : '/PriceSimulator/budgetRule/createBudgetRule.action?userAction=submit',
				enctype : "multipart/form-data",

				data : {
					ruleId : ruleId,
					name : name,
					pro : pro,
					ruleType : ruleType,
					supc : supc,
					brand : brand,
					vendor : vendor,
					budget : budget,
					saleTarget : saleTarget,
					gsvTarget : gsvTarget,
					startTime : startTime,
					endTime : endTime,
					fileName : fileName,
				},
				
				success : function(data)
				{
					hideloader(document.getElementById('status'));
					alert(data);
					
					$.ajax({
						type : "POST",
						dataType : 'html',
						url : '/PriceSimulator/budgetRule/budgetRuleSummary.action',						
						data : {
						},
						success : function(data)
						{
							window.location.href='PriceSimulator/budgetRule/budgetRuleSummary.action';
						},
						
						error: function(data){
							hideloader(document.getElementById('status'));
							alert("Failed to load summary !");
						}
					});
					
				},
				
				error: function(data){
					hideloader(document.getElementById('status'));
					alert("Failed !");
				}
			});
	}
}