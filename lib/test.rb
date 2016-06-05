require 'net/http'
require 'uri'
require 'json'
require 'twilio-ruby'

#################################################################

# WSF acess code = efa64a69-a5fe-403e-826a-d6d2b324106c
# http://www.wsdot.wa.gov/ferries/api/terminals/rest/terminalwaittimes?apiaccesscode=efa64a69-a5fe-403e-826a-d6d2b324106c
# /cacheflushdate
# /terminalbasics
# /terminalbasics/{TerminalID}
# /terminalbulletins
# /terminalbulletins/{TerminalID}
# /terminallocations
# /terminallocations/{TerminalID}
# /terminalsailingspace
# /terminalsailingspace/{TerminalID}
# /terminaltransports
# /terminaltransports/{TerminalID}
# /terminalverbose
# /terminalverbose/{TerminalID}
# /terminalwaittimes
# /terminalwaittimes/{TerminalID}

terminal_uri = URI('http://www.wsdot.wa.gov/ferries/api/terminals/rest/terminalbasics?apiaccesscode=efa64a69-a5fe-403e-826a-d6d2b324106c')
terminal_response = JSON.parse( Net::HTTP.get(terminal_uri) )
terminals = Hash.new()
terminal_response.each do |x|
  if x["TerminalName"]
    terminals[x["TerminalName"]] = x
  end
end
puts terminal_response.to_json

# VESSEL LOCATIONS

vessel_uri = URI('http://www.wsdot.com/ferries/vesselwatch/Vessels.ashx')
vessel_response = JSON.parse( Net::HTTP.get(vessel_uri) )
routes = Hash.new()
vessel_response["vessellist"].each do |x|
  if x["route"]
    routes[x["route"]] = x
  end
end
# puts routes.to_json

###################################################################

# put your own credentials here
account_sid = 'AC000281154101f1235722f536723d6f00'
auth_token = 'b8c26630f43bf1067535a8a747aab4e8'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

# @client.messages.create(
#   from: '+12068010606',
#   to: '+12062406461',
#   body: routes["SEA-BI"].to_s
# )
