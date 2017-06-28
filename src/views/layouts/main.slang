doctype html
html
  head
    title Online Meeting Club
    meta charset="utf-8"
    meta http-equiv="X-UA-Compatible" content="IE=edge"
    meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"

    link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
    link rel="stylesheet" href="/stylesheets/main.css"

  body
    div.masthead
      div.container
        nav.nav
          == render "layouts/_nav.slang"
    div.container.main
      == content

    script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
    script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
    script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"
    script src="https://static.opentok.com/v2.12.0-beta/js/opentok.min.js"
    script src="/javascripts/main.js"
