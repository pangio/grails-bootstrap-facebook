<div class="statusMessage" id="message_${messageCounter}">
    <img class="blue" height="40"  width="40" src="${resource(dir: 'images/avatars', file: "${statusMessage.author.avatar}")}" /> <strong><span class="author">${statusMessage.author.realName}</span> <g:message code="status.said.label" /></strong>
    <span class="statusMessage">${statusMessage.message}</span><br/>
    <div class="statusMessageTime">
        <prettytime:display class="statusMessageTime" date="${statusMessage.dateCreated}" />
    </div>
    <div class="statusMessageLikeButton">
        <g:remoteLink id="${statusMessage.id}" update="likes_${messageCounter}" action="like" controller="status"><g:message code="status.like.label" /></g:remoteLink>
        <div id="likes_${messageCounter}">
            <facebook:renderLikes message="${statusMessage}"/>
        </div>
    </div>
</div>
