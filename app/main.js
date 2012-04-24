// Open Goal Tracker
// http://opengoaltracker.org
// Copyright (c) 2012 Open Goal Tracker AUTHORS and individual contributors.
// Dual licensed under the MIT and GPL licenses.
require.config({
    baseUrl:'..',
    paths: {
        // RequireJS Plugins
        'cs': 'app/scripts/libs/requirejs/plugins/cs',
        'text': 'app/scripts/libs/requirejs/plugins/requirejs-text-min-1.0.6',
        'order': 'app/scripts/libs/requirejs/plugins/order-min-1.0.5',

        // 3rd party libs
        'backbone': 'app/scripts/libs/backbone/0.9.1-amdjs/backbone',
        'backbone.localStorage': 'app/scripts/libs/backbone/plugins/backbone.localStorage-min',
        'underscore': 'app/scripts/libs/underscore/1.3.1-amdjs/underscore',
        'jquery': 'app/scripts/libs/jquery/jquery-1.7.1.min',
        'jquery-mobile': 'app/scripts/libs/jquery.mobile-1.0.1',

        'models': 'app/scripts/models',
        'collections': 'app/scripts/collections',
        'views': 'app/scripts/views',
        'templates': 'app/scripts/templates',
        'routers': 'app/scripts/routers'

        },
    });

require(
    ['require', 'backbone', 'jquery', 'underscore' ],
    function( require, Backbone, $, _ ) {
        // framework loaded
        require(
            ['require', 'cs!routers/user_goal', 'jquery-mobile'],
            function(require, UserGoalRouter) {
                // We want to use backbones routing.
                // Bind to mobileInit?
                $.mobile.hashListeningEnabled = false;
                $.mobile.pushStateEnabled = false;

                var router = new UserGoalRouter();
                Backbone.history.start();
                $('#splash').live('pageinit', function() {
                    router.navigate('goals/', {trigger: true, replace: true});
                });
            } );
    } );
