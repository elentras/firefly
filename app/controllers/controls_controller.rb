class ControlsController < ApplicationController
  layout false
  
  def show
    torrent = Torrent.where(id: params[:torrent_id])
    torrent.update_all(status: params[:do].to_s)
    result = TransmissionApi::Controls.do(torrent.map(&:transmission_id), params[:do])
    render json: result
  end
end