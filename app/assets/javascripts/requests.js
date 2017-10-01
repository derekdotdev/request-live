$(document).ready(function() {
  if (window.location.pathname === '/requests') {
  	requestPermission();
  }

  function handleResponse(result) {
  	if (result !== 'granted') {
  		return alert('please enable notifications');
  	}
  
  	setInterval(checkForRequests, 3000)
  }

  function checkForRequests() {
  	var requestCount = document.getElementsByClassName('request-row').length;

  	$.ajax({
      type: 'GET',
      dataType: 'json',
      url: '/requests.json?request_count=' + requestCount,
      success: function(data) {
      	if (data.request_count > requestCount) {
  		 		new Notification('Yo DJ! You have a new request!');	
      	}
      }
    }); 
  }

  function requestPermission() {
  	Notification.requestPermission().then(handleResponse);	
  }
});
