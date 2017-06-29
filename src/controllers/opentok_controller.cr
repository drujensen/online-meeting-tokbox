require "jwt"

class OpentokController < Kemalyst::Controller
  API_KEY = "45902462"
  API_SECRET = "e9e047be25453f4e557aaebd0a83da265af8046d"
  TOKEN_SENTINEL = "T1=="
  
  def token
    json({token: create_jwt}.to_json)
  end
  
  def authenticate
    headers = HTTP::Headers.new
    headers.add("Accept", "application/json")
    headers.add("X-OPENTOK-AUTH", create_jwt)
    response = HTTP::Client.post("https://api.opentok.com/session/create", 
                                 headers: headers,
                                 body: "p2p.preference=enabled")
    results = JSON.parse(response.body)
    result = results[0].as_h
    result["token"] = generate_token(result)
    json result.to_json
  end

  private def create_jwt
    payload = { 
      iss: API_KEY,
      iat: Time.now.epoch,
      exp: Time.now.epoch + 180
    }
    token = JWT.encode(payload, API_SECRET, "HS256")
  end

  private def generate_token(result)
    session_id = result["session_id"]

    data_params = {
      "role" => "publisher",
      "session_id" => session_id.to_s,
      "create_time" => Time.now.epoch.to_s,
      "nonce" => Random.rand.to_s
    }

      data_string = HTTP::Params.encode(data_params)
      meta_string = HTTP::Params.encode({
        "partner_id" => API_KEY,
        "sig" => OpenSSL::HMAC.hexdigest(:sha1, API_SECRET, data_string)
      })

      TOKEN_SENTINEL + Base64.strict_encode(meta_string + ":" + data_string)
  end
end
