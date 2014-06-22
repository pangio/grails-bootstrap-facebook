package org.grails.facebook

class StatusTagLib {
    static namespace = 'facebook'
    
    def renderMessages = { attrs ->
        def messages = attrs.messages
        messages.eachWithIndex { message, counter ->
            out << g.render(template: '/status/statusMessages', model: [statusMessage: message, messageCounter: counter])
        }
    }

    def renderLikes = { attrs ->
        def likedPeople

        if (attrs.message)
            likedPeople = attrs.message.liked

        out << g.render(template: '/status/statusLikes', model: [likes: likedPeople])
    }
}
