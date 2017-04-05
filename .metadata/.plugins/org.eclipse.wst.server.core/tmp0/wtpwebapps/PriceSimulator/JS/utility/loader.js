function showloader(divname)
{
	$(divname).html("" +
			"<div class=\"rectangle\">" +
				"<div class=\"rect1\"></div>" +
				"<div class=\"rect2\"></div>" +
				"<div class=\"rect3\"></div>" +
				"<div class=\"rect4\"></div>" +
				"<div class=\"rect5\"></div>" +
			"</div>");
}

function hideloader(divname)
{
	$(divname).html("");
}