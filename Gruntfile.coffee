module.exports = (grunt) ->
  @loadNpmTasks "grunt-contrib-clean"
  @loadNpmTasks "grunt-contrib-coffee"
  @loadNpmTasks "grunt-contrib-copy"
  @loadNpmTasks "grunt-contrib-watch"


  grunt.initConfig
    coffee:
      compile:
        files:
          'out/script/out.js' : 'src/script/*.coffee'
        options:
          bare: true

    clean: ['out/*']
    
    copy:
      main:
        files:
          [{ expand: true, cwd: 'src', src: ['index.html', '**/*.js'], dest: 'out/'}]

    watch:
      copy:
        files: ['src/index.html', 'src/**/*.js']
        tasks: ['copy']
      coffee:
        files: 'src/script/*.coffee'
        tasks: ['coffee']

  grunt.registerTask 'serve', () ->
    grunt.task.run [
      'clean',
      'coffee',
      'copy',
      'watch'
    ]