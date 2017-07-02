require "../src/controllers/*"
require "../src/sockets/*"

include Kemalyst::Handler

get "/", SignalingSocket
get "/", HomeController, :index

# resource Demo
resources Room


