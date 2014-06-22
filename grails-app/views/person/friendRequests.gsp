<%@ page import="org.grails.facebook.auth.Person" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="person.friend.requests.label" /></title>
</head>

<body>
<div id="list-user" class="content scaffold-list" role="main">
    <h1><g:message code="person.friend.requests.label" /></h1>
    <g:if test="${flash.message}">
        <div class="message alert-info btn btn-block" role="status">${flash.message}</div>
    </g:if>
    <g:if test="${flash.success}">
        <div class="alert-success btn btn-block" role="status">${flash.success}</div>
    </g:if>
    <g:if test="${flash.danger}">
        <div class="alert-danger btn btn-block" role="status">${flash.danger}</div>
    </g:if>

    <g:if test="${friendRequestsList.size == 0}">
        <div class="alert-info btn btn-block" role="status"><g:message code="person.no.requests.notification.label" /></div>
    </g:if>

    <g:else>
        <table class="table table-striped">
            <thead>
            <tr>
                <g:sortableColumn property="avatar" title="${message(code: 'person.avatar.label', default: 'Photo')}"/>
                <g:sortableColumn property="realName" title="${message(code: 'person.requests.from.label', default: 'From')}"/>
                <g:sortableColumn property="accept" title="${message(code: 'person.requests.action.accept.label', default: 'Accept?')}"/>
                <g:sortableColumn property="deny" title="${message(code: 'person.requests.action.reject.label', default: 'Deny?')}"/>
            </tr>
            </thead>
            <tbody>
            <g:each in="${friendRequestsList}" status="i" var="friendRequest">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <td><img class="blue" height="40"  width="40" src="${resource(dir: 'images/avatars', file: "${friendRequest.from.avatar}")}" /></td>
                    <td><strong>${fieldValue(bean: friendRequest, field: "from.realName")}</strong ></td>
                    <td><span class="btn btn-success"><g:link controller="person" action="acceptFriendRequest" id="${friendRequest.id}"><g:message code="person.requests.action.accept.label" /></g:link></span></td>
                    <td><span class="btn btn-danger"><g:link controller="person" action="denyFriendRequest" id="${friendRequest.id}"><g:message code="person.requests.action.reject.label" /></g:link></span></td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </g:else>

    <div class="pagination">
        <g:paginate total="${friendRequestsCount ?: 0}"/>
    </div>
</div>
</body>
</html>
