<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="database.model.BatchCashbackConfigModel"%>
<%@page
	import="org.apache.xmlbeans.impl.xb.xsdschema.ImportDocument.Import"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<!--    <script type="text/javascript" src="/PriceSimulator/JS/utility/jquery-1.12.0.min.js"></script>--> 
<script type="text/javascript">
	function validate(evt) {
		var theEvent = evt || window.event;
		var key = theEvent.keyCode || theEvent.which;
		key = String.fromCharCode(key);
		var regex = /[0-9-.\b]|\.|\-/;
		if (!regex.test(key)) {
			theEvent.returnValue = false;
			if (theEvent.preventDefault)
				theEvent.preventDefault();
		}
	}
	function Update(obj) {
		var buttonValue;
		// var numbers = /^[0-9]+$+./; 
		var subcatName;
		//subcatName = document.getElementById("subcatName").value;
		var eventTags = $('#singleFieldTags2');
		if(eventTags!=null && eventTags.length > 0){
			subcatName = eventTags[0].value;
			//subcatName = subcatName.replaceAll("," , "|") ;
			for (var i = 0 ; i < subcatName.length ; i++) {
				if (subcatName.charAt(i) == ',') {
					subcatName = subcatName.replace("," , "|") ;
				}
			} 
		}else{
			subcatName = document.getElementById("subcatName").value;
		}
		subcatName = encodeURIComponent(subcatName);
		
		if(subcatName == "" && obj != 'configUpdate'){
			alert("No subcat selected");
			return false;
		} 
		var cm_subcat = document.getElementById("cmSubcat").value;
	
	
		var nc_subcat = document.getElementById("ncSubcat").value;
		var cm_brand = document.getElementById("cmBrand").value;
		var nc_brand = document.getElementById("ncBrand").value;
		var cm_cluster = document.getElementById("cmCluster").value;
		var nc_cluster = document.getElementById("ncCluster").value;
		var cm_subcat_AA = document.getElementById("cmSubcatAA").value;
		var nc_subcat_AA = document.getElementById("ncSubcatAA").value;
		var gm_subcat_AA = document.getElementById("gmSubcatAA").value;
		var ng_subcat_AA = document.getElementById("ngSubcatAA").value;
		var cm_brand_AA = document.getElementById("cmBrandAA").value;
		var nc_brand_AA = document.getElementById("ncBrandAA").value;
		var gm_brand_AA = document.getElementById("gmBrandAA").value;
		var ng_brand_AA = document.getElementById("ngBrandAA").value;
		var cm_cluster_AA = document.getElementById("cmClusterAA").value;
		var nc_cluster_AA = document.getElementById("ncClusterAA").value;
		var gm_cluster_AA = document.getElementById("gmClusterAA").value;
		var ng_cluster_AA = document.getElementById("ngClusterAA").value;
		var cmpuSubcat ;
		var ncCmpuSubcat ;
		var cmpuBrand ;
		var ncCmpuBrand ;
		var cmpuCluster ;
		var ncCmpuCluster;
		var cmpuMin ;
		var cmpuSubcat_AA ;
		var ncCmpuSubcat_AA ;
		var cmpuBrand_AA ;
		var ncCmpuBrand_AA ;
		var cmpuCluster_AA ;
		var ncCmpuCluster_AA ;
		var cmpuMin_AA ;
	
		( function($) {
		 cmpuSubcat = $("#cmpuSubcat").val();
		 ncCmpuSubcat = $("#ncCmpuSubcat").val();
		 cmpuBrand = $("#cmpuBrand").val();
		 ncCmpuBrand = $("#ncCmpuBrand").val();
		 cmpuCluster = $("#cmpuCluster").val();
		 ncCmpuCluster = $("#ncCmpuCluster").val();
		 cmpuMin = $("#cmpuMin").val();
		 cmpuSubcat_AA = $("#cmpuSubcatAA").val();
		 ncCmpuSubcat_AA = $("#ncCmpuSubcatAA").val();
		 cmpuBrand_AA = $("#cmpuBrandAA").val();
		 ncCmpuBrand_AA = $("#ncCmpuBrandAA").val();
		 cmpuCluster_AA = $("#cmpuClusterAA").val();
		 ncCmpuCluster_AA = $("#ncCmpuClusterAA").val();
		 cmpuMin_AA = $("#cmpuAAMin").val();
	} ) ( jQuery );
		var batchConfigTableArr = [];
		var table = document.getElementById('batchConfigTable');
		var input = table.getElementsByTagName('input');
		for (var z = 0; z < input.length; z++) {
			if (input[z].type == "text") {

				batchConfigTableArr.push(input[z].value);
				if (obj == 'configUpdate') {
					if (input[z].value == "") {
						alert("Fields can't be empty:");
						return false;
					}
				}
			}
		}

		if (obj == 'configUpdate') {
			buttonValue = "configUpdate";
		}

		else if (obj == 'subcatUpdate') {
			buttonValue = "subcatUpdate";
			if (cm_subcat == "" || nc_subcat == "" || cmpuSubcat == ""
					|| ncCmpuSubcat == "") {
				alert("Fields should be filled with numeric value only:");
				return false;
			}

		}

		else if (obj == 'brandUpdate') {
			buttonValue = "brandUpdate";
			if (cm_brand == "" || nc_brand == "" || cmpuBrand == ""
					|| ncCmpuBrand == "") {
				alert("Fields should be filled with numeric value only:");
				return false;
			}

		}

		else if (obj == "clusterUpdate") {
			buttonValue = "clusterUpdate";
			if (cm_cluster == "" || nc_cluster == "" || cmpuCluster == ""
					|| ncCmpuCluster == "") {
				alert("Fields should be filled with numeric value only:");
				return false;
			}
		}

		else if (obj == "exceptionUpdate") {
			buttonValue = "exceptionUpdate";
			if (cmpuMin == "") {
				alert("Fields should be filled with numeric value only:");
				return false;
			}
		}

		else if (obj == 'subcatAAUpdate') {
			buttonValue = "subcatAAUpdate";
			if (cm_subcat_AA == "" || nc_subcat_AA == "" || gm_subcat_AA == ""
					|| ng_subcat_AA == "" || cmpuSubcat_AA == ""
					|| ncCmpuSubcat_AA == "") {
				alert("Fields should be filled with numeric value only:");
				return false;
			}

		}

		else if (obj == 'brandAAUpdate') {
			buttonValue = "brandAAUpdate";
			if (cm_brand_AA == "" || nc_brand_AA == "" || gm_brand_AA == ""
					|| ng_brand_AA == "" || cmpuBrand_AA == ""
					|| ncCmpuBrand_AA == "") {
				alert("Fields should be filled with numeric value only:");
				return false;
			}

		}

		else if (obj == "clusterAAUpdate") {
			buttonValue = "clusterAAUpdate";
			if (cm_cluster_AA == "" || nc_cluster_AA == ""
					|| gm_cluster_AA == "" || ng_cluster_AA == ""
					|| cmpuCluster_AA == "" || ncCmpuCluster_AA == "") {
				alert("Fields should be filled with numeric value only:");
				return false;
			}
		}

		else if (obj == "exceptionAAUpdate") {
			buttonValue = "exceptionAAUpdate";
			if (cmpuMin_AA == "") {
				alert("Fields should be filled with numeric value only:");
				return false;
			}
		}
		
		( function($) {
		$
				.ajax({
					type : "GET",
					dataType : 'html',
					url : '/PriceSimulator/ajax/cashBackConfigUpdateAction.action?button='
							+ buttonValue
							+ '&subcatName='
							+ subcatName
							+ '&cmSubcat='
							+ cm_subcat
							+ '&cmpuSubcat='
							+ cmpuSubcat
							+ '&ncCmpuSubcat='
							+ ncCmpuSubcat
							+ '&ncSubcat='
							+ nc_subcat
							+ '&cmBrand='
							+ cm_brand
							+ '&ncBrand='
							+ nc_brand
							+ '&cmpuBrand='
							+ cmpuBrand
							+ '&ncCmpuBrand='
							+ ncCmpuBrand
							+ '&cmCluster='
							+ cm_cluster
							+ '&ncCluster='
							+ nc_cluster
							+ '&cmpuCluster='
							+ cmpuCluster
							+ '&ncCmpuCluster='
							+ ncCmpuCluster
							+ '&cmpuMinException='
							+ cmpuMin
							+ '&cmSubcatAA='
							+ cm_subcat_AA
							+ '&gmSubcatAA='
							+ gm_subcat_AA
							+ '&cmpuSubcatAA='
							+ cmpuSubcat_AA
							+ '&ncCmpuSubcatAA='
							+ ncCmpuSubcat_AA
							+ '&ncSubcatAA='
							+ nc_subcat_AA
							+ '&ngSubcatAA='
							+ ng_subcat_AA
							+ '&cmBrandAA='
							+ cm_brand_AA
							+ '&ncBrandAA='
							+ nc_brand_AA
							+ '&gmBrandAA='
							+ gm_brand_AA
							+ '&ngBrandAA='
							+ ng_brand_AA
							+ '&cmpuBrandAA='
							+ cmpuBrand_AA
							+ '&ncCmpuBrandAA='
							+ ncCmpuBrand_AA
							+ '&cmClusterAA='
							+ cm_cluster_AA
							+ '&ncClusterAA='
							+ nc_cluster_AA
							+ '&gmClusterAA='
							+ gm_cluster_AA
							+ '&ngClusterAA='
							+ ng_cluster_AA
							+ '&cmpuClusterAA='
							+ cmpuCluster_AA
							+ '&ncCmpuClusterAA='
							+ ncCmpuCluster_AA
							+ '&cmpuMinExceptionAA='
							+ cmpuMin_AA
							+ '&batchConfigTableArr=' + batchConfigTableArr,

					success : function(data) {
						alert(data);
					}
				});
		} ) ( jQuery );
	}
</script>
</head>
<body>
	<br>
	<fieldset>
		<h5>&nbsp;&nbsp;&nbsp;&nbsp;Auto Approval Limit</h5>
		<table class="table1 table">

			<tr>
				<th class="nobg">Property</th>
				<th>Cm</th>
				<th>Nc</th>
				<th>Gm</th>
				<th>Ng</th>
				<th>CMPU Competitor</th>
				<th>CMPU No Competitor</th>
				<th>Action</th>
			</tr>

			<tr>
				<td class="bg">Subcategory Auto Approval Limit</td>
				<td><input type="text" id="cmSubcatAA"
					onkeypress="return validate(event)" class="form-control"
					style="width: 100%"></td>
				<td><input type="text" id="ncSubcatAA"
					onkeypress="return validate(event)" class="form-control"
					style="width: 100%"></td>
				<td><input type="text" id="gmSubcatAA"
					onkeypress="return validate(event)" class="form-control"
					style="width: 100%"></td>
				<td><input type="text" id="ngSubcatAA"
					onkeypress="return validate(event)" class="form-control"
					style="width: 100%"></td>
				<td><input type="text" id="cmpuSubcatAA"
					onkeypress="return validate(event)" class="form-control"
					style="width: 100%"></td>
				<td><input type="text" id="ncCmpuSubcatAA"
					onkeypress="return validate(event)" class="form-control"
					style="width: 100%"></td>
				<td><input type="button" value="Update" id="subcatAAUpdate"
					onclick="Update('subcatAAUpdate')" class="btn btn-primary"
					style="width: 100%" /></td>
			</tr>

			<tr>
				<td class="bg">Cluster Auto Approval limit</td>
				<td><input type="text" id="cmClusterAA"
					onkeypress="return validate(event)" class="form-control"
					style="width: 100%"></td>
				<td><input type="text" id="ncClusterAA"
					onkeypress="return validate(event)" class="form-control"
					style="width: 100%"></td>
				<td><input type="text" id="gmClusterAA"
					onkeypress="return validate(event)" class="form-control"
					style="width: 100%"></td>
				<td><input type="text" id="ngClusterAA"
					onkeypress="return validate(event)" class="form-control"
					style="width: 100%"></td>
				<td><input type="text" id="cmpuClusterAA"
					onkeypress="return validate(event)" class="form-control"
					style="width: 100%"></td>
				<td><input type="text" id="ncCmpuClusterAA"
					onkeypress="return validate(event)" class="form-control"
					style="width: 100%"></td>
				<td><input type="button" value="Update" id="clusterAAUpdate"
					onclick=" Update('clusterAAUpdate')" class="btn btn-primary"
					style="width: 100%" /></td>
			</tr>

			<tr>
				<td class="bg">Brand Auto Approval limit</td>
				<td><input type="text" id="cmBrandAA"
					onkeypress="return validate(event)" class="form-control"
					style="width: 100%"></td>
				<td><input type="text" id="ncBrandAA"
					onkeypress="return validate(event)" class="form-control"
					style="width: 100%"></td>
				<td><input type="text" id="gmBrandAA"
					onkeypress="return validate(event)" class="form-control"
					style="width: 100%"></td>
				<td><input type="text" id="ngBrandAA"
					onkeypress="return validate(event)" class="form-control"
					style="width: 100%"></td>
				<td><input type="text" id="cmpuBrandAA"
					onkeypress="return validate(event)" class="form-control"
					style="width: 100%"></td>
				<td><input type="text" id="ncCmpuBrandAA"
					onkeypress="return validate(event)" class="form-control"
					style="width: 100%"></td>
				<td><input type="button" value="Update" id="brandAAUpdate"
					onclick=" Update('brandAAUpdate')" class="btn btn-primary"
					style="width: 100%" /></td>
			</tr>



		</table>
		<table style="margin-top: 0%" class="table1 table">

			<tr>
				<th class="nobg">Property</th>
				<th>CMPU Limit</th>
				<th></th>
				<th></th>
				<th></th>
				<th>Action</th>
			</tr>

			<tr>
				<td class="bg">Exception Auto Approval limit</td>
				<td><input type="text" id="cmpuAAMin"
					onkeypress="return validate(event)" class="form-control"
					style="width: 100%"></td>
				<td></td>
				<td></td>
				<td></td>
				<td><input type="button" value="Update" id="exceptionAAUpdate"
					class="btn btn-primary" onclick=" Update('exceptionAAUpdate')"
					style="width: 100%" /></td>
			</tr>

		</table>
	</fieldset>
	<br>
	<fieldset>
		<h5>&nbsp;&nbsp;&nbsp;&nbsp;Rules Limit</h5>
		<table class="table1 table">

			<tr>
				<th class="nobg">Property</th>
				<th>Cm</th>
				<th>Nc</th>
				<th>CMPU Competitor</th>
				<th>CMPU No Competitor</th>
				<th>Action</th>
			</tr>

			<tr>
				<td class="bg">Subcategory Discount Limit</td>
				<td><input type="text" id="cmSubcat"
					onkeypress="return validate(event)" class="form-control"
					style="width: 100%"></td>
				<td><input type="text" id="ncSubcat"
					onkeypress="return validate(event)" class="form-control"
					style="width: 100%"></td>
				<td><input type="text" id="cmpuSubcat"
					onkeypress="return validate(event)" class="form-control"
					style="width: 100%"></td>
				<td><input type="text" id="ncCmpuSubcat"
					onkeypress="return validate(event)" class="form-control"
					style="width: 100%"></td>
				<td><input type="button" value="Update" id="subcatUpdate"
					onclick="Update('subcatUpdate')" class="btn btn-primary"
					style="width: 100%" /></td>
			</tr>

			<tr>
				<td class="bg">Cluster Discount limit</td>
				<td><input type="text" id="cmCluster"
					onkeypress="return validate(event)" class="form-control"
					style="width: 100%"></td>
				<td><input type="text" id="ncCluster"
					onkeypress="return validate(event)" class="form-control"
					style="width: 100%"></td>
				<td><input type="text" id="cmpuCluster"
					onkeypress="return validate(event)" class="form-control"
					style="width: 100%"></td>
				<td><input type="text" id="ncCmpuCluster"
					onkeypress="return validate(event)" class="form-control"
					style="width: 100%"></td>
				<td><input type="button" value="Update" id="clusterUpdate"
					onclick=" Update('clusterUpdate')" class="btn btn-primary"
					style="width: 100%" /></td>
			</tr>

			<tr>
				<td class="bg">Brand Discount limit</td>
				<td><input type="text" id="cmBrand"
					onkeypress="return validate(event)" class="form-control"
					style="width: 100%"></td>
				<td><input type="text" id="ncBrand"
					onkeypress="return validate(event)" class="form-control"
					style="width: 100%"></td>
				<td><input type="text" id="cmpuBrand"
					onkeypress="return validate(event)" class="form-control"
					style="width: 100%"></td>
				<td><input type="text" id="ncCmpuBrand"
					onkeypress="return validate(event)" class="form-control"
					style="width: 100%"></td>
				<td><input type="button" value="Update" id="brandUpdate"
					onclick=" Update('brandUpdate')" class="btn btn-primary"
					style="width: 100%" /></td>
			</tr>



		</table>

		<table style="margin-top: 0%" class="table1 table">

			<tr>
				<th class="nobg">Property</th>
				<th>CMPU Limit</th>
				<th></th>
				<th></th>
				<th></th>
				<th>Action</th>
			</tr>

			<tr>
				<td class="bg">Exception Discount limit</td>
				<td><input type="text" id="cmpuMin"
					onkeypress="return validate(event)" class="form-control"
					style="width: 100%"></td>
				<td></td>
				<td></td>
				<td></td>
				<td><input type="button" value="Update" id="exceptionUpdate"
					class="btn btn-primary" onclick=" Update('exceptionUpdate')"
					style="width: 100%" /></td>
			</tr>

		</table>
		<br />

		<table class="table2 table" id="batchConfigTable">
			<thead>
				<tr>
					<th>Property</th>
					<th>Value</th>

				</tr>
			</thead>

			<s:iterator value="%{#session.configData}" var="config">
				<tr class="list">

					<td class="listName"><s:property value="configName" /></td>
					<td><input type="text"
						value="<s:property value="configValue"/>"
						id="<s:property value="configName" />" class="form-control"
						style="width: 100%" /></td>
				</tr>
			</s:iterator>

			<tr>
				<td colspan="2"><input type="button" value="Update"
					id="configUpdate" onclick=" return Update('configUpdate')"
					class="btn btn-primary" /></td>
			</tr>

		</table>
	</fieldset>
</body>
</html>