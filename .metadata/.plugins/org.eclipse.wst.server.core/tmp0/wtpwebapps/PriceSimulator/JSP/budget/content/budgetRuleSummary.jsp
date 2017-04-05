<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/bootstrap.min.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/content/rules/homepage.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/buttons.css" media="screen" />
<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/loader.css" media="screen" />
<link href="/PriceSimulator/CSS/content/summary/metisMenu.min.css" rel="stylesheet" />

<script src="/PriceSimulator/JS/utility/jquery-1.12.0.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/PriceSimulator/JS/utility/bootstrap.min.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/utility/loader.js"></script>

</head>
<body>
<div class="well well-sm">
<br><div style="text-align: center;"><h3><span>Monetization Budget Summary</span></h3></div><br>
<div class="all selected_summary">
			<form class="form" action="viewSummary.action" name="all" method="POST">
				<div class="panel panel-default" >
					<div class="panel-body no_pad" style="overflow-x:auto">
						<!-- <div class="dataTable_wrapper"> -->
						<div class="table-responsive">
							<table class="table table-bordered dataTable" id="dataTables-example">
								<thead>
									<tr>
										<th>Rule Id</th>
										<th>Rule Name</th>
										<th>Rule Type</th>
										<th>Budget</th>
										<th>Start Date</th>
										<th>End Date</th>
										<th>Status</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<s:iterator value="%{#session.budgetRules}" var="group" status="counter">
									<tr>
										<td><a href="createBudgetRule.action?ruleId=<s:property  value="id"/>&ruleType=<s:property  value="ruleType"/>&userAction=view">
													<s:property value="id" />
												</a></td>
										<td><a href="createBudgetRule.action?ruleId=<s:property  value="id"/>&ruleType=<s:property  value="ruleType"/>&userAction=view">
													<s:property value="name" />
												</a></td>
										<td><s:property value="ruleType" /></td>
										<td><s:property value="budget" /></td>
										<td><s:date name="startTime.toDate()" format="yyyy-MM-dd HH:mm:ss"/></td> 
										<td><s:date name="endTime.toDate()" format="yyyy-MM-dd HH:mm:ss"/></td> 
										
										<s:if test="status == 1 || status == 5">
											<td>Pending for approval.</td>
											<td>
											<s:if test="%{#session.mtzBudgetPrivilege == 'approve'}">
											<a href="budgetRuleSummary.action?userAction=approve&ruleId=<s:property  value="id"/>"><span class="glyphicon glyphicon-thumbs-up"> </span></a>
											</s:if>
											&nbsp;&nbsp;&nbsp;
											<s:if test="%{#session.mtzBudgetPrivilege == 'write'}">
											<a href="budgetRuleSummary.action?userAction=delete&ruleId=<s:property  value="id"/>"><span onclick="return confirmDelete();" class="glyphicon glyphicon-remove"></span></a></td>
											</s:if>
										</s:if>
										<s:if test="status == 3">
											<td>Approved.</td>
											<td>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<s:if test="%{#session.mtzBudgetPrivilege == 'write'}">
											<a href="budgetRuleSummary.action?userAction=delete&ruleId=<s:property  value="id"/>"><span onclick="return confirmDelete();" class="glyphicon glyphicon-remove"></span></a></td>
											</s:if>
										</s:if>
										<s:if test="status == 7">
											<td>Running.</td>
											<td>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<s:if test="%{#session.mtzBudgetPrivilege == 'write'}">
											<a href="budgetRuleSummary.action?userAction=delete&ruleId=<s:property  value="id"/>"><span onclick="return confirmDelete();" class="glyphicon glyphicon-remove"></span></a></td>
											</s:if>
										</s:if>
									</tr>
									</s:iterator>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>

<script type="text/javascript">

	function confirmDelete()
	{
	  var x = confirm("Are you sure you want to delete?");
	  if (x)
	      return true;
	  else
	    return false;
	}
	</script>