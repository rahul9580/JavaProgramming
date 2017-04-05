<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/content/rules/homepage.css" media="screen" />
	<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/buttons.css" media="screen" />
	<link type="text/css" rel="stylesheet" href="/PriceSimulator/CSS/utility/loader.css" media="screen" />
	
	<script type="text/javascript" src="/PriceSimulator/JS/utility/loader.js"></script>
</head>
<body bgcolor="#E6E6FA">




	<table class="homepage">
    	<tr>
    		<th>Category</th>
        	<th>Subcategory</th>        
        	<th>Subcategory Id</th>
        	<th>Hour of Scraping(0-24)</th>
        	<th>Priority</th>
    	</tr>
    	
    	<s:iterator value="scraping" var="scraper">
		<tr id="<s:property value="#scraper.getSubcategory"/>">
			
        	<td>
        	<span class="detailvalue"><s:property value="#scraper.getCategory()"/></span> 				
				
        	</td>
			<td>
				
        		<span class="detailvalue"><s:property value="#scraper.getSubcategory()"/></span>
			</td>
			<td class="price">
				
				<span class="detailvalue"> <s:property value="#scraper.getSubcategory_id()"/></span>
			</td>
			<td>
				
				<span class="detailvalue"><s:property value="#scraper.getHour_of_scraping()"/></span>
			</td>
			<td>
				
				<span class="detailvalue"><s:property value="#scraper.getPriority()"/></span>
			</td>
			
  			
    	</tr>
    	</s:iterator>
    </table>
    
    <br>
    <br>
    
    <table class="homepage">
    	<tr>
    		<th>Products in Snapdeal</th>
        	<th>SD Scraped SUPCs </th>        
        	<th>Mapped with FK</th>
        	<th>Mapped with AZ</th>
        	<th>Last Scraped</th>
    	</tr>
    	
    	
		<tr >
			
        	<td>
        	<span class="detailvalue"><s:property value="total_snapdeal" /></span> 				
				
        	</td>
			<td>
				
        		<span class="detailvalue"><s:property value="total_scraped"/></span>
			</td>
			<td class="price">
				
				<span class="detailvalue"> <s:property value="total_flipkart"/></span>
			</td>
			<td>
				
				<span class="detailvalue"><s:property value="total_amazon"/></span>
			</td>
			<td>
				
				<span class="detailvalue"><s:property value="last_updated"/></span>
			</td>
			
  			
    	</tr>
    	
    </table>




    <br>
    <br>


	 <table class="homepage">
    	<tr>
    		<th>PR.</th>
    		
    		<th>Added on</th>
        	<th>Product Details</th>
        	<th>Seller Details</th>
        	<th>Rule</th>
        	
        	<th>Competitor</th>
        	<th>Pricing</th>
        	<th>CashBack</th>
        	<th>Cart Price</th>
    	</tr>
    	
    	<s:iterator value="changelist" var="prod">
		<tr id="<s:property value="#prod.getVendor_code()"/>">
			<td>
				<s:property value="#prod.getPopularity_rank()"/>
			</td>
			
			<td>
        		<span class="detailvalue"><s:property value="#prod.getAdded_on()"/></span>
        	</td>
        	<td>
	      	 	<span class="detailhead">SUPC</span><span class="detailvalue"><s:property value="#prod.getSupc()"/></span> 
				<span class="detailhead">Name</span><span class="detailvalue"><s:property value="#prod.getProduct_name()"/></span>
				<span class="detailhead">MappingStatus</span><span class="detailvalue"><s:property value="#prod.getMapping_status()"/></span>
				
        	</td>
        	<td>
	      	 	<span class="detailhead">Seller Name</span><span class="detailvalue"><s:property value="#prod.getVendor_name()"/></span> 
				<span class="detailhead">Seller Code</span><span class="detailvalue"><s:property value="#prod.getVendor_code()"/></span>
				<span class="detailhead">Inventory</span><span class="detailvalue"><s:property value="#prod.getInventory()"/></span>
				
        	</td>
        	<td>
	      	 	<span class="detailhead">Rule Type</span><span class="detailvalue"><s:property value="#prod.getRule_type()"/></span> 
				<span class="detailhead">Parameter Type</span><span class="detailvalue"><s:property value="#prod.getParameter_type()"/></span>
				<span class="detailhead">Parameter Value</span><span class="detailvalue"><s:property value="#prod.getParameter_value()"/></span>
				
        	</td>
        	
			<td>
				<span class="detailhead">Name</span><span class="detailvalue"><s:property value="#prod.getCompetitor()"/></span> 
        		<span class="detailhead">Price</span><span class="detailvalue"><s:property value="#prod.getComp_sp()"/></span>
			</td>
			<td class="price">
				<span class="detailhead">Transfer Price</span><span class="detailvalue"><s:property value="#prod.getTransfer_price()"/></span>
				<span class="detailhead">Seller</span><span class="detailvalue VP"><s:property value="#prod.getVendor_price()"/></span>
				<span class="detailhead">Selling</span><span class="detailvalue SP"><s:property value="#prod.getSelling_price()"/></span>
				
				<span class="detailhead">Offer </span><span class="detailvalue"><s:property value="#prod.getOffer_price()"/></span>
			</td>
			<td>
				
				<span class="detailhead">Internal </span><span class="detailvalue INTCB"><s:property value="#prod.getSd_int_cashback()"/></span>
				<span class="detailhead">External</span><span class="detailvalue EXTCB"><s:property value="#prod.getSd_ext_cashback()"/></span>
			</td>
			<td>
				<span class="detailhead">CM %</span><span class="detailvalue CM"><s:property value="#prod.getCurrent_cm()"/></span>
				<span class="detailhead">GM %</span><span class="detailvalue GM"><s:property value="#prod.getCurrent_gm()"/></span>
				<span class="detailhead">Cart Price </span><span class="detailvalue CART"><s:property value="#prod.getCart_price()"/></span>
			</td>
			
    	</tr>
    	</s:iterator>
    </table>
	
	


			
</body>
</html>