$(document).on('turbolinks:load', function() {
  if (!$('#edit_user').length) return;

  $('.change-password-toggle').click(function(event) {
  	event.preventDefault();
    $(this).hide();
    $('.change-password').toggle();
  });
});
