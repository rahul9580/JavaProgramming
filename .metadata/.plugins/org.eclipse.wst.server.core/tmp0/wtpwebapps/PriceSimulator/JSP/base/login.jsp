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
		<div id="wrappermiddle" style="height: 290px;">
			<h2>Login</h2>
			<!-- <h1 style="margin-left: 200px;"><a href="/PriceSimulator/changePassword.action">Change Password</a></h1> -->
			<br>
			<br>
			<img id="logo" alt="" src="CSS/images/snapdeal.png">
			<s:form action="login" id="loginform">
				<div id="username_input">
					<div id="username_inputleft"></div>
					<div id="username_inputmiddle">
						<input type="text" name="email" id="url" placeholder="Email Id">
						<img id="url_user" src="CSS/images/mailicon.png" alt="">
					</div>
					<div id="username_inputright"></div>
				</div>
				<div id="password_input">
					<div id="password_inputleft"></div>
					<div id="password_inputmiddle">
						<input type="password" name="password" id="url" placeholder="Password" onclick="this.value = ''">
						<img id="url_password" src="CSS/images/passicon.png" alt="">
						
					</div>
					<div id="password_inputright"></div>
				</div>
				<div id="application_input">
					<div id="appilation_inputleft"></div>
					<div id="application_inputmiddle">
						<select style="width:300px;display:block;float:left;border: 5px solid transparent;" id="application" name="application" >
						<option value="1">PriceSimulator</option>
						<option value="2">MTZ Budget</option>
						</select>
					</div>
					<!-- <div id="application_inputright"></div> -->
				</div>
				<div id="submit">
					<input type="image" src="CSS/images/signin.png" id="submitbutton" value="Sign In">
				</div>
				<div style="margin-left: 200px;"></div>
				<div id="error">
					<s:property value="%{#session.report}" />
				</div>
			</s:form>
		</div>
		<div id="wrapperbottom"></div>		
	</div>
</body>
</html>