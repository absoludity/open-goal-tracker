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

QUnit.config.autostart = false;

require([
    'backbone',
    'cs!test/unit/models/user_goal',
    'cs!test/unit/collections/user_goal',
    'cs!test/unit/views/user_goal_list',
    'cs!test/unit/views/user_goal_list_item',
    'cs!test/unit/views/my_goals',
    'cs!test/unit/routers/user_goal'
    ], function(){
        QUnit.start();
    });

