div.row
  div.col-sm-11
    h2 Rooms
  div.col-sm-1
    a.btn.btn-success.btn-xs href="/rooms/new" New
div.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Actions
    tbody
    - rooms.each do |room|
      tr
        td = room.name
        td
          span
            a.btn.btn-primary.btn-xs href="/rooms/#{ room.id }" join
            a.btn.btn-success.btn-xs href="/rooms/#{ room.id }/edit" edit
            a.btn.btn-danger.btn-xs href="/rooms/#{ room.id }?_method=delete" onclick="return confirm('Are you sure?');" delete

