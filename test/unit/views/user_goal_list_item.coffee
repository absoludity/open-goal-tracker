require ["cs!models/user_goal", "cs!views/user_goal_list_item"], (UserGoalModel, UserGoalListItemView) ->

    module "UserGoalListItem View"

    test "container is a list item", ->
        view = new UserGoalListItemView

        equal("LI", view.el.tagName)

    test "render returns view", ->
        goal = new UserGoalModel goal: "play the guitar"
        view = new UserGoalListItemView model: goal

        result = view.render()

        equal(view, result)

    test "renders goal", ->
        goal = new UserGoalModel goal: "play the guitar"
        view = new UserGoalListItemView model: goal

        view.render()

        equal('I want to play the guitar.\n',
            view.el.innerHTML)
