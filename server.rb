#! /usr/bin/env ruby

require 'webrick'
require 'uri'

redirect_callback = Proc.new do |_request, response|
  response.set_redirect(WEBrick::HTTPStatus::TemporaryRedirect,
                        'https://github.com/gstn-caruso/')
end

# signal handling
trap("INT") { @server.shutdown }
trap("TERM") { @server.shutdown }

begin
  @server = WEBrick::HTTPServer.new(Port: 8080, RequestCallback: redirect_callback)
  @server.start
ensure
  @server.shutdown if @server
end
