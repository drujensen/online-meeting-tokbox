require "jwt"

class OpenTok::OpenTok
  getter api_key : String
  getter api_secret : String

  def initialize(@api_key = "45902462", @api_secret = "e9e047be25453f4e557aaebd0a83da265af8046d")
  end
  
  def create_session
    headers = HTTP::Headers.new
    headers.add("Accept", "application/json")
    headers.add("X-OPENTOK-AUTH", create_jwt)
    response = HTTP::Client.post("https://api.opentok.com/session/create", 
                                 headers: headers,
                                 body: "p2p.preference=enabled")
    results = JSON.parse(response.body)
    return results[0]
  end
  
  def generate_token(session_id : String)
    data_params = {
      "role" => "publisher",
      "session_id" => session_id.to_s,
      "create_time" => Time.now.epoch.to_s,
      "nonce" => Random.rand.to_s
    }

    data_string = HTTP::Params.encode(data_params)
    meta_string = HTTP::Params.encode({
      "partner_id" => api_key,
      "sig" => OpenSSL::HMAC.hexdigest(:sha1, api_secret, data_string)
    })

    "T1==" + Base64.strict_encode(meta_string + ":" + data_string)
  end

  private def create_jwt
    payload = { 
      iss: api_key,
      iat: Time.now.epoch,
      exp: Time.now.epoch + 180
    }
    token = JWT.encode(payload, api_secret, "HS256")
  end
  
end
