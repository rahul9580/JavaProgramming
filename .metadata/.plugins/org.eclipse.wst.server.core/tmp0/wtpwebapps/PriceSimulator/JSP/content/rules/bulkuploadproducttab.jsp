<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet"
	href="/PriceSimulator/CSS/content/rules/producttab.css" media="screen" />
<link type="text/css" rel="stylesheet"
	href="/PriceSimulator/CSS/utility/buttons.css" media="screen" />
<link type="text/css" rel="stylesheet"
	href="/PriceSimulator/CSS/utility/loader.css" media="screen" />
<script type="text/javascript"
	src="/PriceSimulator/JS/content/rules/product.js"></script>
<script type="text/javascript"
	src="/PriceSimulator/JS/utility/loader.js"></script>
<%-- <script type="text/javascript"
  src="/PriceSimulator/JS/content/rules/bulkuploadproduct.js"></script>	 --%>

</head>
<body>
	<div class="bulkupload">
		<form  enctype="multipart/form-data" method="post" action="/PriceSimulator/ajax/savebulkuploadproducttemp.action?downloadFileType=none">
			<input type="file" id="file" name="file" class="button button_red browse" />
			<input type="submit" class="btn btn-primary savetemp"   />
		</form>
		<div class="report"><div class="bar"></div></div>
	</div>

	<a
		href="/PriceSimulator/ajax/savebulkuploadproducttemp.action?downloadFileType=accepted">
		<input type="button" class="btn btn-primary" name="Download Accepted List" value="Download Accepted List" onclick="downloadSheet('accepted')">
	</a>

	<a
		href="/PriceSimulator/ajax/savebulkuploadproducttemp.action?downloadFileType=rejected">
		<input type="button" class="btn btn-primary" name="Download Rejected List" value="Download Rejected List" onclick="downloadSheet('rejected')">
	</a>
</body>
</html>