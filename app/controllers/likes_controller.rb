class LikesController < ApplicationController
  before_filter :find_like
  layout false

  def like
    @like.update_attribute(:vote, true)
    render json: format_response
  end

  def unlike
    @like.update_attribute(:vote, false)
    render json: format_response
  end

  private
    def find_like
      @like = Like.find_by(torrent_id: params[:id], user: current_user)
      unless @like
        torrent = Torrent.find(params[:id])
        @like = torrent.likes.new(user: current_user)
      end
    end
    
    def format_response
      likes = @like.torrent.likes
      result = {false: 0, true: 0}
      likes.each do |l|
        result[l.vote.to_s.to_sym] += 1
      end
      result
    end
end