module Sproxy
  class Connection < EventMachine::Connection
    def initialize(options = {})
      if options[:related_connection]
        @related_connection = options[:related_connection]
      else
        addr = options[:target_addr]
        port = options[:target_port]
        opts = {related_connection: self}
        @related_connection = EventMachine.connect(addr, port, Connection, opts)
      end

      super
    end

    def receive_data(data)
      @related_connection.send_data(data)
    end

    def unbind
      @related_connection.close_connection
    end
  end
end