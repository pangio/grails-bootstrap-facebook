<%@ page import="org.grails.facebook.auth.Person" %>

<html>
<body>
<div><g:message code="searchable.is.not.your.friend.label" args="${userInstance?.realName}" /></div>
<div><g:message code="searchable.send.friend.request.to.him.or.her.label" /></div>

<g:link controller="person" action="sendFriendRequest" params="[to: userInstance?.id ]" > <g:message code="searchable.send.friend.request.label" /> </g:link>
<g:link controller="person" action="index" > <g:message code="searchable.send.friend.request.no.thanks.label" /> </g:link>
</body>
</html>