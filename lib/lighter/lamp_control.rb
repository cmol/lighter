module Lighter
  class LampControl

    def initialize(opts = {})
      # Connect to the server and save the socket
      @sock = opts[:socket]
    end

    def fade(lamps, length, cols)
      send(fadeData(lamps,length,cols))
    end

    def set(lamps, cols)
      send(setData(lamps, cols))
    end

    private

    def mode(lamps, mode)
      raise ArgumentError if lamps < 0 || lamps > 4
      (lamps << 5) | mode
    end

    def send(bytes)
      @sock.puts(bytes.pack("C*"))
    end

    def fadeData(lamps, length, cols)
      [mode(lamps,FADE), *cols, length]
    end

    def setData(lamps, cols)
      [mode(lamps,SET), *cols]
    end
  end

end
