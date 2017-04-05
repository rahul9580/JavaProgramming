<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Snapdeal Price Simulator</title>
	<link type="text/css" rel="stylesheet" href="CSS/base/login.css" media="screen" />
</head>
<body>
	<div id="wrapper">
		<div id="wrappertop"></div>
		<div id="wrappermiddle" style="height:390px">
			<h2>Change Password</h2><h1 style="margin-left: 300px;"><a href="/PriceSimulator/login.action">Sign In</a></h1>
			<br>
			<br>
			<img id="logo" alt="" src="CSS/images/snapdeal.png">
			<s:form action="updatePassword" id="loginform">
				<div id="username_input">
					<div id="username_inputleft"></div>
					<div id="username_inputmiddle">
						<input type="text" name="email" placeholder="Email Id" id="url">
						<img id="url_user" src="CSS/images/mailicon.png" alt="">
					</div>
					<div id="username_inputright"></div>
				</div>
				<div id="password_input">
					<div id="password_inputleft"></div>
					<div id="password_inputmiddle">
						<input type="password" name="password" id="url" placeholder="Current Password" onclick="this.value = ''">
						
						
					</div>
					<div id="password_inputright"></div>
				</div>
				
					<div id="p1password_input">
					<div id="p1password_inputleft"></div>
					<div id="p1password_inputmiddle">
						<input type="password" name="p1password" id="p1url" placeholder="New Password" onclick="this.value = ''">
						
						
					</div>
					<div id="p1password_inputright"></div>
				</div>
				
				<div id="p2password_input">
					<div id="p2password_inputleft"></div>
					<div id="p2password_inputmiddle">
						<input type="password" name="p2password" id="p2url" placeholder="Re-enter New Password" onclick="this.value = ''">
						
						
						
					</div>
					<div id="p2password_inputright"></div>
				</div>
				
					
				
				
			<!-- 	<div id="submit">
					<input type="image" src="CSS/images/submit.png" id="submitbutton" value="Change">
				</div> -->
			
					<div id="submit" style="margin-top: 300px;">
					<input type="image" src="CSS/images/changepassword.png" id="submitbutton" value="Sign In">
				</div>
				<div id="error">
					<s:property value="%{#session.report}" />
				</div>
			</s:form>
		</div>
		<div id="wrapperbottom" style="height: 50px;">
		
		</div>		
	</div>
</body>
</html>