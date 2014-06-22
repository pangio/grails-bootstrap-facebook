package org.grails.facebook

import grails.transaction.Transactional
import org.grails.facebook.auth.Person

@Transactional
class FriendRequestService {

    def friendRequestsTo(Person user) {
        def friendRequests = new ArrayList<FriendRequest>()
        friendRequests = FriendRequest.findAllByTo(user)
    }

    def serviceMethod() {

    }
}
