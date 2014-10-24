module RGBController
  class Server

    require 'socket'
    require 'serialport'

    def initialize(opts = {})
      # Define defaults
      serial        = opts[:serial] |= true
      serial_port   = opts[:serial_port]
      serial_port   = findSerial if serial && serial_port.nil?
      tcp_port      = opts[:tcp_port] |= 2000

      sp = openSerial(serial_port) if serial

      server = TCPServer.new tcp_port # Server bind to port 2000

      # Add exit trap
      trap("SIGINT") {exit!}

      loop do
        # Wait for a client to connect
        client = server.accept
        puts "Client connected..."

        while line = client.gets
          break if(line.chomp == "q")
          sp.write(line.chomp) if serial
          puts line.chomp.unpack("C*").join(",")

        end
        client.close
        puts "Client disconnected..."
      end
    end

    def findSerial
      # Sane default for now
      "/dev/ttyACM0"
    end

    def openSerial(port)
      SerialPort.new(port, 9600, 8, 1, SerialPort::NONE)
    end
  end
end
