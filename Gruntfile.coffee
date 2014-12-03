module.exports = (grunt) ->
  @loadNpmTasks "grunt-contrib-clean"
  @loadNpmTasks "grunt-contrib-coffee"
  @loadNpmTasks "grunt-contrib-copy"
  @loadNpmTasks "grunt-contrib-watch"
  @loadNpmTasks "grunt-contrib-connect"
  @loadNpmTasks "grunt-bower-concat"
  @loadNpmTasks "grunt-contrib-concat"

  grunt.initConfig
    clean: ['out/*', 'build/*']

    bower_concat:
      all:
        dest: 'build/script/_bower.js'
        cssDest: 'build/style/_bower.css'

    coffee:
      compile:
        files:
          'build/script/coffee.js' : 'src/script/*.coffee'
        options:
          bare: true

    concat:
      out:
        src: 'build/script/**/*.js'
        dest: 'out/script/out.js'

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
      copy:
        files: ['src/index.html', 'src/**/*.js']
        tasks: ['copy']
      coffee:
        files: 'src/script/*.coffee'
        tasks: ['coffee']
      concat:
        files: 'build/script/*'
        tasks: ['concat']
        options:
          livereload: true

  grunt.registerTask 'serve', () ->
    grunt.task.run [
      'clean',
      'bower_concat'
      'coffee',
      'copy',
      'concat'
      'connect',
      'watch'
    ]