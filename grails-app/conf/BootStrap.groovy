import org.grails.facebook.auth.*
import org.grails.facebook.*

class BootStrap {

    def springSecurityService

    def init = { servletContext ->

        createPeople()
        createFriendRequests()

    }

    def destroy = {
    }

    private void createPeople() {
        def userRole = new Person(authority: 'ROLE_USER').save()

        String password = springSecurityService.encodePassword('pass')

        def user = new Person(
                avatar: 'rocky.jpg',
                username: 'rocky',
                realName: 'Rocky Balboa',
                password: password,
                enabled: true).save()
        PersonAuthority.create user, userRole, true

        user = new Person(
                avatar: 'ali.jpg',
                username: 'ali',
                realName: 'Mohamed Ali',
                password: password,
                enabled: true).save()
        PersonAuthority.create user, userRole, true

        user = new Person(
                avatar: 'tyson.jpeg',
                username: 'tyson',
                realName: 'Mike Tyson',
                password: password,
                enabled: true).save()
        PersonAuthority.create user, userRole, true

        user = new Person(
                avatar: 'chuck.jpg',
                username: 'chuck',
                realName: 'Chuck Norris',
                password: password,
                enabled: true).save()
        PersonAuthority.create user, userRole, true

    }

    private createFriendRequests() {
        def userChuck = Person.findByUsername("chuck")
        def userRocky = Person.findByUsername("rocky")
        def userTyson = Person.findByUsername("tyson")

        new FriendRequest(
                from: userRocky,
                to: userChuck
        ).save(failOnError: true)

        new FriendRequest(
                from: userTyson,
                to: userChuck
        ).save(failOnError: true)
    }
}
