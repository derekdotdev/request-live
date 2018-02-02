// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require semantic-ui
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// Initialize Semantic-ui dropdowns when page loads
$(document).on('turbolinks:load', function() {
  $('.ui.dropdown').dropdown();
  $('.thank-you .modal').modal('attach events', '.share', 'show');


  $('.sign-up .email.button').on('click', function() {
    $('.email.button').hide();
    $('.facebook.button').hide();
    $('.title').text('Sign up with Request Live.');
    $('.sub-title').hide();
    $('.email.form').show();
  });

  $('.sign-in.email.button').on('click', function() {
    $('.email.button').hide();
    $('.facebook.button').hide();
    $('.email.sign-in.form').show()
    $('.greeting').hide()
    $('.title').text('Sign in with your email on Request Live.');
    $('.sub-title').hide();
  });



  $('.cancel').on('click', function() {
    // Reset the sign up form when the cancel button is clicked
    var inputs = ['#user_email', '#user_password', '#user_password_confirmation']
    inputs.forEach(function(selector) {
      document.querySelector(selector).value = '';
    });

    $('.email.button').show();
    $('.facebook.button').show();
    $('.title').text('Welcome! Sign up to get started.');
    $('.sub-title').show();
    $('.email.form').hide();
  });

  if ($('#error_explanation').children().length) {
    $('.email.button').hide();
    $('.facebook.button').hide();
    $('.title').text('Sign up with Request Live.');
    $('.sub-title').hide();
  }
});
