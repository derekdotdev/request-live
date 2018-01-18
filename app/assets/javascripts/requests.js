$(document).ready(function() {
  // Don't run this code if not on the request index page
  var requestCount = $('.request-row').length;
  var onRequestIndexPage = $('.request-index').length;
  if (requestCount && onRequestIndexPage) {
    requestPermission();
  }

  function handleResponse(result) {
  	if (result !== 'granted') {
  		return alert('please enable notifications');
  	}

  	setInterval(checkForRequests, 3000)
  }

  function checkForRequests() {
  	$.ajax({
      type: 'GET',
      dataType: 'json',
      url: '/requests',
      success: function(data) {
      	if (data.request_count > requestCount) {
      		requestCount = data.request_count;
          var notification = data.request.artist + ' - ' + data.request.title;
  		 		new Notification(notification);
  		 		window.location.reload();
      	}
      }
    });
  }

  function requestPermission() {
  	Notification.requestPermission().then(handleResponse);
  }
});

$(document).on('turbolinks:load', function() {
  // Don't run this code if not on the new request page
  var onNewCommentPage = $('.send').length;
  if (!onNewCommentPage) return;

  $('#add-comment').click(function(event) {
    $(this).hide(); // hide the '+ Add Comment' link/button

    $('#request_comments').toggle('fast');
    $('.send').css('margin-top', '-10px');
  });
});


$(document).ready(function() {
  // Don't run this code if not on the thank you page
  var onThankYouPage = $('.thank-you').length;
  if (!onThankYouPage) return;

  $('#follow').click(function(event) {
    $('.social-icons').toggle('fast');
  });
});
