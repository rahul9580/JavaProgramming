<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/content/categoryfilter.css" media="screen"/>
<!-- 	<script type="text/javascript" src="/PriceSimulator/JS/utility/jquery-1.12.0.min.js"></script> -->
	<script type="text/javascript" src="/PriceSimulator/JS/content/categoryfilter.js"></script>
</head>
<body>
	<ul class="categoryfilter">
		<s:iterator value="%{#session.category}" var="CatID">
			<s:if test="%{#session.selcategory.split(\";\")[0]==#CatID.toString()}">
				<li class="open">
					<span class="name"><s:property value="%{#CatID.getName()}"/></span>
					<span class="notifications"><s:property value="%{#CatID.getSubCat().size()}"/></span>
					<ul class="open">
						<s:iterator value="%{#CatID.getSubCat()}" var="SubCatID">
							<li>
							<s:set var="subcategoryStatus" value="%{#SubCatID.getAccessName()}"/>
<%-- 								<a href="?cat=<s:property value="#CatID+\";\"+#SubCatID"/>&subcatStatus=<s:property value ="%{#session.subcategoryStatus}"/>&subcatAccess=<s:property value="%{#SubCatID.getAccessName()}"/>"> --%>
								<a href="?cat=<s:property value="#CatID+\";\"+#SubCatID"/>&subcatStatus=<s:property value ="%{#session.subcategoryStatus}"/>">
								<s:if test="%{#session.selcategory==#CatID+\";\"+#SubCatID}">
									<div class="name" style="background-color: #6c7a89; color:#ffffff">
									<span><s:property value="%{#SubCatID.getName()}"/>
									</span>
								<s:if test="#subcategoryStatus=='approve' || session.adminPrivilege=='admin'">	
									<label>
										<s:if test="%{#SubCatID.getStatus()==1}">
											<input type="checkbox" class="statusswitch" 
											alt="<s:property value="#CatID+\";\"+#SubCatID+\";\"+#subcategoryStatus+\";\"+session.adminPrivilege"/>" checked/><div><div></div></div>
										</s:if>
										<s:else>
											<input type="checkbox" class="statusswitch" alt="<s:property value="#CatID+\";\"+#SubCatID+\";\"+#subcategoryStatus+\";\"+session.adminPrivilege"/>"/>
											<div><div></div></div>
										</s:else>
									</label>
								</s:if>	
									</div>
								</s:if>
								<s:else>
									<div class="name">
									<span><s:property value="%{#SubCatID.getName()}"/></span>
								<s:if test="#subcategoryStatus=='approve' || session.adminPrivilege=='admin'">	
									<label>
										<s:if test="%{#SubCatID.getStatus()==1}">
											<input type="checkbox" class="statusswitch" alt="<s:property value="#CatID+\";\"+#SubCatID+\";\"+#subcategoryStatus+\";\"+session.adminPrivilege"/>" checked/><div><div></div></div>
										</s:if>
										<s:else>
											<input type="checkbox" class="statusswitch" alt="<s:property value="#CatID+\";\"+#SubCatID+\";\"+#subcategoryStatus+\";\"+session.adminPrivilege"/>"/><div><div></div></div>
										</s:else>
									</label>
								</s:if>	
									</div>
								</s:else>
								</a>
							</li>
						</s:iterator>
					</ul>
				</li>
			</s:if>
			<s:else>
				<li>
					<span class="name"><s:property value="%{#CatID.getName()}"/></span>
					<span class="notifications"><s:property value="%{#CatID.getSubCat().size()}"/></span>
					<ul class="close">
						<s:iterator value="%{#CatID.getSubCat()}" var="SubCatID">
							<li>
							<s:set var="subcategoryStatus" value="%{#SubCatID.getAccessName()}"/>
								<%-- <a href="?cat=<s:property value="#CatID+\";\"+#SubCatID"/>&subcatStatus=<s:property value ="%{#SubCatID.getStatus()}"/>&subcatAccess=<s:property value="%{#SubCatID.getAccessName()}"/>"> --%>
								<a href="?cat=<s:property value="#CatID+\";\"+#SubCatID"/>&subcatStatus=<s:property value ="%{#SubCatID.getStatus()}"/>">
									<div class="name">
									<span><s:property value="%{#SubCatID.getName()}"/>
									</span>
								<s:if test="#subcategoryStatus=='approve' || session.adminPrivilege=='admin'">	
									<label>
										<s:if test="%{#SubCatID.getStatus()==1}">
											<input type="checkbox" class="statusswitch" alt="<s:property value="#CatID+\";\"+#SubCatID+\";\"+#subcategoryStatus+\";\"+session.adminPrivilege"/>" checked/><div><div></div></div>
										</s:if>
										<s:else>
											<input type="checkbox" class="statusswitch" alt="<s:property value="#CatID+\";\"+#SubCatID+\";\"+#subcategoryStatus+\";\"+session.adminPrivilege"/>"/><div><div></div></div>
										</s:else>
									</label>
								</s:if>	
									</div>
								</a>
							</li>
						</s:iterator>
					</ul>
				</li>
			</s:else>
		</s:iterator>
	</ul>
</body>
</html>