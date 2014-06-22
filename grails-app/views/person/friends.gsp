<%@ page import="org.grails.facebook.auth.Person" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="person.my.friends.label" /></title>
</head>

<body>
<div class="content scaffold-list" role="main">
    <h1><g:message code="person.my.friends.label"/></h1>
    <g:if test="${flash.message}">
        <div class="alert-info btn btn-block" role="status">${flash.message}</div>
    </g:if>
    <g:if test="${flash.success}">
        <div class="alert-success btn btn-block" role="status">${flash.success}</div>
    </g:if>
    <g:if test="${flash.danger}">
        <div class="alert-danger btn btn-block" role="status">${flash.danger}</div>
    </g:if>

    <g:if test="${friendsListCount == 0}">
        <div class="message alert-info btn btn-block" role="status"><g:message code="person.no.friends.notification.label" /></div>
    </g:if>

    <g:else>
        <table class="table table-striped">
            <thead>
            <tr>
                <g:sortableColumn property="avatar" title="${message(code: 'person.avatar.label', default: 'Avatar')}"/>
                <g:sortableColumn property="realName" title="${message(code: 'person.name.label', default: 'Name')}"/>
                <g:sortableColumn property="username" title="${message(code: 'person.username.label', default: 'username')}"/>
            </tr>
            </thead>
            <tbody>
            <g:each in="${friendsList}" status="i" var="friend">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <td><img class="blue" height="40"  width="40" src="${resource(dir: 'images/avatars', file: "${friend.avatar}")}" /></td>
                    <td><strong>${fieldValue(bean: friend, field: "realName")}</strong></td>
                    <td>${fieldValue(bean: friend, field: "username")}</td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </g:else>

    <div class="pagination">
        <g:paginate total="${friendsListCount ?: 0}"/>
    </div>
</div>
</body>
</html>
