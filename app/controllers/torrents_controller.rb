class TorrentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_torrent, except: [:download, :new, :index, :create]
  rescue_from Errno::ECONNREFUSED, :with => :render_no_connection

  # GET /torrents
  # GET /torrents.json
  def index
    @torrents = Torrent.all
    puts "Torrents class #{@torrents.class}"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @torrents }
    end
  end

  # GET /torrents/1
  # GET /torrents/1.json
  def show
    @torrent = Torrent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @torrent }
    end
  end

  # def download
  #   @file = Asset.find(params[:id])
  #   send_file @file.attachment.path
  # end

  # GET /torrents/new
  # GET /torrents/new.json
  def new
    @torrent = current_user.torrents.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @torrent }
    end
  end

  # GET /torrents/1/edit
  def edit
    @torrent = Torrent.find(params[:id])
  end

  # POST /torrents
  # POST /torrents.json
  def create
    torrent = params[:torrent].merge({ name: params[:torrent][:file].original_filename})
    @torrent = Torrent.new(torrent)

    respond_to do |format|
      if @torrent.save!
        @torrent.get_transmission_infos
        puts @torrent.to_yaml
        format.html { redirect_to torrents_path, notice: 'Torrent was successfully created.' }
        format.json { render json: @torrent, status: :created, location: @torrent }
      else
        format.html { render action: "new" }
        format.json { render json: @torrent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /torrents/1
  # PUT /torrents/1.json
  def update
    @torrent = Torrent.find(params[:id])

    respond_to do |format|
      if @torrent.update_attributes(params[:torrent])
        format.html { redirect_to torrents_path, notice: 'Torrent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @torrent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /torrents/1
  # DELETE /torrents/1.json
  def destroy
    @torrent = Torrent.find(params[:id])
    TransmissionApi::Torrent.destroy(@torrent.transmission_id) if @torrent.transmission_id
    @torrent.destroy

    respond_to do |format|
      format.html { redirect_to torrents_path }
      format.json { head :no_content }
    end
  end

  private
    
    def find_torrent
      @torrent = Torrent.find(params[:id]) if params[:id]
      raise ActiveRecord::RecordNotFound unless @torrent
    end
    
    def find_or_build_torrent
      @torrent_file = params[:id] ? @torrent.torrent_files.find(params[:id]) : @torrent.torrent_files.build(params[:torrent_file])
    end

    def render_no_connection
      redirect_to new_torrent_path, alert: "Serveur Transmission injoignable"
    end
    
    def render_duplicate_torrent
      redirect_to new_torrent_path, alert: "Fichier torrent deja present"
    end
end
