define ["underscore", "backbone", "jquery", "text!templates/pages/my_goals.html", "cs!collections/user_goal", "cs!views/user_goal_list"], (_, Backbone, $, MyGoalsTemplate, UserGoalCollection, UserGoalListView) ->

    MyGoalsView = Backbone.View.extend({

      initialize: ->
          # Get goals for user to pass in to list view.
          @goal_list_view = new UserGoalListView
          @goal_list_view.collection.fetch()

      render: (event) ->
        $(@el).html MyGoalsView.template()
        @goal_list_view.render()
        @$('#list-placeholder').replaceWith(@goal_list_view.el)
        this

    }, {
        template: _.template MyGoalsTemplate
    })
    MyGoalsView

