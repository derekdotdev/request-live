$(document).on('turbolinks:load', function() {
  if (!$('.sign-up').length) return;

  $('.sign-up .email.button').on('click', function() {
    $('.email.button').hide();
    $('.facebook.button').hide();
    $('.title').text('Sign up with Request Live.');
    $('.sub-title').hide();
    $('.email.form').show();
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
