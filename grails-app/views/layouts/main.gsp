<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<g:layoutHead/>

    <g:javascript library="application"/>
    <r:require module="bootstrap"/>
    <r:require modules="face"/>

<r:layoutResources/>

    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <div class="collapse navbar-collapse blue">
                <ul class="nav navbar-nav">
                    <li ><g:link controller="status" action="index"><i class="glyphicon glyphicon-home"></i> <g:message code="index.home.label" /></g:link></li>
                    <li ><g:link controller="person" action="friends"><g:message code="person.my.friends.label" /></g:link></li>
                    <li ><g:link controller="person" action="friendRequests"><g:message code="person.friend.requests.label" /></g:link></li>
                    <li ><g:link controller="chat" action="index"><g:message code="index.group.chat.label" /></g:link></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <sec:ifLoggedIn>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                Hi, <sec:username/>
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <g:link controller="person" action="profile"><i class="glyphicon glyphicon-user"></i> <g:message code="index.profile.label" /></g:link>
                                </li>
                                <li>
                                    <g:link controller="logout" action="index"><i class="glyphicon glyphicon-arrow-right"></i> <g:message code="index.logout.label" /></g:link>
                                </li>
                            </ul>
                        </li>
                    </sec:ifLoggedIn>
                    <sec:ifNotLoggedIn>
                        <li>
                            <g:link controller="login"><g:message code="index.please.login.label" /></g:link>
                        </li>
                    </sec:ifNotLoggedIn>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>

</head>
<body class="body">
<g:layoutBody/>
<r:layoutResources/>
</body>
</html>
