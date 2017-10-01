$(document).ready(function() {
  if (window.location.pathname === '/requests') {
  	requestPermission();
  }
	
	var requestCount = document.getElementsByClassName('request-row').length;

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
      url: '/requests.json?request_count=' + requestCount,
      success: function(data) {
      	if (data.request_count > requestCount) {
      		requestCount = data.request_count;
  		 		new Notification('Yo DJ! You have a new request!');	
  		 		window.location.reload();
      	}
      }
    }); 
  }

  function requestPermission() {
  	Notification.requestPermission().then(handleResponse);	
  }
});
