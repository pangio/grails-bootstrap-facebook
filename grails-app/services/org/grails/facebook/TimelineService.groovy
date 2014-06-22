package org.grails.facebook

import org.grails.facebook.Status
import org.grails.facebook.auth.Person

class TimelineService {

	static transactional = false

    void clearTimelineCacheForUser(String username) {}

    def getTimelineForUser(String username) {
        def per = Person.findByUsername(username)
        def query = Status.whereAny {
            author { username == per.username }
            if(per.friends) author in per.friends
        }.order 'dateCreated', 'desc'
        def messages = query.list(max: 10)
        messages
    }
}
