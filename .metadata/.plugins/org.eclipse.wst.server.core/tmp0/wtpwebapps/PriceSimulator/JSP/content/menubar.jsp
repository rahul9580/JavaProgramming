<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/PriceSimulator/JS/utility/EnableDisableButton.js"></script>
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/content/menubar.css" media="screen" />
</head>
<body onload="enableDisableButton('<s:property value="session.subcatAccess"/>','<s:property value="session.adminPrivilege"/>')">

	<div class="menu">
		<div style="position: relative; display: inline-block; width: 15%; text-align: center;">
			<img alt="" src="/PriceSimulator/img/logo.png" style="height: 35px;">
			<p class="filterhead" style="margin: 0; font-size: 12px;">Price Simulator</p>
		</div>


		<ul class="menubar">
			<s:if test="%{#session.application==\"2\"}">
				
				<s:if test="%{#session.current==\"budgetRuleSummary\"}">
					<li id="budgetRuleSummary" class="active"><a href="#">Summary</a></li>
				</s:if>
				<s:else>
					<li id="budgetRuleSummary"><a
						href="/PriceSimulator/budgetRule/budgetRuleSummary.action"
						style="margin: 0; font-size: 13px;">Summary</a></li>
				</s:else>

				<s:if test="%{#session.current==\"createBudgetRule\"}">
					<li id="createBudgetRule" class="active"><a href="#">Create Rule</a></li>
				</s:if>
				<s:else>
					<li id="createBudgetRule"><a
						href="/PriceSimulator/budgetRule/createBudgetRule.action"
						style="margin: 0; font-size: 13px;">Create Rule</a></li>
				</s:else>
					
			</s:if>
			
			<s:else>
				
			<s:if test="%{#session.current==\"viewSummary\"}">
				<li id="viewSummary" class="active"><a href="#">Summary</a></li>
			</s:if>
			<s:else>
				<li id="viewSummary"><a href="/PriceSimulator/viewSummary.action"  style="margin: 0; font-size: 13px;">Summary </a></li>
			</s:else>
			<s:if test="%{#session.current==\"rules\"}">
				<li id="rules" class="active"><a href="#"  style="margin: 0; font-size: 13px;">Create New Rules</a></li>
			</s:if>
			<s:else>
				<li id="rules"><a href="/PriceSimulator/rules.action"  style="margin: 0; font-size: 13px;">Create New Rules</a></li>
			</s:else>

			<s:if test="%{#session.adminPrivilege == 'admin'}">
				<s:if test="%{#session.current==\"ocp\"}">
					<li class="active"><a href="#"  style="margin: 0; font-size: 13px;">OCP</a></li>
				</s:if>
				<s:else>
					<li><a href="/PriceSimulator/exceptions/ocp.action"  style="margin: 0; font-size: 13px;">OCP</a></li>
				</s:else>
			</s:if>
			<%-- <s:if test="%{#session.adminPrivilege == 'admin'}"> --%>
			<li class="dropdown"><a href="#" style="margin: 0; font-size: 13px;"> Bulk</a>
			<ul class="large">
				<s:if test="%{#session.current==\"bulkUploadPage\"}">
					<li class="active"><a href="#">BulkUpload</a></li>
				</s:if>
				<s:else>
					<li><a href="/PriceSimulator/ajax/bulkUpload.action" >BulkUpload</a></li>
				</s:else>
				<s:if test="%{#session.adminPrivilege == 'admin'}">
				<s:if test="%{#session.current==\"exceptionBulkupload\"}">
					<li class="active"><a href="#"  >Exception</a></li>
				</s:if>
				<s:else>
					<li><a href="/PriceSimulator/exceptions/exceptionBulkupload.action" >Exception</a></li>
				</s:else>
				</s:if>
			</ul>
			</li>
			<%-- </s:if> --%>

			<s:if test="%{#session.current==\"exceptions/mop\"}">
				<li class="active"><a href="#"  style="margin: 0; font-size: 13px;">MOP</a></li>
			</s:if>
			<s:else>
				<li><a href="/PriceSimulator/exceptions/mop.action"  style="margin: 0; font-size: 13px;">MOP</a></li>
			</s:else>
			<s:if test="%{#session.current==\"exceptions/removeproduct\"}">
				<li class="active"><a href="#">RFS</a></li>
			</s:if>
			<s:else>
				<li><a href="/PriceSimulator/exceptions/removeproduct.action"  style="margin: 0; font-size: 13px;">RFS</a></li>
			</s:else>

			<s:if test="%{#session.adminPrivilege == 'admin'}">
				<li class="dropdown"><a href="#" style="margin: 0; font-size: 13px;"> Configuration</a>
					<ul class="large">
						<s:if test="%{#session.current==\"exceptions/singleCashBackConfigAction\"}">
							<li><a href="#">Single Subcat CB Config</a></li>
						</s:if>
						<s:else>
							<li><a href="/PriceSimulator/exceptions/singleCashBackConfigAction.action">Single Subcat CB Config</a></li>
						</s:else>
						<s:if test="%{#session.current==\"exceptions/multipleCashBackConfigAction\"}">
							<li><a href="#">Multiple Subcat CB Config</a></li>
						</s:if>
						<s:else>
							<li><a href="/PriceSimulator/exceptions/multipleCashBackConfigAction.action">Multiple Subcat CB Config</a></li>
						</s:else>
						<s:if test="%{#session.current==\"exceptions/manageSubcat\"}">
							<li><a href="#">Subcat Config</a></li>
						</s:if>
						<s:else>
							<li><a href="/PriceSimulator/manageSubcat.action?action=getPage"> Subcat Config</a></li>
						</s:else>

						<s:if test="%{#session.current==\"exceptions/manageAllSubcat\"}">
							<li><a href="#">All Subcat Config</a></li>
						</s:if>
						<s:else>
							<li><a href="/PriceSimulator/exceptions/manageAllSubcat.action">Multiple Subcat Config</a></li>
						</s:else>

						<s:if test="%{#session.current==\"exceptions/priceAnalyticsConfView\"}">
							<li><a href="#">Price Analytics Configurations</a></li>
						</s:if>
						<s:else>
							<li><a href="/PriceSimulator/exceptions/priceAnalyticsConfView.action"> Price Analytics Configurations</a></li>
						</s:else>
						<%-- <s:if test="%{#session.current==\"exceptions/priceAnalyticsMultiConfView\"}">
							<li><a href="#">Multiple Subcat Price Analytics Configurations</a></li>
						</s:if>
						<s:else>
							<li><a href="/PriceSimulator/exceptions/priceAnalyticsMultiConfView.action"> Multiple Subcat Price Analytics Configurations</a></li>
						</s:else> --%>
						
<%--						<s:if test="%{#session.current==\"exceptions/viewPriceAnalyticsSubcat\"}">
							<li><a href="#">Price Analytics Configurations</a></li>
						</s:if>
						<s:else>
							<li><a href="/PriceSimulator/exceptions/viewPriceAnalyticsSubcat.action"> View Active Subcats On Price Analytics</a></li>
						</s:else> --%>
						<s:if test="%{#session.current==\"exceptions/sellerManagement\"}">
							<li><a href="#">Seller Management</a></li>
						</s:if>
						<s:else>
							<li><a href="/PriceSimulator/exceptions/sellerManagement.action?newPageNo=1">Seller Management</a></li>
						</s:else>
						<%-- <s:if test="%{#session.current==\"exceptions/updatebrandDiscountingConfig\"}">
							<li><a href="#">Brand Discounting Config</a></li>
						</s:if>
						<s:else>
							<li><a href="/PriceSimulator/exceptions/updateBrandDiscountingConfig.action">Brand Discounting Config</a></li>
						</s:else> --%>
						<li><a href="/PriceSimulator/exceptions/redirectToSFCB.action">SFCB</a></li>
						<li><a href="/PriceSimulator/exceptions/sellerConstraintConfig.action">Seller Constraint Config</a></li>
						 

					</ul></li>
			</s:if>
			<s:elseif test="%{#session.adminPrivilege == 'admin' || #session.subcatAccess == 'approve'}">
				<li class="dropdown"><a href="#"  style="margin: 0; font-size: 13px;">Configuration</a>
					<ul class="large">
						<s:if test="%{#session.current==\"exceptions/sellerManagement\"}">
							<li><a href="#"  style="margin: 0; font-size: 13px;">Seller Management</a></li>
						</s:if>
						<s:else>
							<li><a href="/PriceSimulator/exceptions/sellerManagement.action?newPageNo=1">Seller Management</a></li>
						</s:else>
						<li><a href="/PriceSimulator/exceptions/redirectToSFCB.action">SFCB</a></li>
					</ul></li>
			</s:elseif>

			<s:if test="%{#session.adminPrivilege == 'admin' || #session.subcatAccess == 'approve'}">
				<s:if test="%{#session.current=='genericRfsPage'}">
					<li class="active"><a href="#"  style="margin: 0; font-size: 13px;">GenericRFS</a></li>
				</s:if>
				<s:else>
					<li><a href="/PriceSimulator/ajax/GenericRfs.action"  style="margin: 0; font-size: 13px;">GenericRFS</a></li>
				</s:else>
			</s:if>
		
			<s:if test="%{#session.adminPrivilege == 'admin'}">
				<li class="dropdown"><a href="#"
					style="margin: 0; font-size: 13px;">SCE</a>
					<ul>
						<li><a href="/PriceSimulator/shippingCostUI.action">SCE
								Rules</a></li>
						<li><a href="/PriceSimulator/shippingConfig.action">SCE
								Config</a></li>
					</ul></li>
			</s:if> 
</s:else>
<li id="logout" class="dropdown" style="float:right"> <a href="#"><s:property value="%{#session.user.getEmail()}" /></a>
				<ul>
					<li><a href="#" onclick="confirmLogout(<s:property value="#session.updateMadeInSession"/>)">Logout</a></li>
				</ul></li>
		</ul>
	</div>
	<script type="text/javascript">
	function confirmLogout(ifChangesMade)
	{		$.ajax(
			{	type : "POST",
				dataType: 'html',
				url : '/PriceSimulator/logout.action',
				success : function(data)
				{
					if(data == 2)
					{
						window.location="/PriceSimulator/logout.action?confirmLogout=true";
					}
					else
					{
						window.location="viewSummary.action";
					}
				}
			});
}
	</script>
</body>
</html>