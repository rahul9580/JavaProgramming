<html>

<head>

<%@include file="CashBackConfigHeader.jsp"%>
<script src="/PriceSimulator/JS/content/cashbackConfig/awesomplete.js"></script>
<script src="/PriceSimulator/JS/content/cashbackConfig/index.js"></script>
<link type="text/css" rel="stylesheet"
	href="/PriceSimulator/CSS/content/cashbackConfig/prism.css"
	media="screen" />
<link type="text/css" rel="stylesheet"
	href="/PriceSimulator/CSS/content/cashbackConfig/awesomplete.css"
	media="screen" />
</head>
<div class="header"><%@include file="../../content/menubar.jsp"%></div>
<script src="/PriceSimulator/JS/utility/jquery-1.12.0.min.js"></script> 
<div class="filter"><%@include
		file="../../content/categoryfilter.jsp"%></div>
<body>
<script type="text/javascript">

	function fetch(id) {
		CmNc_subcat(id);
		CmNc_cluster(id);
		CmNc_exception(id);
		CmNc_brand(id);
	}
	function CmNc_subcat(id) {
		if (id == "0") {
			document.getElementById("cmSubcat").value = "";
			document.getElementById("ncSubcat").value = "";
			$("#cmpuSubcat").val("");
			$("#ncCmpuSubcat").val("");
			document.getElementById("cmSubcatAA").value = "";
			document.getElementById("ncSubcatAA").value = "";
			document.getElementById("gmSubcatAA").value = "";
			document.getElementById("ngSubcatAA").value = "";
			$("#cmpuSubcatAA").val("");
			$("#ncCmpuSubcatAA").val("");
		}
		else {
			( function($) {
			$
					.ajax({
						type : "GET",
						dataType : 'html',
						async : false,
						url : '/PriceSimulator/ajax/getCmNcAction.action?table=limit_subcategory&subcatId='
								+ id,
						success : function(data) {
							var list = data.split(";");
							document.getElementById("cmSubcat").value = list[0];
							document.getElementById("ncSubcat").value = list[1];
							$("#cmpuSubcat").val(list[2]);
							$("#ncCmpuSubcat").val(list[3]);
							document.getElementById("cmSubcatAA").value = list[4];
							document.getElementById("ncSubcatAA").value = list[5];
							document.getElementById("gmSubcatAA").value = list[6];
							document.getElementById("ngSubcatAA").value = list[7];
							$("#cmpuSubcatAA").val(list[8]);
							$("#ncCmpuSubcatAA").val(list[9]);
						}
					});
			} ) ( jQuery );
		}
	}

	function CmNc_cluster(id) {
		if (id == "0") {
			document.getElementById("cmCluster").value = "";
			document.getElementById("ncCluster").value = "";
			$("#cmpuCluster").val("");
			$("#ncCmpuCluster").val("");
			document.getElementById("cmClusterAA").value = "";
			document.getElementById("ncClusterAA").value = "";
			document.getElementById("gmClusterAA").value = "";
			document.getElementById("ngClusterAA").value = "";
			$("#cmpuClusterAA").val("");
			$("#ncCmpuClusterAA").val("");
		}
		else {
			( function($) {
			$
					.ajax({
						type : "GET",
						dataType : 'html',
						async : false,
						url : '/PriceSimulator/ajax/getCmNcAction.action?table=limit_cluster&subcatId='
								+ id,
						success : function(data) {
							var list = data.split(";");
							document.getElementById("cmCluster").value = list[0];
							document.getElementById("ncCluster").value = list[1];
							$("#cmpuCluster").val(list[2]);
							$("#ncCmpuCluster").val(list[3]);
							document.getElementById("cmClusterAA").value = list[4];
							document.getElementById("ncClusterAA").value = list[5];
							document.getElementById("gmClusterAA").value = list[6];
							document.getElementById("ngClusterAA").value = list[7];
							$("#cmpuClusterAA").val(list[8]);
							$("#ncCmpuClusterAA").val(list[9]);
						}
					});
		} ) ( jQuery );
		}
	}
	function CmNc_exception(id) {
		if (id == "0") {
			$("#cmpuMin").val("");
			$("#cmpuAAMin").val("");
		}
		else {
		
		( function($) {
			$.ajax({
						type : "GET",
						dataType : 'html',
						async : false,
						url : '/PriceSimulator/ajax/getCmNcAction.action?table=limit_exception&subcatId='
								+ id,
						success : function(data) {
							var list = data.split(";");
							$("#cmpuMin").val(list[0]);
							$("#cmpuAAMin").val(list[1]);
						}
					});
		} ) ( jQuery );
		}
	}
	function CmNc_brand(id) {
		if (id == "0") {
			document.getElementById("cmBrand").value = "";
			document.getElementById("ncBrand").value = "";
			$("#cmpuCluster").val("");
			$("#ncCmpuCluster").val("");
			document.getElementById("cmBrandAA").value = "";
			document.getElementById("ncBrandAA").value = "";
			document.getElementById("gmBrandAA").value = "";
			document.getElementById("ngBrandAA").value = "";
			$("#cmpuBrandAA").val("");
			$("#ncCmpuBrandAA").val("");
		}
		else {
			( function($) {

			$.ajax({
						type : "GET",
						dataType : 'html',
						async : false,
						url : '/PriceSimulator/ajax/getCmNcAction.action?table=limit_brand&subcatId='
								+ id,
						success : function(data) {
							var list = data.split(";");
							document.getElementById("cmBrand").value = list[0];
							document.getElementById("ncBrand").value = list[1];
							$("#cmpuBrand").val(list[2]);
							$("#ncCmpuBrand").val(list[3]);
							document.getElementById("cmBrandAA").value = list[4];
							document.getElementById("ncBrandAA").value = list[5];
							document.getElementById("gmBrandAA").value = list[6];
							document.getElementById("ngBrandAA").value = list[7];
							$("#cmpuBrandAA").val(list[8]);
							$("#ncCmpuBrandAA").val(list[9]);
						}
					});
			} ) ( jQuery );
		}
			
	}
</script>

<script type="text/javascript">

( function($) {
		$(document).ready(function() {
			$(".awesomplete").on("awesomplete-selectcomplete", function(e) {
				var temp = this.value;
				var hashSymbol = "#";
				if (temp.indexOf(hashSymbol) > -1) {
					var subcatId = temp.split("#")[1];
					$('#subcatName').val(temp);
					fetch(subcatId);
				}
			});
		});
} ) ( jQuery );
	</script>
	<input type="hidden" id="subcatName">
	<div style="margin-top: 2%; margin-left: 18%;">
		<input placeholder="Select Subcategory"
			class="awesomplete form-control" data-list="#mylist"
			onchange="fetch(document.getElementById('subcatName').value);" />
		<datalist id="mylist">
		<option>Select Subcategory</option>
		<s:iterator value="%{#session.subcatName}" var="xyz" status="itStatus">
			<option value="<s:property value="ID" />">
				<s:property value="name" />#<s:property value="ID" /></option>
		</s:iterator> </datalist>
	</div>
	
	<div class="content">
<%@include file="CashBackConfig.jsp"%>
</div>
</body>
</html>

