require ["cs!models/user_goal"], (UserGoalModel) ->

  module "UserGoalModel Model"

  test "default values", ->
    user_goal = new UserGoalModel

    equal("empty goal...", user_goal.get 'goal')
    equal(UserGoalModel.STATUS_INPROGRESS, user_goal.get 'status')

  test "initialising with values", ->
      user_goal = new UserGoalModel
          goal: "play the guitar"
          status: UserGoalModel.STATUS_COMPLETED

      equal("play the guitar", user_goal.get 'goal')
      equal(UserGoalModel.STATUS_COMPLETED, user_goal.get 'status')

  test "goal cannot be empty", ->
      user_goal = new UserGoalModel
      spy = new sinon.spy
      user_goal.bind 'error', spy

      user_goal.set goal: ""

      ok(spy.calledOnce)
      equal(
          "A UserGoalModel should always have goal text set.",
          spy.getCall(0).args[1])
