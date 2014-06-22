package org.grails.facebook

import org.grails.facebook.auth.Person

class Status {

    String message
    Person author
    Date dateCreated

    static hasMany = [liked:Person]

    transient jmsService

    transient afterInsert = {
        jmsService.send 'gfacebook.status', author.username
    }
}
