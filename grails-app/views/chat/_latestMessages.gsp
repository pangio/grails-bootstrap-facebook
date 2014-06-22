<g:each in="${messages}" var="message">
    <div >
    	<table class="table table-striped">
    		<tr>
                <td><img class="blue" height="40"  width="40" src="${resource(dir: 'images/avatars', file: "${message.author.avatar}")}" /></td>
                <td width="150"><span class="author"><strong>${message.author.realName}</strong></span></td>
    			<td width="350"><span class="statusMessage">${message.message}</span></td>
    			<td width="150"><span class="messageTime"><prettytime:display class="statusMessageTime" date="${message.dateCreated}" /></span></td>
    		</tr>
    	</table>
    </div>
</g:each>