navigator.getUserMedia = navigator.getUserMedia ||
  navigator.webkitGetUserMedia || navigator.mozGetUserMedia;

var server;

function handleError(error) {
  if (error) {
    alert(error.message);
  }
}

function showPublisher(stream) {
  var container = document.querySelector(".video-container");
  var video = document.createElement("video");
  video.src = window.URL.createObjectURL(stream);
  video.className = "publisher"
  video.style.width = "50%"
  video.style.height = "50%"
  container.appendChild(video);
  video.play();
}

function startSharing() {
  navigator.getUserMedia({audio: true, video: true}, showPublisher, handleError);
  setupSignalingServer();
}

function setupSignalingServer() {
  server = new WebSocket("wss://" + location.hostname + ":" + location.port);

  server.onmessage = function (event) {
    var message = JSON.parse(event.data);
  };
}
