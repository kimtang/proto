module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    watch:{
      main1:{files:['example.q','proto.q'],tasks:['qshell:main1'],options:{spawn:false,atBegin:true,interrupt:true}},
      main2:{files:['example2.q','proto.q'],tasks:['qshell:main2'],options:{spawn:false,atBegin:true,interrupt:true}},
      test1:{files:['test/main.q','proto.q'],tasks:['qshell:test1'],options:{spawn:false,atBegin:true,interrupt:true}}

    },
    qshell:{
      main1: {
        command: 'q'
,        args:['example.q','-p','8888']
      },
      main2: {
        command: 'q',
        args:['example2.q','-p','8889']
      },
      test1: {
        command: 'q',
        args:['main.q','-p','7777'],
        options:{execOptions:{cwd:'test'}}
      }
    },
    concurrent:{
      main1:{options:{logConcurrentOutput: true},tasks:['watch:main1','watch:test1']},
      test1:{options:{logConcurrentOutput: true},tasks:['watch:test1']}
    }
  });



  // Load the Grunt plugins.
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-qshell');
  grunt.loadNpmTasks('grunt-concurrent');

  // Register the default tasks.
  grunt.registerTask('default', ['concurrent:main1']);
  grunt.registerTask('test', ['concurrent:test1']);
};
