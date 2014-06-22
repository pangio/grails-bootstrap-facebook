<%@ page import="org.grails.facebook.auth.Person" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="index.profile.label" /></title>
	</head>
	<body>
		<div id="show-person" class="content scaffold-show" role="main">
			<h1><g:message code="index.profile.label" /></h1>
			<g:if test="${flash.message}">
			    <div class="message" role="status">${flash.message}</div>
			</g:if>
		</div>

        <div class="container">
            <div class="row">
                <div class="col-xs-2" >
                    <div class="control-group">
                        <label class="control-label" for="username"><g:message code="person.avatar.label" default="Avatar" /></label>
                        <div class="controls">
                            <img class="blue" height="100"  width="100" src="${resource(dir: 'images/avatars', file: "${personInstance.avatar}")}" />
                        </div>
                    </div>
                </div>
                <div>
                    <div class="control-group">
                        <label class="control-label" for="realName"><g:message code="person.name.label" default="Name" /></label>
                        <div class="controls">
                            <g:textField name="realName" class="btn blue" value="${personInstance.realName}" disabled=""/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="username"><g:message code="person.username.label" default="Username" /></label>
                        <div class="controls">
                            <g:textField name="username" class="btn blue" value="${personInstance.username}" disabled=""/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
