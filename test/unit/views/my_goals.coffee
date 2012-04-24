require ["cs!models/user_goal", "cs!collections/user_goal", "cs!views/my_goals", "underscore"], (UserGoalModel, UserGoalCollection, MyGoalsView, _) ->

    module "MyGoals View"

    test "renders page with correct id", ->
        view = new MyGoalsView

        view.render()

        # There is only one child div.
        child_divs = view.$('> div')
        equal(1, child_divs.length)
        equal('my-goals', child_divs.attr 'id')

    test "replaces placeholder with goal list", ->
        view = new MyGoalsView
        'user-goal-list-view'

        view.render()

        # There is only one child div.
        list_views = view.$('div.user-goal-list-view')
        equal(1, list_views.length)

    # Eventually add a test showing that only
    # current users goals are rendered.

