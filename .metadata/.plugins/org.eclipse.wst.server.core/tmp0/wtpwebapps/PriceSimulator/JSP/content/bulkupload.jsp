<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link type="text/css" rel="stylesheet"
	href="/PriceSimulator/CSS/utility/bootstrap.min.css" media="screen" />
<link type="text/css" rel="stylesheet"
	href="/PriceSimulator/CSS/utility/bootstrap-datetimepicker.min.css"
	media="screen" />
<link type="text/css" rel="stylesheet"
	href="/PriceSimulator/CSS/utility/buttons.css" media="screen" />
<link type="text/css" rel="stylesheet"
	href="/PriceSimulator/CSS/utility/loader.css" media="screen" />


<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600'
	rel='stylesheet' type='text/css'>
<link href="/PriceSimulator/CSS/content/bulkUpload/style.css"
	type="text/css" rel="stylesheet">


<script type="text/javascript"
	src="/PriceSimulator/JS/utility/jquery-1.12.0.min.js"></script>
<script type="text/javascript"
	src="/PriceSimulator/JS/utility/loader.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $.ajax(
            {
                type : "GET",
                dataType: 'html',
                url : '/PriceSimulator/ajax/bulkUploadFilesListing.action',
                success : function(data)
                {
                    if(data != -1)
                    {    if(data== 0){
                        var temp =" <select id='fileList' name='fileList'>";
                        temp = temp +"<option value='-1' selected='selected'>New File</option>";
                        temp=temp + "</select>"
                        $("th.fileList").append(temp);
                        $("div.load").html("");
                       
                    }else{
                        var list= data.split(";");
                        var temp =" <select id='fileList' name='fileList'>";
                        temp = temp +"<option value='-1' selected='selected'>New File</option>";

                        $.each(list, function(idx, obj)
                        {
                            temp = temp + "<option value='" +obj.split(",")[0]+ "'>" +obj.split(",")[0]+ "</option>";
                        });
                        temp=temp + "</select>"
                        $("th.fileList").append(temp);
                        $("div.load").html("");
                    }
                    }
                    else
                    {
                        $("div.load").html("Internal Error");
                    }
                }
            });
});

</script>
<script type="text/javascript"
	src="/PriceSimulator/JS/utility/bootstrap.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.5.1/moment.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.4.0/lang/en-gb.js"></script>
<script type="text/javascript"
	src="/PriceSimulator/JS/utility/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript"
	src="/PriceSimulator/JS/content/bulkUpload.js"></script>

</head>
<body>

	<h4
		style="padding: 10px 0; border-top: 1px solid #efefef; border-bottom: 1px solid #efefef; margin-bottom: 20px; margin-left: 2%; margin-top: 5%; width: 95%;">
		<b>Bulk Upload </b>
	</h4>

	<form method="post" style="margin-left: 10%;"
		action="/PriceSimulator/ajax/bulkUpload.action"
		enctype="multipart/form-data">
		<table>
			<th class="fileList" id="fileList"
				style="position: relative; top: -13px"></th>
			<th>&nbsp;&nbsp;&nbsp;&nbsp; <input type="file" name="file"
				class="btn btn-primary browse" style="display: inline; width: 250px"
				accept=".csv" /> <input type="submit" style="display: inline"
				class="savetemp btn btn-primary " value="Upload" /> &nbsp;&nbsp; <a
				href="/PriceSimulator/Temp/bulkUpload_sample.csv"> Download
					Template</a> <br> <br> <label style="text-align: center;">
					<s:property value="%{#session.bulkUploadStatus}" />
			</label>
			</th>
		</table>
	</form>
	<form method="get" style="margin-left: 10%"
		action="/PriceSimulator/ajax/bulkUpload.action">
		<table>
			<th><input type="text" id="bulkSearchString" name="searchString"
				class="form-control" style="display: inline; width: 250px"
				placeholder="Enter uploadid for search"
				value="<s:property value="searchString" />" />
				<button type="button" class="btn btn-primary"
					onclick="resetSearch();">Reset</button> <input type="submit"
				style="display: inline" class="savetemp btn btn-primary "
				value="Search" /> &nbsp;&nbsp;</th>
		</table>
	</form>
	<br>
	<form method="post" action="bulkUpload.action" name="bulkUploadForm">
		<div class="row" style="width: 100%; margin-left: 1%; border: none;">
			<div
				style="background-color: none; margin-right: 1%; padding-left: 10px;">
				<div class="panel panel-default">
					<div class="" style="overflow-x: scroll; padding: 0; width: 100%">
						<table style="overflow: auto; padding: 0; color: grey"
							class="productrules table table-bordered dataTable text-center"
							id="bootstrap-table">
							<thead>
								<tr>
									<th style="text-align: center;">Upload Id</th>
									<th style="text-align: center;">File Name</th>
									<th style="text-align: center;">Uploader</th>
									<th style="text-align: center;">Successful</th>
									<th style="text-align: center;">Failed</th>
									<th style="text-align: center;">Overwritten</th>
									<th style="text-align: center;">Total</th>
									<th style="text-align: center;">Status</th>
									<!-- <th style="text-align: center;">Approval</th> -->
									<th style="text-align: center;">Action</th>

								</tr>
							</thead>
							<s:iterator value="getBulkUploadDetails()" var="group"
								status="counter">
								<tr style="text-align: center;">
									<td><s:property value="uploadId" /></td>
									<td><s:property value="fileName" /></td>
									<td><s:property value="uploader" /></td>
									<td><a
										href="bulkUpload.action?ruleID=<s:property  value="uploadId"/>&applyCashback=downloadSuccess"><s:property
												value="successSupcVenderCount" /></a></td>
									<td><a
										href="bulkUpload.action?ruleID=<s:property  value="uploadId"/>&applyCashback=downloadFailure"><s:property
												value="failureSupcVendorCount" /></a></td>
									<td><a
										href="bulkUpload.action?ruleID=<s:property  value="uploadId"/>&applyCashback=downloadOverwrite"><s:property
												value="overwriteSupcVendorCount" /></a></td>
									<td><a
										href="bulkUpload.action?ruleID=<s:property  value="uploadId"/>&applyCashback=downloadAll"><s:property
												value="totalSupcVendorCount" /></a></td>
									<td><s:if test="sheetState == 0">
											<label>Uploading : InProgress</label>
										</s:if> <s:else>
											<s:property value="state" />
										</s:else></td>

									<s:if test="sheetState == 0">
										<td><label>Uploading : InProgress</label></td>
									</s:if>

									<s:else>
										<s:if test="ruleState == 0 ">
											<td style="padding: 10px;"><s:if test="session.adminPrivilege=='admin' ">
													<a
														href="bulkUpload.action?ruleID=<s:property  value="uploadId"/>&&applyCashback=approve"
														data-toggle="tooltip" title="Approve"> <span
														class="glyphicon glyphicon-thumbs-up"> </span>
													</a>
												</s:if> <s:else>
													<s:if test="getOverwriteSupcVendorCount() <= 0 ">
													<span> <a
																href="bulkUpload.action?ruleID=<s:property  value="uploadId"/>&applyCashback=Submit">
																	<input type="button" class="btn btn-primary"
																	name="Submit" value="Submit">
															</a>
														</span>
													</s:if>
												</s:else> &nbsp;&nbsp;<a
												href="bulkUpload.action?ruleID=<s:property  value="uploadId"/>&&applyCashback=Delete"
												data-toggle="tooltip" title="Delete"
												onclick="return ConfirmDelete()"> <span
													class="glyphicon glyphicon-remove"></span>
											</a></td>
										</s:if>
										<s:else>
											<s:if test="ruleState == 2">
												<s:if
													test="session.subcatPermission== 'approve' || session.adminPrivilege=='admin'">
													<td style="padding: 10px;"><a
														href="bulkUpload.action?ruleID=<s:property  value="uploadId"/>&&applyCashback=Delete"
														data-toggle="tooltip" title="Delete"
														onclick="return ConfirmDelete()"> <span
															class="glyphicon glyphicon-remove"></span></td>
												</s:if>
												<s:else>
													<td style="padding: 10px;">&nbsp;&nbsp;<a
														href="bulkUpload.action?ruleID=<s:property  value="uploadId"/>&&applyCashback=Delete"
														data-toggle="tooltip" title="Delete" 
														onclick="return ConfirmDelete()"> <span
															class="glyphicon glyphicon-remove"></span>
													</a></td>
												</s:else>
											</s:if>
											<s:else>
												<td style="padding: 10px;">&nbsp;&nbsp;<a
													href="bulkUpload.action?ruleID=<s:property  value="uploadId"/>&&applyCashback=Delete"
													data-toggle="tooltip" title="Delete"
													onclick="return ConfirmDelete()"> <span
														class="glyphicon glyphicon-remove"></span>
												</a></td>
											</s:else>

										</s:else>
									</s:else>
								</tr>
							</s:iterator>

						</table>
					</div>
				</div>
			</div>
		</div>

		<%-- <input type="hidden" id="actionType" name="actionType" value="penalty"> <input type="hidden" id="penaltyDays" name="penaltyDays">
                    <input type="hidden" name="spChangeFrom" value="<s:property value="getSpChangeFrom()"/>"> <input type="hidden" name="spChangeTo"
                        value="<s:property value="getSpChangeTo()"/>"> <input type="hidden" name="startTime" value="<s:property value="getStartTime()"/>">
                    <input type="hidden" name="endTime" value="<s:property value="getEndTime()"/>">  --%>
		<input type="hidden" name="pageNo"
			value="<s:property value="getPageNo()"/>">
		<div style="margin-left: 50%">
			<s:if test="getPageNo()>1">
				<input type="button" class="btn btn-primary action updatesubcat"
					id="previousPage" name="Page" value="<<="
					onclick="movePage('previous' ,<s:property value='getPageNo()'/>)">
			</s:if>
			<label>Page No. <s:property value='getPageNo()' /></label>
			<s:if test="getLastPage()=='false'">
				<input type="button" class="btn btn-primary action updatesubcat"
					id="nextPage" name="Page" value="=>>"
					onclick="movePage('next',<s:property value='getPageNo()'/>)">
			</s:if>
		</div>
		<br>
		<div class="report11" style="margin-left: 10px">
			<div class="bar"></div>
		</div>
	</form>
	<input type="hidden" id="pageNo">
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"
		type="text/javascript"></script>
	<script
		src="/PriceSimulator/JS/content/sellerManagement/bootstrap.min.js"
		type="text/javascript"></script>
	<%-- <script src="/PriceSimulator/JS/content/sellerManagement/jquery.sortelements.js" type="text/javascript"></script> --%>
	<script src="/PriceSimulator/JS/content/sellerManagement/jquery.bdt.js"
		type="text/javascript"></script>


</body>
</body>
</html>