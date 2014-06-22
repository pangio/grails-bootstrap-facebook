package org.grails.facebook

import grails.plugin.cache.CacheEvict
import grails.plugin.cache.Cacheable

import org.grails.facebook.auth.Person

class StatusService {

    static expose = ['jms']

    def springSecurityService
    def timelineService
    
    void onMessage(newMessageUserName) {
        log.debug "Message received. New status message posted by user <${newMessageUserName}>."
        def following = Person.where {
            friends.username == newMessageUserName
        }.property('username').list()
        following.each { uname ->
            timelineService.clearTimelineCacheForUser(uname)
        }
    }

    void updateStatus(String message) {
        def status = new Status(message: message)
        status.author = lookupCurrentPerson()
        status.save()
        timelineService.clearTimelineCacheForUser(status.author.username)
    }

    void like(long statusId) {
        def status = Status.get(statusId)

        if (status) {
            status.addToLiked(lookupCurrentPerson())
            status.save(flush: true)
        }
    }

    private lookupCurrentPerson() {
        Person.get(springSecurityService.principal.id)
    }
}
