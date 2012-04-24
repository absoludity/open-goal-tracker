define ["underscore", "backbone", "jquery", "text!templates/user_goal_list.html", "cs!collections/user_goal", "cs!views/user_goal_list_item"], (_, Backbone, $, UserGoalListTemplate, UserGoalCollection, UserGoalListItemView) ->

    UserGoalListView = Backbone.View.extend({
        className: 'user-goal-list-view'

        events:
            "keypress #newGoalInput": "updateOnEnter"

        initialize: ->
            @collection or= new UserGoalCollection
            @collection.bind('add', @.addGoal, @)
            @collection.bind('reset', @.render, @)

        render: (event) ->
          $(@el).html UserGoalListView.template(
              user_goals: @collection.models
              item_template: UserGoalListItemView.template
              filter: @collection.length > 5
          )
          this

        addGoal: (user_goal) ->
            user_goal.save()
            uls = @$('ul')
            if uls.length == 1
                new_item = new UserGoalListItemView({model: user_goal})
                uls.append(new_item.render().el)
                # XXX How to test - current user_goal_list tests
                # don't need to render the list into doc, but
                # without doing so, the list is never marked up as a listview.
                if uls.hasClass('ui-listview')
                    uls.listview('refresh')
            else
                @render()

        updateOnEnter: (e) ->
            if e.keyCode == 13
                input = @$('#newGoalInput')[0]
                goal_text = input.value
                input.value = ''

                @collection.add [
                    {goal: goal_text}
                    ]
    }, {
        template: _.template UserGoalListTemplate
    })
    UserGoalListView
