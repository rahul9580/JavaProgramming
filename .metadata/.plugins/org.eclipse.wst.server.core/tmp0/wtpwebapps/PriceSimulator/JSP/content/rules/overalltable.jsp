<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<div class="subcattables" id="overalltable">
	<table class="subcatrules">
		<tr>
  			<th class="nobg">OverAll</th>
  			<th>CM Rule (%)</th>
  			<th>GM Rule (%)</th>
  			<th>Competitor Difference (%)</th>
  			<th>Max Competitor Difference (Rs.)</th>
  			<th>CM Rule No Competition (%)</th>
  			<th>GM Rule No Competition (%)</th>
		</tr>
   		<tr class="rule">
   			<th>No Limits</th>
   			<s:if test="rule.get(0).getFilterType() == \"OA\"">
    		<td class="CM"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(0).getParameterValue(\"CM\")"/>"></td>
    		<td class="GM"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(0).getParameterValue(\"GM\")"/>"></td>
    		<td class="CD"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(0).getParameterValue(\"CD\")"/>"></td>
        	<td class="MD"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(0).getParameterValue(\"MD\")"/>"></td>
        	<td class="NC"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(0).getParameterValue(\"NC\")"/>"></td>
        	<td class="NCGM"><input type="number" step="0.1" onkeypress="validate(event)" value="<s:property value="rule.get(0).getParameterValue(\"NCGM\")"/>"></td>
        	</s:if>
        	<s:else>
    		<td class="CM"><input type="number" step="0.1" onkeypress="validate(event)"></td>
    		<td class="GM"><input type="number" step="0.1" onkeypress="validate(event)"></td>
    		<td class="CD"><input type="number" step="0.1" onkeypress="validate(event)"></td>
        	<td class="MD"><input type="number" step="0.1" onkeypress="validate(event)"></td>
        	<td class="NC"><input type="number" step="0.1" onkeypress="validate(event)"></td>
        	<td class="NCGM"><input type="number" step="0.1" onkeypress="validate(event)"></td>        	
        	</s:else>
        </tr>
	</table>
</div>
</body>
</html>