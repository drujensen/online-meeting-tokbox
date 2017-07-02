navigator.getUserMedia = navigator.getUserMedia ||
  navigator.webkitGetUserMedia || navigator.mozGetUserMedia;

function handleError(error) {
  if (error) {
    alert(error.message);
  }
}

function videoshare(stream) {
  var container = document.getElementById("video-container");
  var video = document.createElement("video");
  video.src = window.URL.createObjectURL(stream);
  video.className = "OT_fit-mode-cover"
  video.style.width = "50%"
  video.style.height = "50%"
  container.appendChild(video);
  video.play();
}

function startSharing() {
  navigator.getUserMedia({video: true, audio: true}, videoshare, handleError);
}
