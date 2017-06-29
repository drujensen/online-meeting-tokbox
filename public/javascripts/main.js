// Handling all of our errors here by alerting them
function handleError(error) {
  if (error) {
    alert(error.message);
  }
}

function startSharing() {
  var room = document.getElementById('room');
  startSession(room.dataset.apiKey, room.dataset.sessionId, room.dataset.token);
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

  // Connect to the session
  session.connect(token, function(error) {
    // If the connection is successful, initialize a publisher and publish to the session
    if (error) {
      handleError(error);
    } else {
      videoshare();
    }
  });
}

function videoshare() {
  // Create a publisher
  var publisher = OT.initPublisher('publisher', {
    insertMode: 'append',
    width: '100%',
    height: '100%'
  }, handleError);

  session.publish(publisher, handleError);
}


function screenshare() {
  OT.checkScreenSharingCapability(function(response) {
    if (!response.supported || response.extensionRegistered === false) {
      alert('This browser does not support screen sharing.');
    } else if (response.extensionInstalled === false) {
      alert('Please install the screen sharing extension and load your app over https.');
    } else {
      // Screen sharing is available. Publish the screen.
      var publisher = OT.initPublisher('publisher', {
        videoSource: 'screen',
        insertMode: 'append',
        width: '100%',
        height: '100%'
      });
      session.publish(publisher, handleError)
    }
  });
}
