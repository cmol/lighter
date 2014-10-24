module RGBController
  class LampControl

    def initialize(opts = {})
      # Connect to the server and save the socket
      @sock = TCPSocket.new opts[:address], opts[:port]
    end

    def fade(lamps, length, cols)
      data = [0b10000001, cols[0].to_i, cols[1].to_i, cols[2].to_i, length]
      @sock.puts(data.pack("CCCCC"))
    end

    def set
      raise NotYetImplemented
    end
  end
end
