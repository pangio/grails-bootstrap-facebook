package org.grails.facebook

import grails.plugins.springsecurity.Secured

@Secured('IS_AUTHENTICATED_FULLY')
class ChatController {
	def messageService

	def index(){
	}

	def addMessage(String message) {
		messageService.updateMessage(message)
		render "<script>getLatestMessages()</script>"
	}

	def getLatestMessages() {
		def messages = Message.listOrderByDateCreated(order: 'desc', max: 10)
		String content = g.render(template: "latestMessages", model: [messages: messages.reverse()])
		render content
	}
}
