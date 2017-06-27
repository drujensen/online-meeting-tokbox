- active = context.request.path == "/" ? "active" : ""
a class="nav-item #{active}" href="/" Home
- active = context.request.path == "/rooms" ? "active" : ""
a class="nav-item #{active}" href="/rooms" Rooms
