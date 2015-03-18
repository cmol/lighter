module Lighter
  class LampControl

    def initialize(opts = {})
      # Connect to the server and save the socket
      @sock = opts[:socket]
    end

    def fade(lamps, length, cols)
      send([mode(lamps,FADE), *cols, length])
    end

    def set(lamps, cols)
      send([mode(lamps,SET), *cols])
    end

    private

    def mode(lamps, mode)
      raise ArgumentError if lamps < 0 || lamps > 4
      (lamps << 5) | mode
    end

    def send(bytes)
      @sock.puts(bytes.pack("C*"))
    end
  end

end
