// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks


//$(function() {
//  var blood = new Bloodhound({
//    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('title'),
//    queryTokenizer: Bloodhound.tokenizers.whitespace,
//    // `states` is an array of state names defined in "The Basics"
//    local: window.postsJSON
//  });
//  $('#bloodhound').typeahead({
//    hint: true,
//    highlight: true,
//    minLength: 1
//  }, {
//    name: 'posts',
//    source: blood,
//    templates: {
//      suggestion: function(post){
//        return "<span style='background: white;'>"+post.title+"</span>";
//      }
//    }
//  });
//}).bind('typeahead:select', function(ev, suggestion) {
//  window.location.href = "/posts/"+suggestion.id;
//});
