javascript:
  window.onload = function () {  initialize(); }
div.row
  div.col
    h2 = room.name.not_nil!.capitalize
div.row
  div.col
    div#publisher
  div.col
    div#subscriber
#room data-api-key=api_key data-session-id=session_id data-token=token
