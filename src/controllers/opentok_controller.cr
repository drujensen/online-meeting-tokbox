require "jwt"

class OpentokController < Kemalyst::Controller
  def token
    json({token: create_token}.to_json)
  end
  
  def authenticate
    headers = HTTP::Headers.new
    headers.add("Accept", "application/json")
    headers.add("X-OPENTOK-AUTH", create_token)
    response = HTTP::Client.post("https://api.opentok.com/session/create", 
                                 headers: headers,
                                 body: "p2p.preference=enabled")
    #results = JSON.parse(response.body)
    json response.body.to_s
  end

  private def create_token
    payload = { 
      iss: "45902462",
      iat: Time.now.epoch,
      exp: Time.now.epoch + 180
    }
    token = JWT.encode(payload, "e9e047be25453f4e557aaebd0a83da265af8046d", "HS256")
  end
end
