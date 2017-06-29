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
    session.subscribe(event.stream, 'video-container', {
      insertMode: 'append',
      width: '50%',
      height: '50%'
    }, handleError);
  });

  // Connect to the session
  session.connect(token, function(error) {
    // If the connection is successful, initialize a publisher and publish to the session
    if (error) {
      handleError(error);
    } else {
      videoshare(session);
    }
  });
}

function videoshare(session) {
  // Create a publisher
  var publisher = OT.initPublisher('video-container', {
    insertMode: 'append',
    width: '50%',
    height: '50%'
  }, handleError);

  session.publish(publisher, handleError);
}


function screenshare(session) {
  OT.checkScreenSharingCapability(function(response) {
    if (!response.supported || response.extensionRegistered === false) {
      alert('This browser does not support screen sharing.');
    } else if (response.extensionInstalled === false) {
      alert('Please install the screen sharing extension and load your app over https.');
    } else {
      // Screen sharing is available. Publish the screen.
      var publisher = OT.initPublisher('video-container', {
        videoSource: 'screen',
        insertMode: 'append',
        width: '50%',
        height: '50%'
      });
      session.publish(publisher, handleError)
    }
  });
}
