# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

require 'net/http'
require 'uri'
require 'json'

terminal_uri = URI('http://www.wsdot.wa.gov/ferries/api/terminals/rest/terminalbasics?apiaccesscode=efa64a69-a5fe-403e-826a-d6d2b324106c')
terminal_response = JSON.parse( Net::HTTP.get(terminal_uri) )
terminal_response.each do |x|
  Terminal.create(name: x["TerminalName"], terminal_id: x["TerminalID"], abbreviation: x["TerminalAbbrev"])
end
