require 'transmission_api'

TransmissionApi.configure( {
  url: 'http://127.0.0.1:9091/transmission/rpc',
  fields: TransmissionApi::TORRENT_FIELDS,
  basic_auth: { :username => 'transuser', :password => 'transpass007' },
  session_id: "NOT-INITIALIZED",
  debug_mode: true
})