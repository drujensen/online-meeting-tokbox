div.container
div.row
  div.col
    h2 = room.name.not_nil!.capitalize
div.row
  div.col
    video.local autoplay="true"
  div.col
    video.remote autoplay="true"
