package org.grails.facebook.auth

import grails.plugins.springsecurity.Secured
import org.grails.facebook.FriendRequest

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured('IS_AUTHENTICATED_FULLY')
class PersonController {

    def springSecurityService
    def friendRequestService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        redirect action: 'friends'
    }

    def profile() {
        def personInstance = Person.get(springSecurityService.principal.id)
        respond personInstance
    }

    @Transactional
    def save(Person personInstance) {
        if (personInstance == null) {
            notFound()
            return
        }

        if (personInstance.hasErrors()) {
            respond personInstance.errors, view:'create'
            return
        }

        personInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'personInstance.label', default: 'Person'), personInstance.id])
                redirect personInstance
            }
            '*' { respond personInstance, [status: CREATED] }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'personInstance.label', default: 'Person'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    private boolean isMe(Person userInstance) {
        return userInstance.id == springSecurityService.principal.id
    }

    def sendFriendRequest (){

        println 'Sending Friend Request'
        def toUser = Person.get(params.id)
        def me = Person.get(springSecurityService.principal.id)

        def friendRequest = new FriendRequest()
        friendRequest.from = me
        friendRequest.to = toUser
        friendRequest.save(flush: true)

        println('Friend request sent ')
        flash.message = 'Friend request sent ! Now let\'s wait for approval... '
        redirect action: 'friends'
    }

    def friends (Integer max) {

        params.max = Math.min(max ?: 10, 100)
        def user = Person.get(springSecurityService.principal.id)
        def friendsList = user.friends
        respond  friendsList, model:[friendsListCount: user.friends.size(), friendsList:friendsList]
    }

    def acceptFriendRequest (FriendRequest friendRequestId){

        def friendRequest = FriendRequest.get(friendRequestId.id)
        def me = Person.get(springSecurityService.principal.id)
        def from = friendRequest.from

        try {
            me.friends.add(from)
            me.save(flush: true)
            from.friends.addAll(me)
            from.save(flush: true)

            def buddy = friendRequest.from.realName
            friendRequest.delete(flush: true)

            flash.success = 'Friend request from '+ buddy +' was ACCEPTED.'
            redirect action: 'friends'

        } catch (Exception e ) {
            print(e.stackTrace)
            redirect action: 'index'
        }
    }

    def denyFriendRequest (FriendRequest friendRequestId){

        def friendRequest = FriendRequest.get(friendRequestId.id)
        try {
            def buddy = friendRequest.from.realName
            friendRequest.delete(flush: true)
            flash.danger = 'Friend request from '+ buddy +' was DENIED.'
            redirect action: 'friends'

        } catch (Exception e ) {
            print(e.stackTrace)
            redirect action: 'index'
        }
    }

    def friendRequests (){
        def me = Person.get(springSecurityService.principal.id)
        def friendRequestsList = friendRequestService.friendRequestsTo(me)
        respond  friendRequestsList, model:[friendRequestsCount: friendRequestsList.size(), friendRequestsList:friendRequestsList]
    }

}
