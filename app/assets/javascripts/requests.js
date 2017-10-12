$(document).ready(function() {
  var requestCount = document.getElementsByClassName('request-row').length;

  if (requestCount && window.location.pathname === '/requests') {
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
          var notification = data.request.artist + ' - ' + data.request.title
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

$(document).ready(function() {
  if (window.location.pathname === '/requests/new' || window.location.pathname === '/requests/new#' || window.location.pathname === '/requests/new#_=_') {
    $("#add-comment").click(function(event) {
      event.preventDefault();
      $(this).hide();
      $('#request_comments').toggle('fast');
      $('.send').css('margin-top', '-10px');
    });
  }
});

$(document).ready(function() {
  if (window.location.pathname === '/thank-you') {
    $('#follow').click(function(event) {
      $('.social-icons').toggle('fast');
    });
  }
});

