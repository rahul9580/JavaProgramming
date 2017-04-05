<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function f( rownum ) {
	return (document.getElementById("dataTables-example").rows[rownum-1].cells[4].innerHTML) ;
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/content/rules/homepage.css" media="screen" />
	<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/content/utility/buttons.css" media="screen" />
	<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/content/utility/loader.css" media="screen" />


<script src="/PriceSimulator/JS/content/utility/jquery-1.12.0.js"
	type="text/javascript"></script>
<script type="text/javascript" src="/PriceSimulator/JS/utility/loader.js"></script>
<link href="/PriceSimulator/CSS/content/utility/bootstrap.min.css"
	rel="stylesheet">

<script type="text/javascript"
	src="/PriceSimulator/JS/content/utility/bootstrap.min.js"></script>
<script type="text/javascript" src="/PriceSimulator/JS/content/subcatFreq.js"></script>
<!-- Bootstrap Core CSS -->

<!-- <link	href="/PS/ui/groupspage/bootstrap/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
 -->


<!-- MetisMenu CSS -->
<link href="/PriceSimulator/CSS/content/summary/metisMenu.min.css" rel="stylesheet" />

<!-- DataTables CSS -->
<link
	href="/PriceSimulator/CSS/content/summary/dataTables.bootstrap.css"	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="/PriceSimulator/CSS/content/summary/dataTables.responsive.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/PriceSimulator/CSS/content/summary/sb-admin-2.css"	rel="stylesheet">

<!-- Custom Fonts -->
<link href="/PriceSimulator/CSS/content/summary/font-awesome.min.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
$(function () {
	
	$(".run").click(function(){
		myRowIndex = $(this).parent().parent().index() + 1;
		   /* myColIndex = $(this).parent().parent().attr(".two");*/
			var table = document.getElementById("dataTables-example");
		    table.rows [ myRowIndex ].cells [ 1 ].innerHTML = table.rows [ myRowIndex ].cells [ 1 ].innerHTML.trim() ;
		    var link ="runFreq.action?subcatID=" + table.rows [ myRowIndex ].cells [ 1 ].innerHTML.trim()+"&source='"+table.rows [ myRowIndex ].cells [ 5 ].innerHTML.trim()+"'&filter='"+table.rows [ myRowIndex ].cells [ 3 ].innerHTML.trim()+"'&critical="+table.rows [ myRowIndex ].cells [ 13 ].innerHTML.trim();
		    alert (link) ;
		    $(".run").attr("href", link);
	});
	$(document).on('click',".update",function(){
		myRowIndex = $(this).parent().parent().index() + 1;
		   /* myColIndex = $(this).parent().parent().attr(".two");*/
			var table = document.getElementById("dataTables-example");
		    var parameter = ["subcatID","subcatname","filter","count","source","enabled","server","priorty","status","exec_time","last_completed","updated","critical"];
		    var link ="updateFreq.action?" ;
		    for (var i = 1 ; i < table.rows [ myRowIndex ].cells.length - 1 ; i++ ) {
		    	var str =  table.rows [ myRowIndex ].cells [ i ].innerHTML;
		    	str = str.trim() ;
		    	//str = str.substring(0, str.indexOf("<br>")) ;
		    	console.log (link) ;
		    	if ( i == 1 ) {
		    		link = link + parameter [ i - 1 ] + "=" + str ;
		    	}
		    	else if ( i === 4 ) {
		    		if (isNaN(str) || str.length === 0){
		    			alert ("Count should be a number!!") ;
		    			return ;
		    		}
		    		link = link + "&" + parameter [ i - 1 ] + "=" + str ;
		    	}
		    	else if ( i === 6 ) {
		    		if ( isNaN (str) || str.length === 0) {
		    			alert ("Enabled should be a number!!!") ;
		    			return ;
		    		}
		    		var k = parseInt (str) ;
		    		if ( k < 0 || k > 1 ) {
		    			alert ("Enabled can take only 0 and 1!!!") ;
		    			return ;
		    		}
		    		link = link + "&" + parameter [ i - 1 ] + "=" + str ;
		    	}
		    	else if ( i === 8 ) {
		    		if (isNaN (str) || str.length === 0) {
		    			alert ("Priority should be a number!!!") ;
		    		}
		    		var k = parseInt (str) ;
		    		if ( (k < 0 || k > 27) && !(k&1) ) {
		    			alert ("Wrong Priority Value!!!") ;
		    			return ;
		    		}
		    		link = link + "&" + parameter [ i - 1 ] + "=" + str ;
		    	}
		    	else if (i === 10 || i === 11 || i === 12) {
		    		var k = (str.length === 0 || !str.localeCompare('0000-00-00 00:00:00') ) ? 'null':str;
		    		link = link + "&" + parameter [ i - 1 ] + "=" + k;
		    	}
		
		    	else {
		    		link = link + "&" + parameter [ i - 1 ] + "=" + str ;
		    	}
		    }
		    $(".update").attr("href", link);
	});
	$(document).on('click',".addtodb",function(){
		myRowIndex = $(this).parent().parent().index() + 1;
		   /* myColIndex = $(this).parent().parent().attr(".two");*/
			var table = document.getElementById("dataTables-example");
		    var parameter = ["subcatID","subcatname","filter","count","source","enabled","server","priorty","status","exec_time","last_completed","updated","critical"];
		    var link ="addFreq.action?" ;
		    for (var i = 1 ; i < table.rows [ myRowIndex ].cells.length - 1 ; i++ ) {
		    	var str =  table.rows [ myRowIndex ].cells [ i ].innerHTML;
		    	str = str.trim() ;
		    	//str = str.substring(0, str.indexOf("<br>")) ;
		    	console.log (link) ;
		    	if ( i == 1 ) {
		    		if ( isNaN (str) || str.length === 0 ) {
		    			alert ("Subcat ID should be a number") ;
		    			return ;
		    		}
		    		link = link + parameter [ i - 1 ] + "=" + str ;
		    	}
		    	else if ( i === 2  ) {
		    		if ( str.length === 0) {
		    			alert ("subcat name cannot be empty") ;
		    			return ;
		    		}
		    		link = link + "&" + parameter [ i - 1 ] + "=" + str ;
		    	}
		    	else if ( i === 4 ) {
		    		if ((isNaN(str) || str.length === 0)){
		    			alert ("Count should be a number!!") ;
		    			return ;
		    		}
		    		link = link + "&" + parameter [ i - 1 ] + "=" + str ;
		    	}
		    	else if ( i === 6 ) {
		    		if ( isNaN (str) || str.length === 0) {
		    			alert ("Enabled should be a number!!!") ;
		    			return ;
		    		}
		    		var k = parseInt (str) ;
		    		if ( k < 0 || k > 1 ) {
		    			alert ("Enabled can take only 0 and 1!!!") ;
		    			return ;
		    		}
		    		link = link + "&" + parameter [ i - 1 ] + "=" + str ;
		    	}
		    	else if ( i === 8 ) {
		    		if ( isNaN (str) || str.length === 0) {
		    			alert ("Priority should be a number!!!") ;
		    			return ;
		    		}
		    		var k = parseInt (str) ;
		    		if ( k < 0 || k > 27 && !(k&1) ) {
		    			alert ("Wrong Priority Value!!!") ;
		    			return ;
		    		}
		    		link = link + "&" + parameter [ i - 1 ] + "=" + str ;
		    	}
		    	else if ( i === 9 ) {
		    		if ( ( isNaN (str) || str.length === 0 )) {
		    			alert ("Status should be a number") ;
		    			return ;
		    		}
		    		link = link + "&" + parameter [ i - 1 ] + "=" + str ;
		    	}
		    	else if (i === 10 || i === 11 || i === 12) {
		    		var k = (str.length === 0 || !str.localeCompare('0000-00-00 00:00:00') ) ? 'null':str;
		    		link = link + "&" + parameter [ i - 1 ] + "=" + k;
		    	}
		
		    	else {
		    		link = link + "&" + parameter [ i - 1 ] + "=" + str ;
		    	}
		    }
		    //alert (link) ;
		    $(".addtodb").attr("href", link);
	});
	$(".add").click(function(){
		myRowIndex = document.getElementById("dataTables-example").rows.length;
		myColIndex = document.getElementById("dataTables-example").rows[1].cells.length;
		var test = "" ;
		for ( var i = 0 ; i < myColIndex ; i++ ) {
			if ( i === 0 ) {
				test = test + "<tr><td>" + myRowIndex + "</td>" ;
			}
			if ( i === 1 ) {
				test = test + "<td class = " + "autocomplete" + " contenteditable='true'></td>" ;
			}
			else if ( i === myColIndex - 1 ) {
				test = test + "<td><a class=" + "addtodb" + "> Add to Database</a><a class=" + "run" + "> Run</a></td></tr>"
			}
			else if ( i === 2) {
				
			}
			else {
				test = test + "<td contenteditable='true'></td>" ;
			}
		}
        $("#dataTables-example").append(test);
		
	});
	/*$("td").dblclick ( function () {
		$('.editable').attr("contenteditable", "true");
	}) ;*/
   $("td").dblclick(function () {
	   var col = $(this).parent().children().index($(this));
	   if (col != 4 && col != 6 && col != 8  ) {
		   return ;
	   }
        var OriginalContent = $(this).text();
         
        $(this).addClass("cellEditing");
        $(this).html("<input type='text' value='" + OriginalContent + "' />");
        $(this).children().first().focus();
 
        $(this).children().first().keypress(function (e) {
            if (e.which == 13) {
                var newContent = $(this).val();
                $(this).parent().text(newContent);
                $(this).parent().removeClass("cellEditing");
            }
        });
         
    $(this).children().first().blur(function(){
        $(this).parent().text(OriginalContent);
        $(this).parent().removeClass("cellEditing");
    });
    });
});

</script>


</head>
 <body >
 
 <br><br>
	<div style="margin-left: 40%;" id="message">
		<font color='green'></font>
	</div>
<%-- <s:set var="counter" value="1"></s:set> --%>
<div class="row" style="width: 150%; margin-left: 40px; border: none;">
	<div class="col-lg-12" style="background-color: none">
		<div class="panel panel-default">
			<div class="panel-body"
				>
				<div class="dataTable_wrapper">
					<div class="box-content box-table">
						<table class="table table-striped table-bordered table-hover"
							id="dataTables-example"
							style="text-align: center; border: 1px solid lightgray">
							<thead>
								<tr>
									<th >SNo</th>
									<th style="text-align: center;" class="one">Sub ID</th>
									<th style="text-align: center;" class="two">Name</th>
									<th style="text-align: center;" class="three">Filter</th>
									<!-- <th style="text-align: center;" >Link</th>-->
									<th style="text-align: center;"  class="four">Count</th>
									<th style="text-align: center;"  class="five">Source</th>
									<th style="text-align: center;"  class="six">Enabled</th>
									<th style="text-align: center;" class="seven">Server</th>
									<th style="text-align: center;"  class="eight" >Priority</th>
									<!--<th style="text-align: center;"  class="nine">Email</th>-->
									<th style="text-align: center;"  class="ten">Status</th>
									<th style="text-align: center;"  class="eleven">Next Run Time</th>
									<th style="text-align: center;"  class="twelve">Last Completed</th>
									<th style="text-align: center;"  class="thirteen">Updated</th>
									<th style="text-align: center;" class="fourteen">Critical</th>
									<th style="text-align: center;">Action</th>
									
								</tr>
							</thead>
							<tbody>
							<s:iterator value="%{#session.subcatFrequencyDetails}" var="group" status="counter" >
							 
							 <tr>
							 	<td style="width: 10px">
							 		<input type="text" value="<s:property value="#counter.count" /> " disabled="disabled">
							 	</td>
							 	<td class="editable" contenteditable="false"> <s:property  value="subcategoryID"/></td>
							 	<td class="editable" contenteditable="false"> <s:property  value="SubcategoryName"/></td>
							 	<td class="editable" contenteditable="false" disabled> <s:property  value="filter"/></td>
							 	<!-- <td> <s:property  value="link"/></td>-->
							 	<td class="editable"> <s:property  value="count"/></td>
							 	<td class="editable" contenteditable="false"> <s:property  value="source"/></td>
							 	<td class="editable"> <s:property  value="enabled"/></td>
							 	<td class="editable" contenteditable="false"> <s:property  value="server"/></td>
							 	<td class="editable"> <s:property  value="priorty"/></td>
							 	<!--<td> <s:property  value="email"/></td>-->
							 	<td class="editable" contenteditable="false"> <s:property  value="status"/></td>
							 	<td class="editable"> <s:property  value="executionTime"/></td>
							 	<td class="editable" contenteditable="false"> <s:property  value="last_completed"/></td>
							 	<td class="editable" contenteditable="false"> <s:property  value="updated"/></td>
							 	<td class="editable" contenteditable="false"> <s:property  value="critical"/></td>
				<td contenteditable="false">
							 	<!--<a class="update" href="updateFreq.action?subcatID=<s:property  value="subcategoryID"/>&priorty="> Update</a>-->
								 <a class="update"> Update</a>
								 <a class="run"> Run</a>
								 
				 </td>
						</tr>
						
							 </s:iterator>	
							</tbody>
						</table>
						<!--<a href="addFreq.action?subcatID=<s:property  value="subcategoryID"/>/> ">Add</a>-->
						<a class="add"> Add</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div> 

<script type="text/javascript">

function changePriorty(optionSelected)
{
	/* alert(optionSelected); */
	var e = document.getElementById("priortyChange");
	var strUser = e.options[e.selectedIndex].value;
	alert(strUser);
	var e = document.getElementById("priortyChange");
	strUser = e.options[e.selectedIndex].text;
	return  strUser;
	
}

</script>
<script src="/PriceSimulator/JS/utility/jquery-1.12.0.min.js"></script>

<script src="/PriceSimulator/JS/content/summary/metisMenu.min.js"></script>
<script src="/PriceSimulator/JS/content/summary/sb-admin-2.js"></script>

<script src="/PriceSimulator/JS/content/summary/bootstrap.js"></script>
<script
	src="/PriceSimulator/JS/content/summary/dataTables.bootstrap.min.js"></script>
<script
	src="/PriceSimulator/JS/content/summary/jquery.dataTables.min.js"></script>
 
</body>
</html>