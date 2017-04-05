<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Snapdeal Price Simulator</title>
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/base/structure.css" media="screen" />

<style>
#seller_multiselect, #multiselect, #multiselect_to,
	#seller_multiselect_to {
	width: 300px;
}
</style>
<div class="header"><%@include file="../../content/menubar.jsp"%></div>
<div class="filter"><%@include file="../../content/categoryfilter.jsp"%></div>



<script type="text/javascript">

function move(direction,all,type)
{
	
	
	var src = document.getElementById(type+'LeftList')
	var trg = document.getElementById(type+'RightList')	
	var tem
 
	if(direction)
	{
		tem = src
		src = trg
		trg = tem
		
		if(all)
		 $('#'+type+'RightList option').prop('selected', true);   
	
	}
	else
		{
		if(all)
		 $('#'+type+'LeftList option').prop('selected', true);
		}
 
	var selected = []
 
	for(var i in src.options)
	{
		if(src.options[i].selected)
		{
			trg.options.add(new Option(src.options[i].text, src.options[i].value));
			selected.unshift(i);
		}
	}
 
	for(i in selected)
		src.options.remove(selected[i]);
}


function fetchSubCateList() {

	/* document.getElementById("brandType").disabled = true;
	document.getElementById("sellerType").disabled = true;
	 */
	//alert('fetchBrandList');
	document.getElementById("SubcatLeftList").options.length = 0;
	var select = document.getElementById("SubcatLeftList");
	option = document.createElement("option");
	option.innerHTML = "Fetching subcate list...";
	select.appendChild(option);
			
	
		var url;
			url = "fetchData.action?brandType=allSubcat";
	
		$.ajax(
				{
					type : "GET",
					dataType: 'html',
					url : 'fetchData.action?brandType=allSubcat',
					success : function(data)
					{
						
						if(data != -1)
						{
							$('#SUbcatLeftList option').each(function(index, option) {
							    $(option).remove();
							});
							var list = data.split(";");
							
							
							$.each(list, function(idx, obj)
									{
								 $(option).remove();
								 var o = new Option(obj.split(":")[0], obj.split(":")[1]);
				            $(o).html(obj.split(":")[0]);
				            $("#SubcatLeftList").append(o);
				            	
				           /*  $(".multiselect").prepend($("<option>")
							                              .val(obj.split(":")[1])       // Might have to use .attr("value", i) instead
							                              .html(obj.split(":")[0])); */
							});
							
						}
						
					}
				});
	}


function SubmitFunction()
{
	$('#SubcatRightList option').prop('selected', true);
	document.getElementById("type").value=val;
	document.createClusterForm.submit();
}

function SubmitDelFunction()
{
	
	document.getElementById("userAction").value="delete";
	document.createClusterForm.submit();
}


</script>
</head>

<body>
	<div id="message" style="margin-left: 35%; color: green">
		<%
			Object object = request.getAttribute("message");

			if (object != null)
				out.println(object);
		%>
	</div>

	<div class="content" style="width: 70%;">
		<form action="UserSubcatMapping.action" id="createUserCatSubcatForm" name="createUserCatSubcatForm"
			style="display: block" method="POST" enctype="multipart/form-data">

			<br> <br>
			<div class="errors">
				<s:property value="#session.message" />
			</div>
			<br> <br> 
			 <input type="hidden" name="userAction" id="userAction" value="create" /> 
			 
			 <fieldset class="SelectManyControl_fieldset" style="width: 550px;">
									<legend class="SelectManyControl_legend">Create 
										User</legend>
			<span>Email Id:</span><input  name="emailId" id="emailId"  style="margin-left: 39px;"/> 
			<br> <br>
			<span>Password:</span><input name="password" id="password" style="margin-left: 29px;"/> 
			<br> <br>
			<span>GroupEmail Id:</span><input  name="groupEmailId" id="groupEmailId"  style="margin-left: 1px;"/> 
			</fieldset>
			 <br> <br>
			 
			 <fieldset class="SelectManyControl_fieldset" style="width: 550px;">
									<legend class="SelectManyControl_legend">Or Select User From DrobBox
										</legend>
			<select	id="userID" name="userID" onchange="fetchUserList()" style="margin-left: 30px">
				<option value="select">--Select--</option>
				<s:iterator value="users">
					<option value="<s:property/>"><s:property/></option>
				</s:iterator>
			</select> <br> 
			</fieldset>
			<br> <br> 



	<br>
					<font color="red">*</font> Subcat DrobBox &nbsp;&nbsp;&nbsp;
					<select id="categoryType" name="categoryType"
						onchange="fetchSubCateList()" style="margin-left: 50px">
						<option value="select">--Select--</option>
						<!-- <option value="critical">Critical Seller</option>
						<option value="nonCritical">Non-Critical Seller</option> -->
						<option value="all">All Subcategories</option>
					</select>
					<br>
					<br>
					
					<table>
					<tbody>
						<tr>
							<td>
								<fieldset class="SelectManyControl_fieldset">
									<legend class="SelectManyControl_legend">Available
										Subcategories</legend>
									<select name="subcat_list_from" id="SubcatLeftList" size="12" multiple="multiple"
										style="width: 250px">
										<!-- <option value="0">item0</option><option value="2">item2</option><option value="4">item4</option><option value="5">item5</option><option value="6">item6</option><option value="7">item7</option> -->
										<!-- Need to write here the code for fetching the value -->



									</select>
								</fieldset>
							</td>
							<td>
								<table>
									<tbody>
										<tr>
											<td><input type="button"
												onclick="move(0,0,'Subcat')"
												value="&gt;" style="width: 25px" /></td>
										</tr>
										<tr>
											<td><input type="button"
												onclick="move(0,1,'Subcat')"
												value="&gt;&gt;" style="width: 25px" /></td>
										</tr>
										<tr>
											<td><input type="button"
												onclick="move(1,0,'Subcat')"
												value="&lt;" style="width: 25px" /></td>
										</tr>
										<tr>
											<td><input type="button"
												onclick="move(1,1,'Subcat')"
												value="&lt;&lt;" style="width: 25px" /></td>
										</tr>
									</tbody>
								</table>
							</td>
							<td>
								<fieldset class="SelectManyControl_fieldset">
									<legend class="SelectManyControl_legend">Selected
										Subcategories</legend>
									<select id="SubcatRightList" name="SubcatRightList" size="12" multiple="multiple"
										style="width: 250px">
										<!-- <option value="1">item1</option><option value="3">item3</option> -->
									</select>
								</fieldset>
							</td>
						</tr>
					</tbody>
				</table>
			<br> <br> <br>
			
			
			<button onclick="SubmitFunction();" value="updateUserSubCatMapping" >Update</button>
			
			<button onclick="SubmitDelFunction();" value="DisableUser" style="margin-left: 260px">Disabe</button>
			<br> <br>
		</form>

	</div>
	<%-- <div class="filter"><%@include file="../../content/categoryfilter.jsp"%></div> --%>




</body>
</html>





