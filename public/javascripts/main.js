// Handling all of our errors here by alerting them
function handleError(error) {
  if (error) {
    alert(error.message);
  }
}


function startSession(apiKey, sessionId, token) {
  var session = OT.initSession(apiKey, sessionId);

  // Subscribe to a newly created stream
  session.on('streamCreated', function(event) {
    session.subscribe(event.stream, 'subscriber', {
      insertMode: 'append',
      width: '100%',
      height: '100%'
    }, handleError);
  });

  // Create a publisher
  var publisher = OT.initPublisher('publisher', {
    insertMode: 'append',
    width: '100%',
    height: '100%'
  }, handleError);

  // Connect to the session
  session.connect(token, function(error) {
    // If the connection is successful, initialize a publisher and publish to the session
    if (error) {
      handleError(error);
    } else {
      session.publish(publisher, handleError);
    }
  });
}

function initialize() {
  fetch('/opentok/authenticate')
  .then(
    function(response) {
      if (response.status !== 200) {
        console.log('Looks like there was a problem. Status Code: ' +
          response.status);
        return;
      }

      response.json().then(function(data) {
        startSession(data.project_id, data.session_id, data.token)
      });
    }
  )
  .catch(function(err) {
    console.log('Fetch Error :-S', err);
  });
}
