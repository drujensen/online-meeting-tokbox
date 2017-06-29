javascript:
  window.onload = function () {  startSharing(); }
div.row
  div.col
    h2 = room.name.not_nil!.capitalize
div.row
  div.col
    div#video-container
#room data-api-key=api_key data-session-id=session_id data-token=token
