/*$(document).ready(function()
{
	$(".tab_content").hide();
	$(".tab_content:first").show(); 
	$("ul.leveltabs li").click(function()
	{
		$("ul.leveltabs li").removeClass("active");
		$(this).addClass("active");
		$(".tab_content").hide();
		var activeTab = $(this).attr("rel"); 
		$("#"+activeTab).fadeIn(); 
	});
});*/

function change() {

	var optionIndex = document.getElementById("options").value;
	$(".heading").hide();
	if (optionIndex == "cluster") {
		document.getElementById('cluster').style.display = "block";
		document.getElementById('Subcat').style.display = "none";
		document.getElementById('Brand').style.display = "none";
		document.getElementById('Exception').style.display = "none";
		//document.getElementById('Scheduled CB').style.display = "none";
		$(".heading").hide()
	} else if (optionIndex == "Subcat") {
		document.getElementById('cluster').style.display = "none";
		document.getElementById('Subcat').style.display = "block";
		document.getElementById('Brand').style.display = "none";
		document.getElementById('Exception').style.display = "none";
		//document.getElementById('Scheduled CB').style.display = "none";
	} else if (optionIndex == "Brand") {
		document.getElementById('cluster').style.display = "none";
		document.getElementById('Subcat').style.display = "none";
		document.getElementById('Brand').style.display = "block";
		document.getElementById('Exception').style.display = "none";
		//document.getElementById('Scheduled CB').style.display = "none";
	} else if (optionIndex == "Exception") {
		document.getElementById('cluster').style.display = "none";
		document.getElementById('Subcat').style.display = "none";
		document.getElementById('Brand').style.display = "none";
		document.getElementById('Exception').style.display = "block";
		//document.getElementById('Scheduled CB').style.display = "none";
	}
}