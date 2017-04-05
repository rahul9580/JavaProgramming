<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div class="subcattables" id="popxselltable">
		<s:if test="rule.get(0).getFilterType() == \"PR;SP\"">
		<table class="subcatrules">
			<tr>
				<th class="nobg mainfilter mainfirst">Popularity Below<select><s:iterator value="limits" var="limit"><s:if test="#limit[0] == \"PR\""><s:if test="rule.get(util.getBelowxbelow()).getMainFilterValue().split(\":\")[1] == #limit[1]"><option selected="selected" value="<s:property value="#limit[1]"/>"><s:property value="#limit[1]"/></option></s:if><s:else><option value="<s:property value="#limit[1]"/>"><s:property value="#limit[1]"/></option></s:else></s:if></s:iterator></select></th>
				<th>CM Rule (%)</th>
				<th>GM Rule (%)</th>
				<th>Competitor Difference (%)</th>
				<th>Max Competitor Difference (Rs.)</th>
				<th>CM Rule No Competition (%)</th>
				<th>GM Rule No Competition (%)</th>
			</tr>
			<tr class="rule">
				<th class="filter first">Selling Price Below<select><s:iterator value="limits" var="limit"><s:if test="#limit[0] == \"SP\""><s:if test="rule.get(util.getBelowxbelow()).getFilterValue().split(\":\")[1] == #limit[1]"><option selected="selected" value="<s:property value="#limit[1]"/>"><s:property value="#limit[1]"/></option></s:if><s:else><option value="<s:property value="#limit[1]"/>"><s:property value="#limit[1]"/></option></s:else></s:if></s:iterator></select></th>
	    		<td class="CM"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getBelowxbelow()).getParameterValue(\"CM\")"/>"></td>
    			<td class="GM"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getBelowxbelow()).getParameterValue(\"GM\")"/>"></td>
    			<td class="CD"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getBelowxbelow()).getParameterValue(\"CD\")"/>"></td>
        		<td class="MD"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getBelowxbelow()).getParameterValue(\"MD\")"/>"></td>
        		<td class="NC"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getBelowxbelow()).getParameterValue(\"NC\")"/>"></td>
			<td class="NCGM"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getBelowxbelow()).getParameterValue(\"NCGM\")"/>"></td>
			</tr>
			<tr class="rule">
				<th class="filter second">Selling Price Till<select><s:iterator value="limits" var="limit"><s:if test="#limit[0] == \"SP\""><s:if test="rule.get(util.getBelowxtill()).getFilterValue().split(\":\")[1] == #limit[1]"><option selected="selected" value="<s:property value="#limit[1]"/>"><s:property value="#limit[1]"/></option></s:if><s:else><option value="<s:property value="#limit[1]"/>"><s:property value="#limit[1]"/></option></s:else></s:if></s:iterator></select></th>
	    		<td class="CM"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getBelowxtill()).getParameterValue(\"CM\")"/>"></td>
    			<td class="GM"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getBelowxtill()).getParameterValue(\"GM\")"/>"></td>
    			<td class="CD"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getBelowxtill()).getParameterValue(\"CD\")"/>"></td>
        		<td class="MD"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getBelowxtill()).getParameterValue(\"MD\")"/>"></td>
        		<td class="NC"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getBelowxtill()).getParameterValue(\"NC\")"/>"></td>
        		<td class="NCGM"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getBelowxtill()).getParameterValue(\"NCGM\")"/>"></td>
			</tr>
			<tr class="rule">
				<th class="filter">Selling Price Above</th>
	    		<td class="CM"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getBelowxabove()).getParameterValue(\"CM\")"/>"></td>
    			<td class="GM"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getBelowxabove()).getParameterValue(\"GM\")"/>"></td>
    			<td class="CD"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getBelowxabove()).getParameterValue(\"CD\")"/>"></td>
        		<td class="MD"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getBelowxabove()).getParameterValue(\"MD\")"/>"></td>
        		<td class="NC"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getBelowxabove()).getParameterValue(\"NC\")"/>"></td>
        		<td class="NCGM"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getBelowxabove()).getParameterValue(\"NCGM\")"/>"></td>
			</tr>
		</table>
		<table class="subcatrules">
			<tr>
				<th class="nobg mainfilter mainsecond">Popularity Till<select><s:iterator value="limits" var="limit"><s:if test="#limit[0] == \"PR\""><s:if test="rule.get(util.getTillxbelow()).getMainFilterValue().split(\":\")[1] == #limit[1]"><option selected="selected" value="<s:property value="#limit[1]"/>"><s:property value="#limit[1]"/></option></s:if><s:else><option value="<s:property value="#limit[1]"/>"><s:property value="#limit[1]"/></option></s:else></s:if></s:iterator></select></th>
				<th>CM Rule (%)</th>
				<th>GM Rule (%)</th>
				<th>Competitor Difference (%)</th>
				<th>Max Competitor Difference (Rs.)</th>
				<th>CM Rule No Competition (%)</th>
				<th>GM Rule No Competition (%)</th>
			</tr>
			<tr class="rule">
				<th class="filter first">Selling Price Below<select><s:iterator value="limits" var="limit"><s:if test="#limit[0] == \"SP\""><s:if test="rule.get(util.getTillxbelow()).getFilterValue().split(\":\")[1] == #limit[1]"><option selected="selected" value="<s:property value="#limit[1]"/>"><s:property value="#limit[1]"/></option></s:if><s:else><option value="<s:property value="#limit[1]"/>"><s:property value="#limit[1]"/></option></s:else></s:if></s:iterator></select></th>
	    		<td class="CM"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getTillxbelow()).getParameterValue(\"CM\")"/>"></td>
    			<td class="GM"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getTillxbelow()).getParameterValue(\"GM\")"/>"></td>
    			<td class="CD"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getTillxbelow()).getParameterValue(\"CD\")"/>"></td>
        		<td class="MD"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getTillxbelow()).getParameterValue(\"MD\")"/>"></td>
        		<td class="NC"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getTillxbelow()).getParameterValue(\"NC\")"/>"></td>
        		<td class="NCGM"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getTillxbelow()).getParameterValue(\"NCGM\")"/>"></td>
			</tr>
			<tr class="rule">
				<th class="filter second">Selling Price Till<select><s:iterator value="limits" var="limit"><s:if test="#limit[0] == \"SP\""><s:if test="rule.get(util.getTillxtill()).getFilterValue().split(\":\")[1] == #limit[1]"><option selected="selected" value="<s:property value="#limit[1]"/>"><s:property value="#limit[1]"/></option></s:if><s:else><option value="<s:property value="#limit[1]"/>"><s:property value="#limit[1]"/></option></s:else></s:if></s:iterator></select></th>
	    		<td class="CM"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getTillxtill()).getParameterValue(\"CM\")"/>"></td>
    			<td class="GM"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getTillxtill()).getParameterValue(\"GM\")"/>"></td>
    			<td class="CD"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getTillxtill()).getParameterValue(\"CD\")"/>"></td>
        		<td class="MD"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getTillxtill()).getParameterValue(\"MD\")"/>"></td>
        		<td class="NC"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getTillxtill()).getParameterValue(\"NC\")"/>"></td>
        		<td class="NCGM"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getTillxtill()).getParameterValue(\"NCGM\")"/>"></td>
			</tr>
			<tr class="rule">
				<th class="filter">Selling Price Above</th>
	    		<td class="CM"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getTillxabove()).getParameterValue(\"CM\")"/>"></td>
    			<td class="GM"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getTillxabove()).getParameterValue(\"GM\")"/>"></td>
    			<td class="CD"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getTillxabove()).getParameterValue(\"CD\")"/>"></td>
        		<td class="MD"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getTillxabove()).getParameterValue(\"MD\")"/>"></td>
        		<td class="NC"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getTillxabove()).getParameterValue(\"NC\")"/>"></td>
        		<td class="NCGM"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getTillxabove()).getParameterValue(\"NCGM\")"/>"></td>
			</tr>
		</table>
		<table class="subcatrules">
			<tr>
				<th class="nobg mainfilter">Popularity Above</th>
				<th>CM Rule (%)</th>
				<th>GM Rule (%)</th>
				<th>Competitor Difference (%)</th>
				<th>Max Competitor Difference (Rs.)</th>
				<th>CM Rule No Competition (%)</th>
				<th>GM Rule No Competition (%)</th>
			</tr>
			<tr class="rule">
				<th class="filter first">Selling Price Below<select><s:iterator value="limits" var="limit"><s:if test="#limit[0] == \"SP\""><s:if test="rule.get(util.getAbovexbelow()).getFilterValue().split(\":\")[1] == #limit[1]"><option selected="selected" value="<s:property value="#limit[1]"/>"><s:property value="#limit[1]"/></option></s:if><s:else><option value="<s:property value="#limit[1]"/>"><s:property value="#limit[1]"/></option></s:else></s:if></s:iterator></select></th>
	    		<td class="CM"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getAbovexbelow()).getParameterValue(\"CM\")"/>"></td>
    			<td class="GM"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getAbovexbelow()).getParameterValue(\"GM\")"/>"></td>
    			<td class="CD"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getAbovexbelow()).getParameterValue(\"CD\")"/>"></td>
        		<td class="MD"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getAbovexbelow()).getParameterValue(\"MD\")"/>"></td>
        		<td class="NC"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getAbovexbelow()).getParameterValue(\"NC\")"/>"></td>
			    <td class="NCGM"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getAbovexbelow()).getParameterValue(\"NCGM\")"/>"></td>
			</tr>
			<tr class="rule">
				<th class="filter second">Selling Price Till<select><s:iterator value="limits" var="limit"><s:if test="#limit[0] == \"SP\""><s:if test="rule.get(util.getAbovextill()).getFilterValue().split(\":\")[1] == #limit[1]"><option selected="selected" value="<s:property value="#limit[1]"/>"><s:property value="#limit[1]"/></option></s:if><s:else><option value="<s:property value="#limit[1]"/>"><s:property value="#limit[1]"/></option></s:else></s:if></s:iterator></select></th>
	    		<td class="CM"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getAbovextill()).getParameterValue(\"CM\")"/>"></td>
    			<td class="GM"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getAbovextill()).getParameterValue(\"GM\")"/>"></td>
    			<td class="CD"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getAbovextill()).getParameterValue(\"CD\")"/>"></td>
        		<td class="MD"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getAbovextill()).getParameterValue(\"MD\")"/>"></td>
        		<td class="NC"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getAbovextill()).getParameterValue(\"NC\")"/>"></td>
				<td class="NCGM"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getAbovextill()).getParameterValue(\"NCGM\")"/>"></td>
		
			</tr>
			<tr class="rule">
				<th class="filter">Selling Price Above</th>
	    		<td class="CM"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getAbovexabove()).getParameterValue(\"CM\")"/>"></td>
    			<td class="GM"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getAbovexabove()).getParameterValue(\"GM\")"/>"></td>
    			<td class="CD"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getAbovexabove()).getParameterValue(\"CD\")"/>"></td>
        		<td class="MD"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getAbovexabove()).getParameterValue(\"MD\")"/>"></td>
        		<td class="NC"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getAbovexabove()).getParameterValue(\"NC\")"/>"></td>
				<td class="NCGM"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getAbovexabove()).getParameterValue(\"NCGM\")"/>"></td>
		
			</tr>
		</table>
		</s:if>
		
		<s:else>
		<table class="subcatrules">
			<tr>
				<th class="nobg mainfilter mainfirst">Popularity Below<select><s:iterator value="limits" var="limit"><s:if test="#limit[0] == \"PR\""><option value="<s:property value="#limit[1]"/>"><s:property value="#limit[1]"/></option></s:if></s:iterator></select></th>
				<th>CM Rule (%)</th>
				<th>GM Rule (%)</th>
				<th>Competitor Difference (%)</th>
				<th>Max Competitor Difference (Rs.)</th>
				<th>CM Rule No Competition (%)</th>
				<th>GM Rule No Competition (%)</th>
			</tr>
			<tr class="rule">
				<th class="filter first">Selling Price Below<select><s:iterator value="limits" var="limit"><s:if test="#limit[0] == \"SP\""><option value="<s:property value="#limit[1]"/>"><s:property value="#limit[1]"/></option></s:if></s:iterator></select></th>
				<td class="CM"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="GM"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="CD"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="MD"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="NC"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
					<td class="NCGM"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
			</tr>
			<tr class="rule">
				<th class="filter second">Selling Price Till<select><s:iterator value="limits" var="limit"><s:if test="#limit[0] == \"SP\""><option value="<s:property value="#limit[1]"/>"><s:property value="#limit[1]"/></option></s:if></s:iterator></select></th>
				<td class="CM"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="GM"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="CD"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="MD"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="NC"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="NCGM"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>	
			</tr>
			<tr class="rule">
				<th class="filter">Selling Price Above</th>
				<td class="CM"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="GM"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="CD"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="MD"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="NC"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
					<td class="NCGM"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
			</tr>
		</table>
		<table class="subcatrules">
			<tr>
				<th class="nobg mainfilter mainsecond">Popularity Till<select><s:iterator value="limits" var="limit"><s:if test="#limit[0] == \"PR\""><option value="<s:property value="#limit[1]"/>"><s:property value="#limit[1]"/></option></s:if></s:iterator></select></th>
				<th>CM Rule (%)</th>
				<th>GM Rule (%)</th>
				<th>Competitor Difference (%)</th>
				<th>Max Competitor Difference (Rs.)</th>
				<th>CM Rule No Competition (%)</th>
					<th>GM Rule No Competition (%)</th>
			</tr>
			<tr class="rule">
				<th class="filter first">Selling Price Below<select><s:iterator value="limits" var="limit"><s:if test="#limit[0] == \"SP\""><option value="<s:property value="#limit[1]"/>"><s:property value="#limit[1]"/></option></s:if></s:iterator></select></th>
				<td class="CM"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="GM"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="CD"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="MD"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
					<td class="NC"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="NCGM"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
			</tr>
			<tr class="rule">
				<th class="filter second">Selling Price Till<select><s:iterator value="limits" var="limit"><s:if test="#limit[0] == \"SP\""><option value="<s:property value="#limit[1]"/>"><s:property value="#limit[1]"/></option></s:if></s:iterator></select></th>
				<td class="CM"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="GM"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="CD"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="MD"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
					<td class="NC"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="NCGM"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
			</tr>
			<tr class="rule">
				<th class="filter">Selling Price Above</th>
				<td class="CM"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="GM"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="CD"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="MD"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="NC"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="NCGM"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
			</tr>
		</table>
		<table class="subcatrules">
			<tr>
				<th class="nobg mainfilter">Popularity Above</th>
				<th>CM Rule (%)</th>
				<th>GM Rule (%)</th>
				<th>Competitor Difference (%)</th>
				<th>Max Competitor Difference (Rs.)</th>
				<th>CM Rule No Competition (%)</th>
				<th>GM Rule No Competition (%)</th>
			</tr>
			<tr class="rule">
				<th class="filter first">Selling Price Below<select><s:iterator value="limits" var="limit"><s:if test="#limit[0] == \"SP\""><option value="<s:property value="#limit[1]"/>"><s:property value="#limit[1]"/></option></s:if></s:iterator></select></th>
				<td class="CM"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="GM"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="CD"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="MD"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
					<td class="NC"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="NCGM"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
			</tr>
			<tr class="rule">
				<th class="filter second">Selling Price Till<select><s:iterator value="limits" var="limit"><s:if test="#limit[0] == \"SP\""><option value="<s:property value="#limit[1]"/>"><s:property value="#limit[1]"/></option></s:if></s:iterator></select></th>
				<td class="CM"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="GM"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="CD"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="MD"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
					<td class="NC"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="NCGM"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
			</tr>
			<tr class="rule">
				<th class="filter">Selling Price Above</th>
				<td class="CM"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="GM"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="CD"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="MD"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
					<!-- <td class="NCGM"><input type="number" step="0.1"
					onkeypress="validate(event)"></td> -->
				<td class="NC"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
				<td class="NCGM"><input type="number" step="0.1"
					onkeypress="validate(event)"></td>
			</tr>
		</table>		
		</s:else>
	</div>
</body>
</html>