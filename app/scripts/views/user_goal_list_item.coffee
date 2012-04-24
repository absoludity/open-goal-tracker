define ["underscore", "backbone", "jquery", "text!templates/user_goal_list_item.html"], (_, Backbone, $, UserGoalListItemTemplate) ->

    UserGoalListItemView = Backbone.View.extend({
        tagName: 'li'

        render: ->
            $(@el).html UserGoalListItemView.template user_goal: @model
            return @

    }, {
        # Compile the template function once per class.
        template: _.template UserGoalListItemTemplate
    })
    UserGoalListItemView
