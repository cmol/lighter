module RGBController
  class LampControl

    def initialize(opts = {})
      # Connect to the server and save the socket
      @sock = TCPSocket.new opts["address"], opts["port"]
    end

    def fade
      raise NotYetImplemented
    end

    def set
      raise NotYetImplemented
    end
  end
end
