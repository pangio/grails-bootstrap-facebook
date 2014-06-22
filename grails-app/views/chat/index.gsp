<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:message code="title.what.are.you.doing.label" /></title>
    <g:javascript library="jquery" plugin="jquery" />
</head>
<body class="chatMessages">
<h1><g:message code="index.group.chat.label" /></h1>
<div id="chatMessages" class="chatMessages" ></div>

<div class="content scaffold-list">
    <input type="text" id="messageBox" name="message" onkeypress="messageKeyPress(this, event);" class="chatMessage btn blue" />
    <button class="btn btn-primary" onclick="sendMessage();">Send</button>
</div>

<script>
    function messageKeyPress(field, event) {
        var theCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
        
        if (theCode != 13) {
            return true;
        }
        
        sendMessage();
        return false;
    }

    function sendMessage() {
    	var message = $('#messageBox').val();
    	<g:remoteFunction action="addMessage" params="\'message=\' + message" />
        $('#messageBox').val('');
	}
    
    function getLatestMessages() {
        <g:remoteFunction action="getLatestMessages" update="chatMessages"/>
    }
    
    function pollMessages() {
    	getLatestMessages();
        setTimeout('pollMessages()', 5000);
    };

    pollMessages();
</script>
</body>
</html>