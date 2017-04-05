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
<!-- <link href="/PriceSimulator/CSS/content/summary/dataTables.responsive.css" rel="stylesheet"> -->
<!-- <!-- Custom CSS -->
<!-- <link href="/PriceSimulator/CSS/content/summary/sb-admin-2.css" rel="stylesheet">

<link href="/PriceSimulator/CSS/content/summary/font-awesome.min.css" rel="stylesheet" type="text/css"> -->

<script src="/PriceSimulator/JS/utility/jquery-1.12.0.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/PriceSimulator/JS/utility/bootstrap.min.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/utility/loader.js"></script>
<%-- <script src="/PriceSimulator/JS/content/summary/metisMenu.min.js"></script>
<script src="/PriceSimulator/JS/content/summary/sb-admin-2.js"></script> --%>
<%-- <script
	src="/PriceSimulator/JS/content/summary/jquery.dataTables.min.js"></script>
<script
	src="/PriceSimulator/JS/content/summary/dataTables.bootstrap.min.js"></script> --%>



<script>
	$(document).ready(function() {
		var ruleType = $("#selectRule").val();
		$(".cluster").hide();
		$(".brand").hide();
		$(".subcategory").hide();
		$(".exception").show();
		$(".all").show();
		$(".ocp").show();
		
	});
	
	 var obj="<%= session.getAttribute("report")%>";
	
	if(obj==""){
		
	}else{
		var obj1=obj.replace(/#/g, '\n');
		alert(obj1);
	}
	
	
</script>
<script type="text/javascript">

	function ConfirmDelete()
	{
	  var x = confirm("Are you sure you want to delete?");
	  if (x)
	      return true;
	  else
	    return false;
	}
	</script>
<style type="text/css">
#viewSummary .panel {
	margin: 0;
	padding: 0;
	border: none;
}

#viewSummary table {
	margin-bottom: 0;
}

#viewSummary table tr {
	/* word-break: break-word; */
	border: 1px solid #DDDDDD;
}

#viewSummary table tr.success td {
	background: #D9EDF7;
}

#viewSummary table tr.success td {
	background: #D9EDF7;
}

#viewSummary table th {
	background-color: #f5f5f5;
	color: black;
}

.selected_summary {
	border: none;
	margin-top: 20px
}

.table_gray {
	background-color: #f5f5f5;
	color: black
}

.no_pad {
	padding: 0;
}

.no_mar {
	margin: 0;
}
</style>

</head>
<body style="font-size: 12px">
	<div id="viewSummary" style="width: 96%; margin: 20px 2%;">
		<div style="margin-left: 40%;" id="message">
			<font color='green'></font>
		</div>
		<div style="">
			<label>Select RuleType</label> <select id="selectRule" style="width: 20%; margin-bottom: 20px;" name="ruleType" onchange="selectRuleType()"
				class="form-control">
				<option value="all" selected="selected">All</option>
				<option value="subcategory">Subcategory</option>
				<option value="brand">Brand</option>
				<option value="cluster">Cluster</option>
				<option value="exception">Exception</option>
				<option value="ocp">OCP</option> 
				<option value="pa">PA Rules</option> 
			</select>
		</div>

		<div class="all selected_summary">
			<form class="form" action="viewSummary.action" name="all" method="POST">
				<div class="panel panel-default" >
					<div class="panel-body no_pad" style="overflow-x:auto">
						<!-- <div class="dataTable_wrapper"> -->
						<div class="table-responsive">
							<table class="table table-bordered dataTable" id="dataTables-example">
								<thead>
									<tr>
										<s:if test="session.subcatAccess=='approve' || session.adminPrivilege=='admin'">
											<th style="text-align: center; padding: 4px;"><input name="mainToggle" type="checkbox" onClick="toggle(this,'all')" /></th>
										</s:if>
										<th>Group Name</th>
										<th>CM %</th>
										<th>GM %</th>
										<th>CMPU</th>
										<th>CompDiff(%)</th>
										<th>Max CompDiff(Rs.)</th>
										<th>NC CM%</th>
										<th>NC GM%</th>
										<th>NC CMPU </th>
										<th>Vendor-SUPC Count</th>
										<th>Start Time</th>
										<th>End Time</th>
										<th>Status</th>
										<th>Rule Type</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<s:iterator value="%{#session.groupLists}" var="group" status="counter">

										<s:if test="stateName == 'Approved'">
											<tr style="background: #D9EDF7" class='success'>
										</s:if>
										<s:elseif test="stateName == 'Rejected'">
											<tr style="background: #F2DEDE" class='reject'>
										</s:elseif>
										<s:else>
											<tr style="background: #fff" class='pending'>
										</s:else>
										<s:if test="session.subcatAccess=='approve' || session.adminPrivilege=='admin'">
											<s:if test="rule_state == 0 || rule_state == 2">
												<td><input type="checkbox" name="all" onclick="changesStatus(this)"
													value="<s:property  value='rule_state'/>##<s:property  value="rule_type"/>##<s:property  value="ruleId"/>"></td>
											</s:if>
											<s:else>
												<td>
													<!-- <input type="checkbox" name="asdgroupID" disabled="disabled"> -->
												</td>
											</s:else>
										</s:if>
										<td><s:if test="%{#session.subcategoryStatus==1}">
												<a href="viewSummary.action?ruleID=<s:property  value="ruleId"/>&applyCashback=edit&rule_type=<s:property  value="rule_type"/>">
													<s:property value="groupName" />
												</a>
											</s:if> <s:else>
												<s:property value="groupName" />
											</s:else></td>
										<td><s:property value="newCM" /></td>
										<td><s:property value="newGM" /></td>
										<td><s:property value = "cmpu"/></td>
										<td><s:property value="newCompPer" /></td>
										<td><s:property value="newCompAbs" /></td>
										<td><s:property value="newNCCM" /></td>
										<td><s:property value="newNCGM" /></td>
										<td><s:property value="nccmpu"/></td>
										<td><a href="viewSummary.action?groupID=<s:property  value="groupId"/>&applyCashback=false"><s:property value="count" /></a></td>
										<td><s:property value="start_date" /></td>
										<td><s:property value="end_date" /></td>
										<td><s:property value="stateName" /></td>
										<td><s:property value="rule_type" /></td>
										<s:if test="session.subcatAccess=='approve' || session.adminPrivilege=='admin'">
											<td><s:if test="%{#session.subcategoryStatus==0}">

												</s:if> <s:else>
													<s:if test="rule_state == 0 || rule_state == 2">
														<span> <a
															href="viewSummary.action?ruleID=<s:property  value="ruleId"/>&applyCashback=approve&rule_state=
																				<s:property  value="rule_state"/>&rule_type=<s:property  value="rule_type"/>">
																<input type="button" class="btn btn-primary" name="Approve" value="Approve">
														</a>
														</span>
														<span> <a
															href="viewSummary.action?ruleID=<s:property  value="ruleId"/>&applyCashback=reject&rule_state=
																				<s:property  value="rule_state"/>&rule_type=<s:property  value="rule_type"/>">
																<input type="button" class="btn btn-primary" name="Reject" value="Reject">
														</a>
														</span>
													</s:if>
													<s:elseif test="rule_state == 1 || rule_state == 3">
														<span> <a class="btn btn-primary"
															href="viewSummary.action?ruleID=<s:property  value="ruleId"/>&applyCashback=Delete&rule_state=
																				<s:property  value="rule_state"/>&rule_type=<s:property  value="rule_type"/>"
															onclick="return ConfirmDelete();">Delete </a>
														</span>
													</s:elseif>
												</s:else></td>
										</s:if>
										<s:elseif test="session.subcatAccess=='write' ">
											<td><s:if test="%{#session.subcategoryStatus==0}">

												</s:if> <s:else>
													<s:if test="rule_state == 0 || rule_state == 2">
														<span> <a class="btn btn-primary"
															href="viewSummary.action?ruleID=<s:property  value="ruleId"/>&applyCashback=Delete&rule_state=
																				<s:property  value="rule_state"/>&rule_type=<s:property  value="rule_type"/>"
															onclick="return ConfirmDelete();">Delete </a>
														</span>
													</s:if>
												</s:else></td>
										</s:elseif>
										<s:else>
											<td></td>
										</s:else>
										</tr>
									</s:iterator>
								</tbody>
							</table>
						</div>
						<!-- </div> -->
					</div>
				</div>
				<br>
				<s:if test="session.subcatAccess=='approve' || session.adminPrivilege=='admin'">
					<input type="hidden" id="applyCashbackall" name="applyCashback" value="approve">
					<s:if test="%{#session.subcategoryStatus!=0}">
						<center>
							<input type="button" disabled id="approvalSubmit" class="btn btn-primary" onclick="projectAction('1')" style="position: inherit;"
								value="Approve All"> <input type="button" disabled id="rejectSubmit" class="btn btn-primary" onclick="projectAction('0')"
								style="position: inherit;" value="Reject All" disabled="disabled">
						</center>
					</s:if>
				</s:if>
			</form>
		</div>
		
		
		
		<!--OCP Table  -->
		<div class="ocp selected_summary">
		<label>OCP</label>
			<form class="form" action="viewSummary.action" name="ocp" method="POST">
				<div class="panel panel-default" style="border: none">
				<div >
					<div class="panel-body no_pad" style="float: left;overflow-x: auto;width:100%">
						<!-- <div class="dataTable_wrapper"> -->
						<div class="table-responsive" >
							<table class="table table-bordered">
								<thead>
									<tr>
										<s:if test="session.subcatAccess=='approve' || session.adminPrivilege=='admin'">
											<th style="text-align: center; padding: 4px;"><input name="mainToggle" type="checkbox" onClick="toggle(this,'ocp')" /></th>
										</s:if>
										<th>SUPC</th>
										<th>Product Name</th>
										<th>Seller Code</th>
										<th>SellerName</th>
										<th>Seller Zone</th>
										<th>SP</th>
										<th>MOP</th>
										<th>OP</th>
										<th>Seller Funded CB</th>
										<th>Inventory</th>
										<th>Discount Type</th>
										<th>Instant</th>
										<th>Wallet</th>
										<th>Effective Price</th>
										<th>CM%</th>
										<th>CMPU</th>
										<th>Start Time</th>
										<th>End Time</th>
										<th>Status</th>
										<th>Action</th>
										<th>Created by</th>
										
									</tr>
								</thead>
								<tbody>
									<s:iterator value="%{#session.ocpGroupLists}" var="group" status="counter">
										<s:if test="stateName == 'Approved'">
											<tr style="background: #D9EDF7" class='success'>
										</s:if>
										<s:elseif test="stateName == 'Rejected'">
											<tr style="background: #F2DEDE" class='reject'>
										</s:elseif>
										<s:else>
											<tr style="background: #fff" class='pending'>
										</s:else>
										<s:if test="session.subcatAccess=='approve' || session.adminPrivilege=='admin'">
											<s:if test="rule_state == 0 || rule_state == 2">
												<td><input type="checkbox" name="ocp" onclick="changesStatus(this)"
													value="<s:property  value='rule_state'/>##<s:property  value="rule_type"/>##<s:property  value="ruleId"/>"></td>
											</s:if>
											<s:else>
												<td>
												</td>
											</s:else>
										</s:if>
										<td><s:if test="%{#session.subcategoryStatus==1}">
												<a href="viewSummary.action?ruleID=<s:property  value="ruleId"/>&applyCashback=edit&rule_type=<s:property  value="rule_type"/>">
													<s:property value="supc" />
												</a>
											</s:if> <s:else>
												<s:property value="supc" />
											</s:else></td>
										<td><s:property value="productName" /></td>
										<td><s:property value="vendor_code" /></td>
										<td><s:property value="vendorName" /></td>
										<td><s:property value="vendorZone" /></td>
										<td><s:property value="selling_price" /></td>
										<td><s:property value="mop" /></td>
										<td><s:property value="offerPrice"/>
										<td><s:property value="int_cb_v"/>
										<td><s:property value="inventory"/>
										<td><s:property value="discountType"/>
										<td><s:property value="instantCB"/>
										<td><s:property value="walletCB"/>
										<td><s:property value="effectivePrice"/>
										<td><s:property value="cm"/>
										<td><s:property value="cmpu"/>
										<td><s:property value="start_date" /></td>
										<td><s:property value="end_date" /></td>
										<td><s:property value="stateName" /></td>
	
										<s:if test="session.subcatAccess=='approve' || session.adminPrivilege=='admin'">
											<td><s:if test="%{#session.subcategoryStatus==0}">

												</s:if> <s:else>
													<s:if test="rule_state == 0 || rule_state == 2">
														<span> <a
															href="viewSummary.action?ruleID=<s:property  value="ruleId"/>&applyCashback=approve&rule_state=
																				<s:property  value="rule_state"/>&rule_type=<s:property  value="rule_type"/>">
																<input type="button" class="btn btn-primary" name="Approve" value="Approve">
														</a>
														</span>
														<span> <a
															href="viewSummary.action?ruleID=<s:property  value="ruleId"/>&applyCashback=reject&rule_state=
																				<s:property  value="rule_state"/>&rule_type=<s:property  value="rule_type"/>">
																<input type="button" class="btn btn-primary" name="Reject" value="Reject">
														</a>
														</span>
													</s:if>
													<s:elseif test="rule_state == 1 || rule_state == 3">
															<span> <a class="btn btn-primary"
																href="viewSummary.action?ruleID=<s:property  value="ruleId"/>&applyCashback=Delete&rule_state=
																				<s:property  value="rule_state"/>&rule_type=<s:property  value="rule_type"/>"
																onclick="return ConfirmDelete();">Delete </a>
															</span>
														</s:elseif>
												</s:else></td>
										</s:if>
										<s:elseif test="session.subcatAccess=='write' ">
											<td><s:if test="%{#session.subcategoryStatus==0}">

												</s:if> <s:else>
													<s:if test="rule_state == 0 || rule_state == 2">
															<span> <a class="btn btn-primary"
																href="viewSummary.action?ruleID=<s:property  value="ruleId"/>&applyCashback=Delete&rule_state=
																				<s:property  value="rule_state"/>&rule_type=<s:property  value="rule_type"/>"
																onclick="return ConfirmDelete();">Delete </a>
															</span>
														</s:if>
												</s:else></td>
										</s:elseif>
										<s:else>
											<td></td>
										</s:else>
										<td><s:property value="added_by"/></td>
										</tr>
									</s:iterator>
								</tbody>
							</table>
						</div>
						<!-- </div> -->
					</div>
				</div>
				</div>
				<br>
				<s:if test="session.subcatAccess=='approve' || session.adminPrivilege=='admin'">
					<input type="hidden" id="applyCashbackocp" name="applyCashback" value="approve">
					<s:if test="%{#session.subcategoryStatus!=0}">
						<center>
							<input type="button" id="approvalSubmit" class="btn btn-primary" onclick="ocpProjectAction('1')" style="position: inherit;"
								value="Approve All" disabled="disabled"> <input type="button" id="rejectSubmit" class="btn btn-primary"
								onclick="ocpProjectAction('0')" style="position: inherit;" value="Reject All" disabled="disabled">
						</center>
					</s:if>
				</s:if>
			</form>
		</div>
		
		
		<!-- Exception table -->

		<div class="exception selected_summary">
			<label>Exception</label>
			<form action="viewSummary.action" name="exception" method="POST">
				<div class="panel panel-default">
					<div class="panel-body no_pad" style="float: left;overflow-x: auto;width:100%">
						<table class="table dataTable table-bordered table-hover" id="dataTables-example">
							<thead>
								<tr>
									<s:if test="session.subcatAccess=='approve' || session.adminPrivilege=='admin'">
										<th style="text-align: center; padding: 4px;"><input type="checkbox" onClick="toggle(this,'exception')" /></th>
									</s:if>
									<th>SUPC</th>
									<th>Product Name</th>
									<th>Offer Price</th>
									<th>CM %</th>
									<th>CMPU</th>
									<th>CMPU Limit</th>
									<th>Vendor Price</th>
									<th>SellerFunded CB</th>
									<th>Cashback</th>
									<th>Shipping</th>
									<th>Start Time</th>
									<th>End Time</th>
									<th>Status</th>
									<th>Created By</th>
									<th>Comment</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<s:iterator value="%{#session.exceptionGroupLists}" var="group" status="counter">
									<s:if test="stateName == 'Approved'">
										<tr style="background: #D9EDF7" class='success'>
									</s:if>
									<s:elseif test="stateName == 'Rejected'">
										<tr style="background: #F2DEDE" class='reject'>
									</s:elseif>
									<s:else>
										<tr style="background: #fff" class='pending'>
									</s:else>
									<s:if test="session.subcatAccess=='approve' || session.adminPrivilege=='admin'">
										<s:if test="rule_state == 0 || rule_state == 2">
											<td><input type="checkbox" name="exception" onclick="changesStatus(this)"
												value="<s:property  value='rule_state'/>##<s:property  value="rule_type"/>##<s:property  value="ruleId"/>"></td>
										</s:if>
										<s:else>
											<td></td>
										</s:else>
									</s:if>
									
									
									<td><s:if test="%{ {#session.subcategoryStatus==1} && {isVendorExistForException.booleanValue()}	}">
											<a href="viewSummary.action?ruleID=<s:property  value="ruleId"/>&applyCashback=edit&rule_type=<s:property  value="rule_type"/>">
												<s:property	value="supc" /></a>
										</s:if> <s:else>
											<s:property value="supc" />
										</s:else></td>
										
									<td><s:if test="%{productName==null}">NA</s:if> <s:else><s:property value="productName" /></s:else></td>
									<td><s:property value="offerPrice" /></td>
									<td><s:if test="%{newCM==null}">NA </s:if> <s:else><s:property value="newCM" /> </s:else></td>
									<td><s:if test="%{computedCmpu==null}">NA</s:if> <s:else><s:property value="computedCmpu" /></s:else></td>
									<td><s:property value="cmpu" /></td>
									<td><s:if test="%{transferPriceWithOverhead<0}">NA </s:if> <s:else> <s:property value="transferPriceWithOverhead" /></s:else></td>
									<td><s:if test="%{int_cb_v<0}">NA </s:if> <s:else> <s:property value="int_cb_v" /></s:else></td>
									<td><s:if test="%{cashback<0}">NA</s:if> <s:else> <s:property value="cashback" /></s:else></td>
									<td><s:if test="%{shipping_charges<0}">NA </s:if> <s:else> <s:property value="shipping_charges" /></s:else></td>
									<%-- <td><a href="viewSummary.action?groupID=<s:property  value="groupId"/>&applyCashback=false"><s:property value="count" /></a></td> --%>
									<td><s:property value="start_date" /></td>
									<td><s:property value="end_date" /></td>
									<td><s:property value="stateName" /></td>
									<td><s:property value="email" /></td>
									<td><s:property value="comment" /></td>
									<s:if test="session.subcatAccess=='approve' || session.adminPrivilege=='admin'">
										<td><s:if test="%{#session.subcategoryStatus==0}">

											</s:if> <s:else>
												<s:if test="rule_state == 0 || rule_state == 2">
													<span> <a
														href="viewSummary.action?ruleID=<s:property  value="ruleId"/>&applyCashback=approve&rule_state=

																				<s:property  value="rule_state"/>&rule_type=<s:property  value="rule_type"/>">
															<input type="button" class="btn btn-primary" name="Approve" value="Approve">
													</a>
													</span>
													<span> <a
														href="viewSummary.action?ruleID=<s:property  value="ruleId"/>&applyCashback=reject&rule_state=
																				<s:property  value="rule_state"/>&rule_type=<s:property  value="rule_type"/>">
															<input type="button" class="btn btn-primary" name="Reject" value="Reject">
													</a>
													</span>
												</s:if>
												<s:elseif test="rule_state == 1 || rule_state == 3">
													<span> <a class="btn btn-primary"
														href="viewSummary.action?ruleID=<s:property  value="ruleId"/>&applyCashback=Delete&rule_state=
																				<s:property  value="rule_state"/>&rule_type=<s:property  value="rule_type"/>"
														onclick="return ConfirmDelete();">Delete </a>
													</span>
												</s:elseif>
											</s:else></td>
									</s:if>
									<s:elseif test="session.subcatAccess=='write' ">
										<td><s:if test="%{#session.subcategoryStatus==0}">

											</s:if> <s:else>
												<s:if test="rule_state == 0 || rule_state == 2">
													<span> <a class="btn btn-primary"
														href="viewSummary.action?ruleID=<s:property  value="ruleId"/>&applyCashback=Delete&rule_state=
																				<s:property  value="rule_state"/>&rule_type=<s:property  value="rule_type"/>"
														onclick="return ConfirmDelete();">Delete </a>
													</span>
												</s:if>
												<s:elseif test="rule_state == 1 || rule_state == 3">
												</s:elseif>
											</s:else></td>
									</s:elseif>
									<s:else>
										<td></td>
									</s:else>
									</tr>
								</s:iterator>
							</tbody>
						</table>
					</div>
				</div>
				<br>
				<s:if test="session.subcatAccess=='approve' || session.adminPrivilege=='admin'">
					<input type="hidden" id="applyCashbackexception" name="applyCashback" value="approve">
					<s:if test="%{#session.subcategoryStatus!=0}">
						<center>
							<input type="button" id="approvalSubmit" class="btn btn-primary" onclick="exceptionProjectAction('1')" style="position: inherit;"
								value="Approve All" disabled="disabled"> <input type="button" id="rejectSubmit" class="btn btn-primary"
								onclick="exceptionProjectAction('0')" style="position: inherit;" value="Reject All" disabled="disabled">
						</center>
					</s:if>
				</s:if>
			</form>
		</div>
		<!-- BulkUpload Table -->
		<%-- <div class="bulkUpload selected_summary">
		<label>Scheduled CB</label>
			<form class="form" action="viewSummary.action" name="bulkUpload" method="POST">
				<div class="panel panel-default" style="border: none">
					<div class="panel-body no_pad">
						<div class="table-responsive">
							<table class="table table-bordered dataTable" id="dataTables-example">
								<thead>
									<tr>
										<s:if test="session.subcatAccess=='approve' || session.adminPrivilege=='admin'">
											<th style="text-align: center; padding: 4px;"><input name="mainToggle" type="checkbox" onClick="toggle(this,'bulkUpload')" /></th>
										</s:if>
										<th>Upload Id</th>
										<th>Added by</th>
										<th>Added on</th>
										<th>Vendor-SUPC Count</th>
										<th>Status</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody style="text-align: center;">
									<s:iterator value="%{#session.bulkUploadGroupLists}" var="group" status="counter">

										<s:if test="stateName == 'Approved'">
											<tr style="background: #D9EDF7" class='success'>
										</s:if>
										<s:else>
											<tr style="background: #fff" class='pending'>
										</s:else>
										<s:if test="session.subcatAccess=='approve' || session.adminPrivilege=='admin'">
											<s:if test="rule_state == 0">
												<td><input type="checkbox" name="bulkUpload" onclick="changesStatus(this)"
													value="<s:property  value='rule_state'/>##<s:property  value="rule_type"/>##<s:property  value="upload_id"/>"></td>
											</s:if>
											<s:else>
												<td></td>
											</s:else>
										</s:if>
										<td><s:property value="upload_id" /></td>
										<td><s:property value="added_by" /></td>
										<td><s:property value="added_on" /></td>
										<td><a href="viewSummary.action?groupID=<s:property  value="groupId"/>&applyCashback=false"><s:property value="count" /></a></td>
										<td><s:property value="stateName" /></td>
										<s:if test="session.subcatAccess=='approve' || session.adminPrivilege=='admin'">
											<td><s:if test="%{#session.subcategoryStatus==0}">
												</s:if> 
												<s:else>
													<s:if test="rule_state == 0">
														<span> <a
															href="viewSummary.action?ruleID=<s:property  value="upload_id"/>&applyCashback=approve&rule_state=
																				<s:property  value="rule_state"/>&rule_type=<s:property  value="rule_type"/>">
																<input type="button" class="btn btn-primary" name="Approve" value="Approve">
														</a>
														</span>
														<span> <a
															href="viewSummary.action?ruleID=<s:property  value="upload_id"/>&applyCashback=reject&rule_state=
																				<s:property  value="rule_state"/>&rule_type=<s:property  value="rule_type"/>">
																<input type="button" class="btn btn-primary" name="Reject" value="Reject">
														</a>
														</span>
													</s:if>
													<s:elseif test="rule_state == 1">
														<span> <a
															href="viewSummary.action?ruleID=<s:property  value="upload_id"/>&applyCashback=Delete&rule_state=
																				<s:property  value="rule_state"/>&rule_type=<s:property  value="rule_type"/>">
																<input type="button" class="btn btn-primary" name="Delete" value="Delete">
														</a>
														</span>
													</s:elseif>
												</s:else>
											</td>
										</s:if>
										<s:elseif test="session.subcatAccess=='write' ">
											<td><s:if test="%{#session.subcategoryStatus==0}">
												</s:if>
												 <s:else>
													<s:if test="rule_state == 0 || rule_state == 2">
														<span> <a
															href="viewSummary.action?ruleID=<s:property  value="upload_id"/>&applyCashback=Delete&rule_state=
																				<s:property  value="rule_state"/>&rule_type=<s:property  value="rule_type"/>">
																<input type="button" class="btn btn-primary" name="Delete" value="Delete">
														</a>
														</span>
													</s:if>
												</s:else></td>
										</s:elseif>
										<s:else>
											<td></td>
										</s:else>
										
									</s:iterator>
								</tbody>
							</table>
						</div>
						<!-- </div> -->
					</div>
				</div>
				<br>
				<s:if test="session.subcatAccess=='approve' || session.adminPrivilege=='admin'">
					<input type="hidden" id="applyCashbackbulkUpload" name="applyCashback" value="approve">
					<s:if test="%{#session.subcategoryStatus!=0}">
						<center>
							<input type="button" disabled id="approvalSubmit" class="btn btn-primary" onclick="projectAction('1')" style="position: inherit;"
								value="Approve All"> <input type="button" disabled id="rejectSubmit" class="btn btn-primary" onclick="projectAction('0')"
								style="position: inherit;" value="Reject All" disabled="disabled">
						</center>
					</s:if>
				</s:if>
			</form>
		</div> --%>


		<!-- brand table -->
		<div class="brand selected_summary">
			<label>Brands</label>
			<form action="viewSummary.action" name="brand" method="POST">
				<div class="panel panel-default">
					<div class="panel-body no_pad">
						<table class="table dataTable table-bordered table-hover" id="dataTables-example" style="text-align: center; border: 1px solid lightgray">
							<thead>
								<tr>
									<s:if test="session.subcatAccess=='approve' || session.adminPrivilege=='admin'">
										<th style="text-align: center; padding: 4px;"><input type="checkbox" onClick="toggle(this,'brand')" /></th>
									</s:if>
									<th>Group Name</th>
									<th>CM %</th>
									<th>GM %</th>
									<th>CMPU </th>
									<th>CompDiff(%)</th>
									<th>Max CompDiff(Rs.)</th>
									<th>NC CM%</th>
									<th>NC GM%</th>
									<th>NC CMPU</th>
									<th>Vendor-SUPC Count</th>
									<th>Start Time</th>
									<th>End Time</th>
									<th>Status</th>
									<th>Created by</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<s:iterator value="%{#session.brandGroupLists}" var="group" status="counter">
									<s:if test="stateName == 'Approved'">
										<tr style="background: #D9EDF7" class='success'>
									</s:if>
									<s:elseif test="stateName == 'Rejected'">
										<tr style="background: #F2DEDE" class='reject'>
									</s:elseif>
									<s:else>
										<tr style="background: #fff" class='pending'>
									</s:else>
									<s:if test="session.subcatAccess=='approve' || session.adminPrivilege=='admin'">
										<s:if test="rule_state == 0 || rule_state == 2">
											<td><input type="checkbox" name="brand" onclick="changesStatus(this)"
												value="<s:property  value='rule_state'/>##<s:property  value="rule_type"/>##<s:property  value="ruleId"/>"></td>
										</s:if>
										<s:else>
											<td>
												<!-- <input type="checkbox" name="asdgroupID" disabled="disabled"> -->
											</td>
										</s:else>
									</s:if>

									<td><s:if test="%{#session.subcategoryStatus==1}">
											<a
												href="viewSummary.action?ruleID=<s:property  value="ruleId"/>&applyCashback=edit&rule_type=
												<s:property  value="rule_type"/>"><s:property
													value="groupName" /></a>
										</s:if> <s:else>
											<s:property value="groupName" />
										</s:else></td>
									<td><s:property value="newCM" /></td>
									<td><s:property value="newGM" /></td>
									<td><s:property value="cmpu" /></td>
									<td><s:property value="newCompPer" /></td>
									<td><s:property value="newCompAbs" /></td>
									<td><s:property value="newNCCM" /></td>
									<td><s:property value="newNCGM" /></td>
									<td><s:property value="nccmpu" /></td>
									<td><a href="viewSummary.action?groupID=<s:property  value="groupId"/>&applyCashback=false"><s:property value="count" /></a></td>
									<td><s:property value="start_date" /></td>
									<td><s:property value="end_date" /></td>
									<td><s:property value="stateName" /></td>
									<td><s:property value="email" /></td>
									<s:if test="session.subcatAccess=='approve' || session.adminPrivilege=='admin'">
										<td><s:if test="%{#session.subcategoryStatus==0}">

											</s:if> <s:else>
												<s:if test="rule_state == 0 || rule_state == 2">
													<span> <a
														href="viewSummary.action?ruleID=<s:property  value="ruleId"/>&applyCashback=approve&rule_state=

																				<s:property  value="rule_state"/>&rule_type=<s:property  value="rule_type"/>">
															<input type="button" name="Approve" class="btn btn-primary" value="Approve">
													</a>
													</span>
													<span> <a
														href="viewSummary.action?ruleID=<s:property  value="ruleId"/>&applyCashback=reject&rule_state=
																				<s:property  value="rule_state"/>&rule_type=<s:property  value="rule_type"/>">
															<input type="button" class="btn btn-primary" name="Reject" value="Reject">
													</a>
													</span>
												</s:if>
												<s:elseif test="rule_state == 1 || rule_state == 3">
													<span> <a class="btn btn-primary"
														href="viewSummary.action?ruleID=<s:property  value="ruleId"/>&applyCashback=Delete&rule_state=
																				<s:property  value="rule_state"/>&rule_type=<s:property  value="rule_type"/>"
														onclick="return ConfirmDelete();">Delete </a>
													</span>
												</s:elseif>
											</s:else></td>
									</s:if>
									<s:elseif test="session.subcatAccess=='write' ">
										<td><s:if test="%{#session.subcategoryStatus==0}">

											</s:if> <s:else>
												<s:if test="rule_state == 0 || rule_state == 2">
													<span> <a class="btn btn-primary"
														href="viewSummary.action?ruleID=<s:property  value="ruleId"/>&applyCashback=Delete&rule_state=
																				<s:property  value="rule_state"/>&rule_type=<s:property  value="rule_type"/>"
														onclick="return ConfirmDelete();">Delete </a>
													</span>
												</s:if>
												<s:elseif test="rule_state == 1 || rule_state == 3">
													<%-- <span>
																	<a href="viewSummary.action?ruleID=<s:property  value="ruleId"/>&applyCashback=Delete&rule_state=
																				<s:property  value="rule_state"/>&rule_type=<s:property  value="rule_type"/>">	
																				<input type="button" name="Delete" value="Delete">
																	</a>
																</span> --%>
												</s:elseif>
											</s:else></td>
									</s:elseif>
									<s:else>
										<td></td>
									</s:else>
									</tr>
								</s:iterator>
							</tbody>
						</table>
					</div>
				</div>
				<br>
				<s:if test="session.subcatAccess=='approve' || session.adminPrivilege=='admin'">
					<input type="hidden" id="applyCashbackbrand" name="applyCashback" value="approve">
					<s:if test="%{#session.subcategoryStatus!=0}">
						<center>
							<input type="button" id="approvalSubmit" class="btn btn-primary" onclick="projectAction('1')" style="position: inherit;"
								value="Approve All" disabled="disabled"> <input type="button" id="rejectSubmit" class="btn btn-primary"
								onclick="projectAction('0')" style="position: inherit;" value="Reject All" disabled="disabled">
						</center>
					</s:if>

				</s:if>
			</form>
		</div>
		<!-- cluster table -->
		<div class="cluster selected_summary">
			<label>Cluster</label>
			<form action="viewSummary.action" name="cluster" method="POST">
				<div class="panel panel-default">
					<div class="panel-body no_pad">
						<table class="table dataTable table-bordered" id="dataTables-example"
							style="text-align: center; float: right; border: 1px solid lightgray">
							<thead>
								<tr>
									<s:if test="session.subcatAccess=='approve' || session.adminPrivilege=='admin'">
										<th style="text-align: center; padding: 4px;"><input type="checkbox" onClick="toggle(this,'cluster')" /></th>
									</s:if>
									<th>Group Name</th>
									<th>CM %</th>
									<th>GM %</th>
									<th>CMPU</th>
									<th>CompDiff(%)</th>
									<th>Max CompDiff(Rs.)</th>
									<th>NC CM%</th>
									<th>NC GM%</th>
									<th>NC CMPU</th>
									<th>Vendor-SUPC Count</th>
									<th>Start Time</th>
									<th>End Time</th>
									<th>Status</th>
									<th>Created by</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<s:iterator value="%{#session.clusterGroupLists}" var="group" status="counter">
									<s:if test="stateName == 'Approved'">
										<tr style="background: #D9EDF7" class='success'>
									</s:if>
									<s:elseif test="stateName == 'Rejected'">
										<tr style="background: #F2DEDE" class='reject'>
									</s:elseif>
									<s:else>
										<tr style="background: #fff" class='pending'>
									</s:else>
									<s:if test="session.subcatAccess=='approve' || session.adminPrivilege=='admin'">
										<s:if test="rule_state == 0 || rule_state == 2">
											<td><input type="checkbox" name="cluster" onclick="changesStatus(this)"
												value="<s:property  value='rule_state'/>##<s:property  value="rule_type"/>##<s:property  value="ruleId"/>"></td>
										</s:if>
										<s:else>
											<td>
												<!-- <input type="checkbox" name="asdgroupID" disabled="disabled"> -->
											</td>
										</s:else>
									</s:if>
									<td><s:if test="%{#session.subcategoryStatus==1}">
											<a
												href="viewSummary.action?ruleID=<s:property  value="ruleId"/>&applyCashback=edit&rule_type=
												<s:property  value="rule_type"/>"><s:property
													value="groupName" /></a>
										</s:if> <s:else>
											<s:property value="groupName" />
										</s:else></td>
									<td><s:property value="newCM" /></td>
									<td><s:property value="newGM" /></td>
									<td><s:property value="cmpu" /></td>
									<td><s:property value="newCompPer" /></td>
									<td><s:property value="newCompAbs" /></td>
									<td><s:property value="newNCCM" /></td>
									<td><s:property value="newNCGM" /></td>
									<td><s:property value="nccmpu" /></td>
									<td><a href="viewSummary.action?groupID=<s:property  value="groupId"/>&applyCashback=false"><s:property value="count" /></a></td>
									<td><s:property value="start_date" /></td>
									<td><s:property value="end_date" /></td>
									<td><s:property value="stateName" /></td>
									<td><s:property value="email" /></td>
									<s:if test="session.subcatAccess=='approve' || session.adminPrivilege=='admin'">
										<td><s:if test="%{#session.subcategoryStatus==0}">

											</s:if> <s:else>
												<s:if test="rule_state == 0 || rule_state == 2">
													<span> <a
														href="viewSummary.action?ruleID=<s:property  value="ruleId"/>&applyCashback=approve&rule_state=
																				<s:property  value="rule_state"/>&rule_type=<s:property  value="rule_type"/>">
															<input type="button" class="btn btn-primary" name="Approve" value="Approve">
													</a>
													</span>
													<span> <a
														href="viewSummary.action?ruleID=<s:property  value="ruleId"/>&applyCashback=reject&rule_state=
																				<s:property  value="rule_state"/>&rule_type=<s:property  value="rule_type"/>">
															<input type="button" class="btn btn-primary" name="Reject" value="Reject">
													</a>
													</span>
												</s:if>
												<s:elseif test="rule_state == 1 || rule_state == 3">
													<span> <a class="btn btn-primary"
														href="viewSummary.action?ruleID=<s:property  value="ruleId"/>&applyCashback=Delete&rule_state=
																				<s:property  value="rule_state"/>&rule_type=<s:property  value="rule_type"/>"
														onclick="return ConfirmDelete();">Delete </a>
													</span>
												</s:elseif>
											</s:else></td>
									</s:if>
									<s:elseif test="session.subcatAccess=='write' ">
										<td><s:if test="%{#session.subcategoryStatus==0}">

											</s:if> <s:else>
												<s:if test="rule_state == 0 || rule_state == 2">
													<span> <a class="btn btn-primary"
														href="viewSummary.action?ruleID=<s:property  value="ruleId"/>&applyCashback=Delete&rule_state=
																				<s:property  value="rule_state"/>&rule_type=<s:property  value="rule_type"/>"
														onclick="return ConfirmDelete();">Delete </a>
													</span>
												</s:if>
												<s:elseif test="rule_state == 1 || rule_state == 3">
												</s:elseif>
											</s:else></td>
									</s:elseif>
									<s:else>
										<td></td>
									</s:else>
									</tr>
								</s:iterator>
							</tbody>
						</table>
					</div>
				</div>
				<br>
				<s:if test="session.subcatAccess=='approve' || session.adminPrivilege=='admin'">
					<input type="hidden" id="applyCashbackcluster" name="applyCashback" value="approve">
					<s:if test="%{#session.subcategoryStatus!=0}">
						<center>
							<input type="button" id="approvalSubmit" class="btn btn-primary" onclick="projectAction('1')" style="position: inherit;"
								value="Approve All" disabled="disabled"> <input type="button" id="rejectSubmit" class="btn btn-primary"
								onclick="projectAction('0')" style="position: inherit;" value="Reject All" disabled="disabled">
						</center>
					</s:if>
				</s:if>

			</form>
		</div>
		<!-- Subcategory table -->
		<div class="subcategory selected_summary">
			<label>Subcategory</label>
			<form action="viewSummary.action" name="subcategory" method="POST">
				<div class="panel panel-default">
					<div class="panel-body no_pad">
						<table class="table table-striped table-bordered" id="dataTables-example" style="text-align: center; border: 1px solid lightgray">
							<thead>
								<tr>
									<s:if test="session.subcatAccess=='approve' || session.adminPrivilege=='admin'">
										<th style="text-align: center; padding: 4px;"><input type="checkbox" onClick="toggle(this,'subcategory')" /></th>
									</s:if>
									<th>Group Name</th>
									<th>CM %</th>
									<th>GM %</th>
									<th>CMPU</th>
									<th>CompDiff(%)</th>
									<th>Max CompDiff(Rs.)</th>
									<th>NC CM%</th>
									<th>NC GM%</th>
									<th>NC CMPU </th>
									<th>Vendor-SUPC Count</th>
									<th>Start Time</th>
									<th>End Time</th>
									<th>Status</th>
									<th>Created by</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<s:iterator value="%{#session.subcategoryGroupLists}" var="group" status="counter">
									<s:if test="stateName == 'Approved'">
										<tr style="background: #D9EDF7" class='success'>
									</s:if>
									<s:elseif test="stateName == 'Rejected'">
										<tr style="background: #F2DEDE" class='reject'>
									</s:elseif>
									<s:else>
										<tr style="background: #fff" class='pending'>
									</s:else>
									<s:if test="session.subcatAccess=='approve' || session.adminPrivilege=='admin'">
										<s:if test="rule_state == 0 || rule_state == 2">
											<td><input type="checkbox" name="subcategory" onclick="changesStatus(this)"
												value="<s:property  value='rule_state'/>##<s:property  value="rule_type"/>##<s:property  value="ruleId"/>"></td>
										</s:if>
										<s:else>
											<td>
												<!-- <input type="checkbox" name="asdgroupID" disabled="disabled"> -->
											</td>
										</s:else>
									</s:if>
									<td><s:if test="%{#session.subcategoryStatus==1}">
											<a
												href="viewSummary.action?ruleID=<s:property  value="ruleId"/>&applyCashback=edit&rule_type=
												<s:property  value="rule_type"/>"><s:property
													value="groupName" /></a>
										</s:if> <s:else>
											<s:property value="groupName" />
										</s:else></td>
									<td><s:property value="newCM" /></td>
									<td><s:property value="newGM" /></td>
									<td><s:property value="cmpu"/> </td>
									<td><s:property value="newCompPer" /></td>
									<td><s:property value="newCompAbs" /></td>
									<td><s:property value="newNCCM" /></td>
									<td><s:property value="newNCGM" /></td>
									<td><s:property value="nccmpu" /></td>
									<td><a href="viewSummary.action?groupID=<s:property  value="groupId"/>&applyCashback=false"><s:property value="count" /></a></td>
									<td><s:property value="start_date" /></td>
									<td><s:property value="end_date" /></td>
									<td><s:property value="stateName" /></td>
									<td><s:property value="email" /></td>
									<s:if test="session.subcatAccess=='approve' || session.adminPrivilege=='admin'">
										<td><s:if test="%{#session.subcategoryStatus==0}">

											</s:if> <s:else>
												<s:if test="rule_state == 0 || rule_state == 2">
													<span> <a
														href="viewSummary.action?ruleID=<s:property  value="ruleId"/>&applyCashback=approve&rule_state=

																				<s:property  value="rule_state"/>&rule_type=<s:property  value="rule_type"/>">
															<input type="button" class="btn btn-primary" name="Approve" value="Approve">
													</a>
													</span>
													<span> <a
														href="viewSummary.action?ruleID=<s:property  value="ruleId"/>&applyCashback=reject&rule_state=
																				<s:property  value="rule_state"/>&rule_type=<s:property  value="rule_type"/>">
															<input type="button" class="btn btn-primary" name="Reject" value="Reject">
													</a>
													</span>
												</s:if>
												<s:elseif test="rule_state == 1 || rule_state == 3">
													<span> <a class="btn btn-primary"
														href="viewSummary.action?ruleID=<s:property  value="ruleId"/>&applyCashback=Delete&rule_state=
																				<s:property  value="rule_state"/>&rule_type=<s:property  value="rule_type"/>"
														onclick="return ConfirmDelete();">Delete </a>
													</span>
												</s:elseif>
											</s:else></td>
									</s:if>
									<s:elseif test="session.subcatAccess=='write' ">
										<td><s:if test="%{#session.subcategoryStatus==0}">
											</s:if> <s:else>
												<s:if test="rule_state == 0 || rule_state == 2">
													<span> <a class="btn btn-primary"
														href="viewSummary.action?ruleID=<s:property  value="ruleId"/>&applyCashback=Delete&rule_state=
																				<s:property  value="rule_state"/>&rule_type=<s:property  value="rule_type"/>"
														onclick="return ConfirmDelete();">Delete </a>
													</span>
												</s:if>
												<s:elseif test="rule_state == 1 || rule_state == 3">
												</s:elseif>
											</s:else></td>
									</s:elseif>
									<s:else>
										<td></td>
									</s:else>
									</tr>
								</s:iterator>
							</tbody>
						</table>
					</div>
				</div>
				<br>
				<s:if test="session.subcatAccess=='approve' || session.adminPrivilege=='admin'">
					<input type="hidden" id="applyCashbacksubcategory" name="applyCashback">
					<s:if test="%{#session.subcategoryStatus!=0}">
						<center>
							<input type="button" id="approvalSubmit" class="btn btn-primary" onclick="projectAction('1')" style="position: inherit;"
								value="Approve All" disabled="disabled"> <input type="button" id="rejectSubmit" class="btn btn-primary"
								onclick="projectAction('0')" style="position: inherit;" value="Reject All" disabled="disabled">
						</center>
					</s:if>
				</s:if>
			</form>
		</div>
		
		<div class="pa selected_summary">
			<label>PA Rules</label>
				<table class="table table-striped table-bordered" id="dataTables-example" style="text-align: center; border: 1px solid lightgray">
					<thead>
						<tr>
							<th>Rule Name</th>
							<th>SUPC-Vendor Count</th>
							<th>Updated Time</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="%{#session.paRulesLists}" var="group" status="counter">
							<s:if test="stateName == 'Analytics_Discount_Grid'">
							<tr>
								<td><a href="exceptions/priceAnalyticsConfView.action">Brand Discounting Model</a>
								<td><a href="viewSummary.action?pa=Analytics_Discount_Grid"><s:property value="count" /></a></td>
								<td><s:property value="added_on" /></td>
							</tr>
							</s:if>
							<s:if test="stateName == 'Analytics_MVPE_GSV'">
							<tr>
								<td><a href="exceptions/priceAnalyticsConfView.action">MultiVariate Model</a>
								<td><a href="viewSummary.action?pa=Analytics_MVPE_GSV"><s:property value="count" /></a></td>
								<td><s:property value="added_on" /></td>
							</tr>
							</s:if>
						</s:iterator>
					</tbody>	
				</table>
			
		</div>


		<script type="text/javascript">
			function selectRuleType() {
				clearCheckBox();
				mainToggle = document.getElementsByName('mainToggle');
				if ((mainToggle[0] != null && mainToggle[0] != undefined && mainToggle[0] != 'undefined')
						&& !(typeof (mainToggle[0]) == "undefined")
						&& !(typeof (mainToggle[0]) == 'undefined')) {
					mainToggle[0].checked = false;
				}
				var ruleType = $("#selectRule").val();
				
				if (ruleType.toLowerCase() == 'cluster') {
					$(".cluster").show();
					$(".brand").hide();
					$(".subcategory").hide();
					$(".exception").hide();
					$(".all").hide();
					$(".ocp").hide();
					$(".pa").hide();
					

				} else if (ruleType.toLowerCase() == 'brand') {
					$(".cluster").hide();
					$(".brand").show();
					$(".subcategory").hide();
					$(".exception").hide();
					$(".all").hide();
					$(".ocp").hide();
					$(".pa").hide();
					
				} else if (ruleType.toLowerCase() == 'exception') {
					$(".cluster").hide();
					$(".brand").hide();
					$(".subcategory").hide();
					$(".exception").show();
					$(".all").hide();
					$(".ocp").hide();
					$(".pa").hide();
					
				} else if (ruleType.toLowerCase() == 'subcategory') {
					$(".cluster").hide();
					$(".brand").hide();
					$(".subcategory").show();
					$(".exception").hide();
					$(".all").hide();
					$(".ocp").hide();
					$(".pa").hide();
					
				}  else if (ruleType.toLowerCase() == 'all') {
					$(".cluster").hide();
					$(".brand").hide();
					$(".subcategory").hide();
					$(".exception").show();
					$(".all").show();
					$(".ocp").show();
					$(".pa").show();
					
				} else if (ruleType.toLowerCase() == 'ocp') {
					$(".cluster").hide();
					$(".brand").hide();
					$(".subcategory").hide();
					$(".exception").hide();
					$(".all").hide();
					$(".ocp").show();
					$(".pa").hide();
					
				}else if (ruleType.toLowerCase() == 'pa'){
					$(".cluster").hide();
					$(".brand").hide();
					$(".subcategory").hide();
					$(".exception").hide();
					$(".all").hide();
					$(".ocp").hide();
					$(".pa").show();
				}
				else {
					$(".cluster").hide();
					$(".brand").hide();
					$(".subcategory").hide();
					$(".exception").show();
					$(".all").show();
					$(".ocp").show();
					$(".pa").show();
					
				}
			}
			function toggle(source, type) {
				clearCheckBox();
				checkboxes = document.getElementsByName(type);

				for (var i = 0, n = checkboxes.length; i < n; i++) {
					checkboxes[i].checked = source.checked;

				}
				document.getElementById("approvalSubmit").disabled = false;
				document.getElementById("rejectSubmit").disabled = false;
				for (var i = 0, n = checkboxes.length; i < n; i++) {
					if (checkboxes[i].checked == true) {
						document.getElementById("approvalSubmit").disabled = false;
						document.getElementById("rejectSubmit").disabled = false;
					}
				}
			}

			function clearCheckBox() {
				exceptionCheckboxes = document.getElementsByName('exception');
				brandCheckboxes = document.getElementsByName('brand');
				clusterCheckboxes = document.getElementsByName('cluster');
				subcategoryCheckboxes = document.getElementsByName('subcategory');
				allCheckboxes = document.getElementsByName('all');
				ocpCheckboxes = document.getElementsByName('ocp'); 
				for (var i = 0, n = exceptionCheckboxes.length; i < n; i++) {
					exceptionCheckboxes[i].checked = false;
				}
				for (var i = 0, n = brandCheckboxes.length; i < n; i++) {
					brandCheckboxes[i].checked = false;
				}
				for (var i = 0, n = clusterCheckboxes.length; i < n; i++) {
					clusterCheckboxes[i].checked = false;
				}
				for (var i = 0, n = subcategoryCheckboxes.length; i < n; i++) {
					subcategoryCheckboxes[i].checked = false;
				}
				for (var i = 0, n = allCheckboxes.length; i < n; i++) {
					allCheckboxes[i].checked = false;
				}
				for (var i = 0, n = ocpCheckboxes.length; i < n; i++) {
					ocpCheckboxes[i].checked = false;
				} 

			}

			function changesStatus() {
				document.getElementById("approvalSubmit").disabled = false;
				document.getElementById("rejectSubmit").disabled = false;
				exceptionCheckboxes = document.getElementsByName('exception');
				brandCheckboxes = document.getElementsByName('brand');
				clusterCheckboxes = document.getElementsByName('cluster');
				subcategoryCheckboxes = document.getElementsByName('subcategory');
				ocpCheckboxes = document.getElementsByName('ocp');
				
				for (var i = 0, n = exceptionCheckboxes.length; i < n; i++) {
					if (exceptionCheckboxes[i].checked == true) {
						document.getElementById("approvalSubmit").disabled = false;
						document.getElementById("rejectSubmit").disabled = false;
					}
				}
				for (var i = 0, n = brandCheckboxes.length; i < n; i++) {
					if (brandCheckboxes[i].checked == true) {
						document.getElementById("approvalSubmit").disabled = false;
						document.getElementById("rejectSubmit").disabled = false;
					}
				}
				for (var i = 0, n = clusterCheckboxes.length; i < n; i++) {
					if (clusterCheckboxes[i].checked == true) {
						document.getElementById("approvalSubmit").disabled = false;
						document.getElementById("rejectSubmit").disabled = false;
					}
				}
				for (var i = 0, n = subcategoryCheckboxes.length; i < n; i++) {
					if (subcategoryCheckboxes[i].checked == true) {
						document.getElementById("approvalSubmit").disabled = false;
						document.getElementById("rejectSubmit").disabled = false;
					}
				}
				 for (var i = 0, n = ocpCheckboxes.length; i < n; i++) {
					if (ocpCheckboxes[i].checked == true) {
						document.getElementById("approvalSubmit").disabled = false;
						document.getElementById("rejectSubmit").disabled = false;
					}
				} 
			}
			function projectAction(action) {

				var formType = $("#selectRule").val();
				console.log("formType" + formType);
				if (action == "1") {
					document.getElementById("applyCashback" + formType).value = "approve";
					console.log(document.getElementById("applyCashback"+ formType).value);
					document.forms[formType].submit();

				} else {
					document.getElementById("applyCashback" + formType).value = "reject";
					console.log(document.getElementById("applyCashback"+ formType).value);
					document.forms[formType].submit();
				}
			}

			function exceptionProjectAction(action) {
				var formType = $("#selectRule").val();
				if (formType == 'all') {
					if (action == "1") {
						document.getElementById("applyCashbackexception").value = "approve";
						console.log(document.getElementById("applyCashbackexception").value);
						document.forms["exception"].submit();

					} else {
						document.getElementById("applyCashbackexception").value = "reject";
						console.log(document.getElementById("applyCashbackexception").value);
						document.forms["exception"].submit();
					}

				}else {
					projectAction(action);
				}
			}
			
			function ocpProjectAction(action) {
				var formType = $("#selectRule").val();
				if (formType == 'all') {
					if (action == "1") {
						document.getElementById("applyCashbackocp").value = "approve";
						console.log(document.getElementById("applyCashbackocp").value);
						document.forms["ocp"].submit();

					} else {
						document.getElementById("applyCashbackocp").value = "reject";
						console.log(document.getElementById("applyCashbackocp").value);
						document.forms["ocp"].submit();
					}

				}else {
					projectAction(action);
				}
			}
		</script>
	</div>
</body>
</html>
