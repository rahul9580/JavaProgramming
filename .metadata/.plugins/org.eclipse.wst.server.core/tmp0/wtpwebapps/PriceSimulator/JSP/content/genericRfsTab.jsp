<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/bootstrap.min.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/content/rules/homepage.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/buttons.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/loader.css" media="screen" />
<!-- MetisMenu CSS -->
<link href="/PriceSimulator/CSS/content/summary/metisMenu.min.css" rel="stylesheet" />
<!-- DataTables CSS -->
<!-- <link
	href="/PriceSimulator/CSS/content/summary/dataTables.bootstrap.css"
	rel="stylesheet"> -->
<!-- DataTables Responsive CSS -->
<link href="/PriceSimulator/CSS/content/summary/dataTables.responsive.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="/PriceSimulator/CSS/content/summary/sb-admin-2.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="/PriceSimulator/CSS/content/summary/font-awesome.min.css" rel="stylesheet" type="text/css">

<script src="/PriceSimulator/JS/utility/jquery-1.12.0.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/PriceSimulator/JS/utility/bootstrap.min.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/utility/loader.js"></script>
<script src="/PriceSimulator/JS/content/summary/metisMenu.min.js"></script>
<script src="/PriceSimulator/JS/content/summary/sb-admin-2.js"></script>
</head>
<body>
<body>
<script type="text/javascript">
		var obj="<%= session.getAttribute("report")%>";
		
		if(obj=="" || obj==null || obj=="null"|| obj=="NULL" || obj==0 || obj=="0"|| obj==1 || obj=="1"){
			
		}else if(obj.indexOf("receive")>=0 || obj.indexOf("Error")>=0) {
			var obj1=obj.replace(/#/g, '\n');
			alert(obj1);
		}
		<%session.setAttribute("report", "");%>
		</script>
	<br>
	<br>
	<br>
	<br>
	
	
	
	<br>
	<div class="content">
		<form method="post" action="/PriceSimulator/ajax/GenericRfs.action" enctype="multipart/form-data">
			<input type="file" name="file" class="btn btn-primary browse" style="display: inline; width: 250px" accept=".csv" /> <input type="submit"
				style="display: inline" class="savetemp btn btn-primary " value="Upload" /> &nbsp;&nbsp; <a href="/PriceSimulator/Temp/rfsTmpl.csv">
				<br> <br> <span class="btn btn-primary downtemp">Download <span>Template</span>
			</a>&nbsp;&nbsp; <a onclick="this.href='/PriceSimulator/exceptions/removeproduct.action?type=download&source=generic';" href=""> <span class="btn btn-primary downtemp">Download <span>
						RFS list</span></a>
			<br><br>
			<label><s:property value="getUploadStatus()" /></label>			
		</form>
	</div>
	<div style="position: absolute; left:360px; top:470px;">
	<span class="message" style="color:red; font-size:14px">*Note: Keep this page open/active to receive upload progress report.</span>
	</div>
</body>
</body>
</html>

