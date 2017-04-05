<script src="/PriceSimulator/JS/jquery-ui.js" type="text/javascript"
	charset="utf-8"></script>
<link href="/PriceSimulator/CSS/jquery.tagit.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" type="text/css"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/flick/jquery-ui.css">
<script src="/PriceSimulator/JS/tag-it.js" type="text/javascript"></script>
<script>
	$(function() {
		var str = document.getElementById("txtSubcatName").value;
		var str = str.split(",");
		var allSelected = false;
		var s1 = [ str ];
		var eventTags = $('#singleFieldTags2');

		eventTags.tagit({

			placeholderText : "ENTER SUBCATEGORY",
			availableTags : str,
			beforeTagAdded : function(evt, ui) {
				if (!(eventTags.tagit('tagLabel', ui.tag)).includes("#")) {
					return false;
				}
			},

		});
	});
</script>