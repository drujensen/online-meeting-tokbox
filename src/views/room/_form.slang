- if room.errors
  ul.errors
  - room.errors.each do |error|
    li = error

- action = (room.id ? "/rooms/" + room.id.to_s : "/rooms")
form action="#{ action }" method="post"
  == csrf_tag(context)
  - if room.id
    input type="hidden" name="_method" value="patch"
  div.form-group
    input.form-control type="text" name="name" placeholder="Name" value="#{ room.name }"
  button.btn.btn-primary.btn-xs type="submit" Submit
  a.btn.btn-default.btn-xs href="/rooms" back
