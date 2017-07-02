require "../models/room"
require "../lib/opentok"

class RoomController < Kemalyst::Controller
  def index
    rooms = Room.all
    html render("room/index.slang", "main.slang")
  end

  def show
    if room = Room.find params["id"]
      session_id = room.session_id

      opentok = OpenTok::OpenTok.new
      api_key = opentok.api_key
      token = opentok.generate_token(room.session_id.not_nil!)

      html render("room/show.slang", "main.slang")
    else
      flash["warning"] = "Room with ID #{params["id"]} Not Found"
      redirect "/rooms"
    end
  end

  def new
    room = Room.new
    html render("room/new.slang", "main.slang")
  end

  def create
    room = Room.new(params.to_h.select(["name"]))
    
    opentok = OpenTok::OpenTok.new
    result = opentok.create_session
    room.session_id = result["session_id"].to_s

    if room.valid? && room.save
      flash["success"] = "Created Room successfully."
      redirect "/rooms/#{room.id}"
    else
      flash["danger"] = "Could not create Room!"
      html render("room/new.slang", "main.slang")
    end
  end

  def edit
    if room = Room.find params["id"]
      html render("room/edit.slang", "main.slang")
    else
      flash["warning"] = "Room with ID #{params["id"]} Not Found"
      redirect "/rooms"
    end
  end
  
  def update
    if room = Room.find(params["id"])
      room.set_attributes(params.to_h.select(["name"]))
      if room.valid? && room.save
        flash["success"] = "Updated Room successfully."
        redirect "/rooms"
      else
        flash["danger"] = "Could not update Room!"
        html render("room/edit.slang", "main.slang")
      end
    else
      flash["warning"] = "Room with ID #{params["id"]} Not Found"
      redirect "/rooms"
    end
  end
  
  def delete
    if room = Room.find params["id"]
      room.destroy
    else
      flash["warning"] = "Room with ID #{params["id"]} Not Found"
    end
    redirect "/rooms"
  end
end
