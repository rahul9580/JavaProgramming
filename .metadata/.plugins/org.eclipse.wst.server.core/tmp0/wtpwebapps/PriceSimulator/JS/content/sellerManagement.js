function searchList() {
	showloader("div.action > div.report1 > div.bar");
	$("#editbrandBtn1").attr('disabled', true);
	var spChangeFrom;
	var spChangeTo;
	var startTime;
	var endTime;
	spChangeFrom = parseInt($(" td.spChangeFrom input").val());

	spChangeTo = parseInt($(" td.spChangeTo input").val());

	startTime = $("td.startTime input").val();
	endTime = $("td.endTime input").val();
	if ((startTime == null || startTime == "")
			&& (endTime == null || endTime == "")) {
		alert("Please Enter Start-Date / End-Date");
		hideloader("div.action > div.report1 > div.bar");
	} else if (spChangeFrom > spChangeTo) {
		alert("Please Provide correct SP range");
		hideloader("div.action > div.report1 > div.bar");
	} else {
		document.forms["filterDetails"].submit();
	}
}
function validate(evt) {
	var theEvent = evt || window.event;
	var key = theEvent.keyCode || theEvent.which;
	key = String.fromCharCode(key);
	var regex = /[0-9-]|\./;
	if (!regex.test(key)) {
		theEvent.returnValue = false;
		if (theEvent.preventDefault)
			theEvent.preventDefault();
	}
}

$(document).ready(function() {
	$('#bootstrap-table').bdt();
	document.getElementById("table-footer").style.display = "none";
	$('#pageNo').val(1);
});

function toggle(source) {
	checkboxes = document.getElementsByName("listForPenalty");
	for (var i = 0, n = checkboxes.length; i < n; i++) {
		checkboxes[i].checked = source.checked;
	}
}
function rfsMoveList() {
	showloader("div.action > div.report11 > div.bar");
	// var checkboxes = $('.listForPenalty:checkbox:checked').length;
	var checkboxes = 0;
	inputElements = $("[name=listForPenalty]");
	var keys = {};
	var removeKeys = [];
	for (var i = 0; n = inputElements.length, i < n; i++) {
		if (inputElements[i].checked) {
			checkboxes = 1;
			var supc = inputElements[i].value.split("##")[0];
			var seller = inputElements[i].value.split("##")[1];
			if(keys[supc] == null)
			{
				keys[supc] = [seller];
			}	
			else if(keys[supc].indexOf(seller)==-1)
			{
				keys[supc].push(seller);
			}
			else
			{
				removeKeys.push(i);
			}
		}
	}
	for(var i = removeKeys.length-1;i>=0;i--)
		inputElements[removeKeys[i]].remove();
	if (checkboxes > 0) {
		document.getElementById("actionType").value = "penalty";
		alert("Request accepted. Moving List of Vendor/SUPC seleted to RFS ");
		document.forms["sellerManagementForm"].submit();
		hideloader("div.action > div.report11 > div.bar");
	} else {
		hideloader("div.action > div.report11 > div.bar");
		alert("No Vendor SUPC selected for Penalty");
	}
}

function movePage(value, currentPageNo) {

	var temp = currentPageNo;
	if (value == "previous" && currentPageNo != 1)
		temp = temp - 1;
	if (value == "next")
		temp = temp + 1;

	var tempString = "changeCurrentPage";
	spChangeFrom = parseInt($(" td.spChangeFrom input").val());
	spChangeTo = parseInt($(" td.spChangeTo input").val())
	startTime = $(" td.startTime input").val();
	startTime = startTime.replace(" ", "_");
	endTime = $(" td.endTime input").val();
	endTime = endTime.replace(" ", "_");
	supcToBeSearched = $ ("td.supcToBeSearched input").val();
	vendorCodeToBeSearched = $("td.vendorCodeToBeSearched input").val();
	
	window.location
			.replace("/PriceSimulator/exceptions/sellerManagement.action?newPageNo="
					+ temp
					+ "&spChangeFrom="
					+ spChangeFrom
					+ "&spChangeTo="
					+ spChangeTo
					+ "&startTime="
					+ startTime
					+ "&endTime="
					+ endTime
					+ "&supcToBeSearched="
					+ supcToBeSearched
					+ "&vendorCodeToBeSearched="
					+ vendorCodeToBeSearched);
}

function downloadSheet() {
	alert("download");
	window.location
			.replace("/PriceSimulator/exceptions/sellerManagement.action?actionType=download");
}
