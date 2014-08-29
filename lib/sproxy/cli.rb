module Sproxy
  class CLI < Thor
    option :bind_addr, desc: "IP addr to bind", default: "0.0.0.0"
    option :bind_port, desc: "Port to listen",  default: 8080, type: :numeric

    desc 'start TARGET_ADDR TARGET_PORT', 'Run proxy server'
    def start(target_addr, target_port)
      puts "#{options[:bind_addr]}:#{options[:bind_port]} <-> #{target_addr}:#{target_port}"
    end
  end
end