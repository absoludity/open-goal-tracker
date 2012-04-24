require ["cs!models/user_goal", "cs!collections/user_goal"], (UserGoalModel, UserGoalCollection) ->

    module "UserGoalCollection"

    test "UserGoalModels can be added as objects", ->
      goals = new UserGoalCollection
      equal(0, goals.length)

      goals.add goal: "play the guitar"

      equal(1, goals.length)

    test "UserGoalModels can be added as arrays", ->
      goals = new UserGoalCollection

      goals.add [
        {goal: "play the guitar"}
        {goal: "learn German"}
        ]

      equal(2, goals.length)

    test "plural goals url", ->
      goals = new UserGoalCollection

      equal('/goals/', goals.url)

      #test "inprogress returns only inprogress goals", ->
      #    goals = new UserGoalCollection
      #    goals.add [
      #        {status: UserGoalModel.STATUS_INPROGRESS}
      #        {status: UserGoalModel.STATUS_INPROGRESS}
      #        {status: UserGoalModel.STATUS_COMPLETED}
      #        ]

      #    inprogress_goals = goals.inprogress()

      #    equal(2, inprogress_goals.length)
      #    _.each inprogress_goals, (goal) ->
      #        equal(UserGoalModel.STATUS_INPROGRESS, goal.get 'status')
