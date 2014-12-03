module.exports = (grunt) ->
  @loadNpmTasks "grunt-contrib-clean"
  @loadNpmTasks "grunt-contrib-coffee"
  @loadNpmTasks "grunt-contrib-copy"
  @loadNpmTasks "grunt-contrib-watch"
  @loadNpmTasks "grunt-contrib-connect"
  @loadNpmTasks "grunt-bower-concat"

  grunt.initConfig
    clean: ['out/*']
    
    bower_concat:
      all:
        dest: 'out/script/_bower.js'
        cssDest: 'out/style/_bower.css'

    coffee:
      compile:
        files:
          'out/script/out.js' : 'src/script/*.coffee'
        options:
          bare: true

    connect:
      server:
        options:
          base: 'out'
          open: true
    
    copy:
      main:
        files:
          [{ expand: true, cwd: 'src', src: ['index.html', '**/*.js', '**/*.css'], dest: 'out/'}]

    watch:
      options:
        livereload: true
      copy:
        files: ['src/index.html', 'src/**/*.js']
        tasks: ['copy']
      coffee:
        files: 'src/script/*.coffee'
        tasks: ['coffee']

  grunt.registerTask 'serve', () ->
    grunt.task.run [
      'clean',
      'bower_concat'
      'coffee',
      'copy',
      'connect',
      'watch'
    ]