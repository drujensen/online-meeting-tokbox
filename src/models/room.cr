require "kemalyst-model/adapter/mysql"

class Room < Kemalyst::Model 
  adapter mysql

  field name : String
  field slug : String
  field session_id : String
  timestamps
end
