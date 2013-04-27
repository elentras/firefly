require 'rubygems'

module Cron::Torrent
  
  def self.update
    @trans_torrents = TransmissionApi::Torrent.all
    
    @trans_torrents.each do |tt|
      begin
        torrent = Torrent.find_by(transmission_id: tt[:id])
        torrent.update_infos if torrent
      rescue Exception => e
        puts e.to_yaml
      end
    end
  end

end