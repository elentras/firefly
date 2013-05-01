require 'astrobot'

Astrobot.configure( {
  url: Gaston.transmission.url,
  fields: Astrobot::TORRENT_FIELDS,
  basic_auth: { :username => Gaston.transmission.username, :password => Gaston.transmission.password },
  session_id: "NOT-INITIALIZED",
  debug_mode: Gaston.transmission.debug_mode
})
