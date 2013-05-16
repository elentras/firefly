require 'rubygems'

module Cron::Torrent
  UPDATE_KEYS = [:percent_done, :total_size, :rate_upload, :rate_download, :is_finished, :status, :transmission_id, :hash_string, :name]

  def self.update
    @trans_torrents = Astrobot::Torrent.all

    @trans_torrents.each do |tt|
      begin
        torrent = Torrent.find_by(transmission_id: tt[:id])
        if torrent
          torrent.update_infos(tt[:hash_string])
        else
          elements =  tt.reject { |k, v| !Cron::Torrent::UPDATE_KEYS.include? k }
          elements[:transmission_id] = tt[:id]
          elements[:file] = File.open("public/blank.torrent", 'r')

          torrent = Torrent.create!(elements)
          torrent.status = torrent.convert_status(elements[:status])
          torrent.save
        end
      rescue Exception => e
        puts "#{e.message}\n#{e.backtrace}"
      end
    end
  end

end