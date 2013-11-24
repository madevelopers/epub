path = require 'path'

module.exports = (grunt) ->
    grunt.initConfig
        less:
            development:
                options:
                    paths: ['styles']
                files:
                    src: 'styles/main.less'
                    dest: 'test/styles.css'
        watch:
            styles:
                files: 'styles/*.less',
                tasks: ['less'],
                options:
                    spawn: false

    grunt.event.on 'watch', (action, filepath) ->
        grunt.config ['less', 'development', 'files'], [{
            src: 'styles/main.less'
            dest: 'test/styles.css'
        }]

    grunt.loadNpmTasks 'grunt-contrib-less'
    grunt.loadNpmTasks 'grunt-contrib-watch'

    grunt.registerTask 'default', ['watch']
