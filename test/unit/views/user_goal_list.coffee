require ["cs!models/user_goal", "cs!collections/user_goal", "cs!views/user_goal_list"], (UserGoalModel, UserGoalCollection, UserGoalListView) ->

    module "UserGoalListView", {
        setup: ->
            testLocalStorage = new Backbone.LocalStorage "TESTUserGoals"
            UserGoalCollection.prototype.localStorage = testLocalStorage

        teardown: ->
            testLocalStorage = UserGoalCollection.prototype.localStorage
            testLocalStorage.records = []
            testLocalStorage.save()
            # Hrm - running tests in the browser doesn't show TESTUserGoals
            # being deleted.
    }

    test "tests use a test local storage which is cleared", -> 
        view = new UserGoalListView
        localStorage = view.collection.localStorage
        equal("TESTUserGoals", localStorage['name'])
        equal(view.collection.localStorage.records.length, 0)

    test "container created with correct class", ->
        view = new UserGoalListView

        equal("DIV", view.el.tagName)
        equal("user-goal-list-view", view.el.className)

    test "render returns view", ->
        view = new UserGoalListView

        result = view.render()

        equal(view, result)

    test "renders goals when present", ->
        user_goals = new UserGoalCollection [
            {goal: "play the guitar"}
            {goal: "learn German"}
        ]
        view = new UserGoalListView collection: user_goals

        view.render()

        equal(1, view.$('ul').length)
        items = view.$('ul li')
        equal(3, items.length)
        equal("I want to play the guitar.\n", items[1].innerHTML)
        equal("I want to learn German.\n", items[2].innerHTML)

    test "renders expected empty result", ->
        view = new UserGoalListView

        view.render()

        equal(1, view.$('ul').length)
        items = view.$('ul li label')
        equal(1, items.length)
        equal('I want to:', items[0].innerHTML)

    test "renders after collection reset", ->
        user_goals = new UserGoalCollection [
            {goal: "play the guitar"}
            {goal: "learn German"}
        ]
        view = new UserGoalListView collection: user_goals

        user_goals.reset()

        items = view.$('ul li')
        equal(1, items.length)

    test "adding a goal updates the rendered list without render", ->
        user_goals = new UserGoalCollection [
            {goal: "play the guitar"}
            {goal: "learn German"}
        ]
        view = new UserGoalListView collection: user_goals
        view.render()
        sinon.spy view, 'render'

        user_goals.add [goal: "make a third goal"]

        items = view.$('ul li')
        equal(4, items.length)
        equal("I want to make a third goal.\n", items[3].innerHTML)
        equal(false, view.render.calledOnce)

    test "adding a goal to an empty collection renders", ->
        view = new UserGoalListView

        view.collection.add [goal: "make a first goal"]

        items = view.$('ul li')
        equal(items.length, 2)
        equal("I want to make a first goal.\n", items[1].innerHTML)

    test "filter not displayed for lte 5 goals", ->
        user_goals = new UserGoalCollection [
            {goal: "play the guitar"}
            {goal: "learn German"}
        ]

        view = new UserGoalListView collection: user_goals
        view.render()

        uls = view.$('ul[data-role=listview]')
        equal(uls.length, 1)
        ul = uls[0]
        equal(ul.getAttribute('data-filter'), 'false')

    test "filter displayed for gt 5 goals", ->
        user_goals = new UserGoalCollection [
            {goal: "play the guitar"}
            {goal: "learn German"}
            {goal: "learn French"}
            {goal: "learn Persian"}
            {goal: "learn Russian"}
            {goal: "learn Cantonese"}
        ]

        view = new UserGoalListView collection: user_goals
        view.render()

        uls = view.$('ul[data-role=listview]')
        equal(uls.length, 1)
        ul = uls[0]
        equal(ul.getAttribute('data-filter'), 'true')

    test "entering new goal adds the goal", 3, ->
        stop()
        view = new UserGoalListView
        view.render()
        view.$('#newGoalInput')[0].value = "play the guitar"

        # Why can't we stub addGoal instead - it doesn't seem
        # to get called :/
        addGoalStub = sinon.stub(view.collection, 'add', (goal_list) ->
            equal(goal_list.length, 1)
            user_goal = goal_list[0]
            equal(user_goal['goal'], "play the guitar")
            equal(view.$('#newGoalInput')[0].value, '')
            start()
        )
        view.$('#newGoalInput').trigger(
            new jQuery.Event("keypress", { keyCode: 13 }))

        setTimeout(->
            start()
        , 1000)

    test "addGoal saves the goal", 1, ->
        goal = new UserGoalModel {goal: 'play the guitar'}
        view = new UserGoalListView
        saveStub = sinon.stub goal, 'save'

        view.addGoal(goal)

        ok saveStub.calledOnce
