// replace these values with those generated in your TokBox Account
var apiKey = "45902462";
var sessionId = "2_MX40NTkwMjQ2Mn5-MTQ5ODYzMDg2OTUzN35FcXA1K0xSMWF1SFpwKzRCVmMzR2YyYnJ-fg";
var token = "T1==cGFydG5lcl9pZD00NTkwMjQ2MiZzaWc9YzAzYWM2ODlhODQ4YWMwM2U0ODdmMWU3NTg2NjQ1YjMyYTEyNmFlODpzZXNzaW9uX2lkPTJfTVg0ME5Ua3dNalEyTW41LU1UUTVPRFl6TURnMk9UVXpOMzVGY1hBMUsweFNNV0YxU0Zwd0t6UkNWbU16UjJZeVluSi1mZyZjcmVhdGVfdGltZT0xNDk4NjMwODg0Jm5vbmNlPTAuMTU1MDAyMzk5MzA2MzUzMTgmcm9sZT1wdWJsaXNoZXImZXhwaXJlX3RpbWU9MTUwMTIyMjg4Mw==";

// Handling all of our errors here by alerting them
function handleError(error) {
  if (error) {
    alert(error.message);
  }
}

// (optional) add server code here
initializeSession();

function initializeSession() {
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
