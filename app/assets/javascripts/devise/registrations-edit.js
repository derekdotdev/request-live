$(document).on('turbolinks:load', function() {
  if (!$('#edit_user').length) return;

  $('.toggle-pw-edit').click(function(event) {
  	event.preventDefault();
    $('.password-edit').toggle();
  });
});
