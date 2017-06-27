function hasUserMedia() {
  navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia
    || navigator.mozGetUserMedia || navigator.msGetUserMedia;
  return !!navigator.getUserMedia;
}

if (hasUserMedia()) {
  navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia
    || navigator.mozGetUserMedia || navigator.msGetUserMedia;

  //get both video and audio streams from user's camera
  navigator.getUserMedia({ video: true, audio: true }, function (mediaStream) {
    var localVideo = document.querySelector('.local');

    //insert stream into the video tag
    attachMediaStream(localVideo, mediaStream);
  }, function (err) {});

}else {
  alert("Error. WebRTC is not supported!");
}
