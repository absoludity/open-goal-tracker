define ["cs!models/user_goal", "order!backbone", "order!backbone.localStorage" ], (UserGoalModel, Backbone) ->
    UserGoalCollection = Backbone.Collection.extend(

        localStorage: new Backbone.LocalStorage "UserGoals"

        model: UserGoalModel

        url: '/goals/'

        inprogress: ->
            @filter (user_goal) ->
                user_goal.get('status') is UserGoalModel.STATUS_INPROGRESS

    )
    UserGoalCollection
