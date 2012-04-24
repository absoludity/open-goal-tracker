require ["cs!routers/user_goal", "jquery", "jquery-mobile"], (UserGoalRouter, $) ->

    module "UserGoalRouter routes"

    # https://github.com/cjohansen/sinon-qunit/issues/3
    #asyncTest "renders my goals view to the document", 1, ->
    #    router = new UserGoalRouter()

    #    $('body').live 'pageinit', ->
    #        debugger
    #        router.user_goals()

    #    setTimeout(->
    #        my_goals = $('div#my-goals ul')
    #        equal(my_goals.length, 1)
    #        start()
    #    , 10)

    #asyncTest "routes goals/ to user_goals", 1, ->
    #    #$.mobile.hashListeningEnabled = false
    #    #$.mobile.pushStateEnabled = false
    #    router = new UserGoalRouter()
    #    Backbone.history.start({silent:true})

    #    setTimeout(->
    #        start()
    #        route_spy = sinon.spy()
    #        router.bind "route:user_goals", route_spy

    #        router.navigate("goals/", true)

    #        ok(route_spy.called)
    #    , 10)
    #    Backbone.history.stop()
