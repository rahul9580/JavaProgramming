<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<div class="subcattables" id="sellingpricetable">
	<table class="subcatrules table" style="width:60%;">
		<tr>
  			<th class="nobg">Selling Price</th>
  			<th>CM Rule (%)</th>
  			<th>GM Rule (%)</th>
  			<th>Competitor Difference (%)</th>
  			<th>Max Competitor Difference (Rs.)</th>
  			<th>CM Rule No Competition (%)</th>
  			<th>GM Rule No Competition (%)</th>
		</tr>
		<s:if test="rule.get(0).getFilterType() == \"SP\"">
   		<tr class="rule">
    		<th class="filter first"><label>Below</label><select><s:iterator value="limits" var="limit"><s:if test="#limit[0] == \"SP\""><s:if test="rule.get(util.getBelow()).getFilterValue().split(\":\")[1] == #limit[1]"><option selected="selected" value="<s:property value="#limit[1]"/>"><s:property value="#limit[1]"/></option></s:if><s:else><option value="<s:property value="#limit[1]"/>"><s:property value="#limit[1]"/></option></s:else></s:if></s:iterator></select></th>
    		<td class="CM form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getBelow()).getParameterValue(\"CM\")"/>"></td>
    		<td class="GM form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getBelow()).getParameterValue(\"GM\")"/>"></td>
    		<td class="CD form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getBelow()).getParameterValue(\"CD\")"/>"></td>
        	<td class="MD form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getBelow()).getParameterValue(\"MD\")"/>"></td>
        	<td class="NC form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getBelow()).getParameterValue(\"NC\")"/>"></td>
        	<td class="NCGM form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getBelow()).getParameterValue(\"NCGM\")"/>"></td>
       	</tr>
       	<tr class="rule">
    		<th class="filter second"><label>Till</label><select><s:iterator value="limits" var="limit"><s:if test="#limit[0] == \"SP\""><s:if test="rule.get(util.getTill()).getFilterValue().split(\":\")[1] == #limit[1]"><option selected="selected" value="<s:property value="#limit[1]"/>"><s:property value="#limit[1]"/></option></s:if><s:else><option value="<s:property value="#limit[1]"/>"><s:property value="#limit[1]"/></option></s:else></s:if></s:iterator></select></th>
    		<td class="CM form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getTill()).getParameterValue(\"CM\")"/>"></td>
    		<td class="GM form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getTill()).getParameterValue(\"GM\")"/>"></td>
    		<td class="CD form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getTill()).getParameterValue(\"CD\")"/>"></td>
        	<td class="MD form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getTill()).getParameterValue(\"MD\")"/>"></td>
        	<td class="NC form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getTill()).getParameterValue(\"NC\")"/>"></td>
        	<td class="NCGM form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getTill()).getParameterValue(\"NCGM\")"/>"></td>
       	</tr>
   			<tr class="rule">
   			<th class="filter"><label>Above</label></th>
    		<td class="CM form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getAbove()).getParameterValue(\"CM\")"/>"></td>
    		<td class="GM form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getAbove()).getParameterValue(\"GM\")"/>"></td>
    		<td class="CD form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getAbove()).getParameterValue(\"CD\")"/>"></td>
        	<td class="MD form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getAbove()).getParameterValue(\"MD\")"/>"></td>
        	<td class="NC form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getAbove()).getParameterValue(\"NC\")"/>"></td>
        	<td class="NCGM form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(util.getAbove()).getParameterValue(\"NCGM\")"/>"></td>
       	</tr>
       	</s:if>
       	<s:else>
   		<tr class="rule">
    		<th class="filter first"><label>Below</label><select><s:iterator value="limits" var="limit"><s:if test="#limit[0] == \"SP\""><option value="<s:property value="#limit[1]"/>"><s:property value="#limit[1]"/></option></s:if></s:iterator></select></th>
    		<td class="CM form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)" value="<s:property value="%{#session.get(0).getParameterValue(\"CM\")}"/>"></td>
    		<td class="GM form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)"></td>
    		<td class="CD form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)"></td>
        	<td class="MD form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)"></td>
        	<td class="NC form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)"></td>
        	<td class="NCGM form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)"></td>
       	</tr>
       	<tr class="rule">
        	<th class="filter second"><label>Till</label><select><s:iterator value="limits" var="limit"><s:if test="#limit[0] == \"SP\""><option value="<s:property value="#limit[1]"/>"><s:property value="#limit[1]"/></option></s:if></s:iterator></select></th>
       		<td class="CM form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)"></td>
    		<td class="GM form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)"></td>
    		<td class="CD form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)"></td>
        	<td class="MD form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)"></td>
        	<td class="NC form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)"></td> 
        	<td class="NCGM form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)"></td>        		
       	</tr>
   		<tr class="rule">
   			<th class="filter"><label>Above</label></th>
       		<td class="CM form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)"></td>
    		<td class="GM form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)"></td>
    		<td class="CD form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)"></td>
        	<td class="MD form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)"></td>
        	<td class="NC form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)"></td>
        	<td class="NCGM form-group"><input type="number" class="form-control" step="0.1" onkeypress="validate(event)"></td>        		
       	</tr>       	
       	</s:else>
	</table>
</div>

</body>
</html>