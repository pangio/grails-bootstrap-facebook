<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:message code="searchable.finding.friends.title" /></title>
</head>
<body>
    <h1><g:message code="searchable.finding.friends.title" /></h1>
    <div>
        <g:each var="person" in="${searchResult?.results}" status="counter">
        <div id="search_result_${counter}">
            <g:message code="searchable.do.you.know.label" /><span class="real_name"> ${person.realName} ?</span> <g:link class="btn btn-primary" id="${person.id}" action="sendFriendRequest" controller="person"><g:message code="searchable.send.friend.request.label" /></g:link>
            </div>
        </g:each>
    </div>
</body>
</html>