<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta name="layout" content="main"/>
    <title><g:message code="title.what.are.you.doing.label" /></title>
    <g:javascript library="jquery" plugin="jquery" />
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-xs-5" >
                <h1><g:message code="title.what.are.you.doing.label" /></h1>
                    <g:formRemote url="[action: 'updateStatus']" update="messages" name="updateStatusForm" onSuccess="document.getElementById('message').value='';">
                        <g:textField name="message" class="btn blue" value=""/>
                        <g:submitButton name="${message(code: 'index.update.my.mood.label')}" id="update_status_button" class="btn btn-primary"/>
                    </g:formRemote>
            </div>

            <div class="col-xs-5" >
                <h1><g:message code="title.find.your.friends.label" /></h1>

                <div class="searchForm">
                    <g:form controller="searchable" name="userSearchForm">
                        <g:textField class="btn blue" name="q" value="" />
                        <g:submitButton name="Search For Friends" id="search_for_users_button" class="btn btn-primary"/>
                    </g:form>
                </div>
            </div>

            <div class="container">
                <div class="row">
                    <div class="col-xs-5" >
                    </br></br></br></br>
                        <h1><g:message code="index.timeline.title" /></h1>
                        <div id="messages">
                            <g:if test="${!statusMessages}">
                                <g:message code="status.no.posts.yet.label" />
                            </g:if>
                            <g:else>
                                <facebook:renderMessages messages="${statusMessages}"/>
                            </g:else>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>