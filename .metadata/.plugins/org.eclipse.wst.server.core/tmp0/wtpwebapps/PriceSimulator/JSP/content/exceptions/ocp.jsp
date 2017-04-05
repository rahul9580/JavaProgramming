<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/bootstrap.min.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/content/rules/brandtab.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/buttons.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/loader.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/content/exceptions/mop.css" media="screen" />
<script type="text/javascript" src="/PriceSimulator/JS/utility/jquery-1.12.0.min.js"></script>


<script type="text/javascript" src="/PriceSimulator/JS/utility/loader.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/content/rules/product.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/utility/bootstrap.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.5.1/moment.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.4.0/lang/en-gb.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/utility/bootstrap-datetimepicker.min.js"></script>

<title>OCP</title>
</head>
<body>
	<div class="pad_top_50" style="display:inline;">
	<div class="pricing" style="margin-bottom: 0px;">
	<div><br>
		&nbsp;<label style="">
		<h5 style="color: red;">
		<b>Add new SUPC</b></h5><br>
		</label>
	</div>
	<form method="post" action="/PriceSimulator/ajax/addproductOCP.action" enctype="multipart/form-data" class="form-inline">
			&nbsp;<label>SUPC :</label>&nbsp;<input type="text" name="supclist" class="manualinput form-control" class="form-control" required/>
			&nbsp;<input type="submit" class="btn btn-primary addsupc form-control" value="Add" style="margin-left:2%;margin-right:2%"/>
	</div>
	</form>
	</div>

</body>
</html>