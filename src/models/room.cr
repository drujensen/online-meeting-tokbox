require "kemalyst-model/adapter/mysql"

class Room < Kemalyst::Model 
  adapter mysql

  # id : Int64 primary key is created for you
  field name : String
  field slug : String
  timestamps
end
