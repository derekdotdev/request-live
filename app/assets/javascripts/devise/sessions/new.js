$(document).on('turbolinks:load', function() {
  if (!$('.sign-in').length) return;

  $('.sign-in.email.button').on('click', function() {
    $('.email.button').hide();
    $('.facebook.button').hide();
    $('.email.sign-in.form').show()
    $('.greeting').hide()
    $('.title').text('Sign in with your email on Request Live.');
    $('.sub-title').hide();
  });
});
