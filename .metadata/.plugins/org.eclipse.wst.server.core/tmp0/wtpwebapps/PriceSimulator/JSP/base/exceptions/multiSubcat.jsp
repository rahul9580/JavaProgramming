<html>
<script src="/PriceSimulator/JS/utility/jquery-1.12.0.min.js"></script>
<head>
<%@include file="CashBackConfigHeader.jsp"%>
<%@include file="../../utility/multipleSubcatTags.jsp" %>
</head>
<div class="header"><%@include file="../../content/menubar.jsp"%></div>
<div class="filter"><%@include
		file="../../content/categoryfilter.jsp"%></div>
<body>
<div class ="content">
	<input type="hidden" id="subcatName">

	<input type="hidden" id="txtSubcatName"
		value="<s:property value="%{#session.subcatNameArray}" />" />

	<form>
		<input name="tags" id="singleFieldTags2">
	</form>
	<%@include file="CashBackConfig.jsp"%>
	</div>
</body>
</html>