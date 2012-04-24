define ["cs!views/my_goals", "jquery", "backbone", "jquery-mobile"], (MyGoalsView, $, Backbone) ->

    UserGoalRouter = Backbone.Router.extend
        routes:
            "goals/": "user_goals"
            "goals/:id/": "getUserGoal"

        getUserGoal: (id) ->
            console.log "Getting a goal"

        user_goals: ->
            my_goals_view = new MyGoalsView
            my_goals_view.render()
            my_goals_divs = $('#my-goals')
            if my_goals_divs.length is 0
                $('body').append(my_goals_view.$('#my-goals'))
            # Otherwise replace existing.
            $.mobile.changePage('#my-goals',{transition: 'slideup', reverse: false, changeHash: false})

        root: ->
            $.mobile.changePage 'goals'

    UserGoalRouter

