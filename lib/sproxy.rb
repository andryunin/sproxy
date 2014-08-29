require 'sproxy/version'

require 'eventmachine'
require 'thor'

module Sproxy
  autoload :CLI,        "sproxy/cli.rb"
  autoload :Connection, "sproxy/connection.rb"

  # Register event machine callbacks
  # This method Should be run inside EM loop
  #
  # @param target_addr [String] addr to forward packages
  # @param target_port [Fixnum] port to forward packages
  # @param from_addr   [String] addr to bind
  # @param from_port   [Fixnum] port to bind
  def self.start(target_addr, target_port, from_addr, from_port)
    EventMachine.start_server from_addr, from_port, Connection, target_addr: target_addr, target_port: target_port
  end

  # Run Sproxy as application: starts EM loop and run server.
  # Forwards params to Sproxy.start method
  #
  # @see Sproxy.start
  def self.application_start(target_addr, target_port, from_addr, from_port, options = {})
    EM.run do
      start(target_addr, target_port, from_addr, from_port)
    end
  end
end
