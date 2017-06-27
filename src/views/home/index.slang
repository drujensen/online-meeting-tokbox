h2 Online Meeting Club

div
  p Create a new room
  form action="/rooms" method="POST"
    == csrf_tag(context)
    input type="text" name="name" placeholder="Room Name"
