class SignalingSocket < Kemalyst::WebSocket
  @sockets = [] of HTTP::WebSocket

  def call(socket : HTTP::WebSocket)
    logger.info("SignalingSocket Called!")
    @sockets.push socket
    socket.on_message do |message|
      @sockets.each do |a_socket|
        a_socket.send message.to_json
      end
    end
  end
end
