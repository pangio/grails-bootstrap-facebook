package org.grails.facebook

import org.grails.facebook.auth.Person

class FriendRequest {

    Person from
    Person to

    static belongsTo = [from:Person]

    static constraints = {
    }
}
