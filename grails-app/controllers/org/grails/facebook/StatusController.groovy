package org.grails.facebook

import grails.plugins.springsecurity.Secured

import org.grails.facebook.auth.Person

@Secured('IS_AUTHENTICATED_FULLY')
class StatusController {

    def statusService
    def timelineService
    def springSecurityService

    def index() {
        def messages = timelineService.getTimelineForUser(springSecurityService.principal.username)
        [statusMessages: messages]
    }

    def updateStatus(String message) {
        statusService.updateStatus message
        def messages = timelineService.getTimelineForUser(springSecurityService.principal.username)
        
        def content = facebook.renderMessages messages: messages
        render content
    }

    def like(long id) {
        statusService.like id

        def content = facebook.renderLikes message: Status.get(id)
        render content
    }

}
