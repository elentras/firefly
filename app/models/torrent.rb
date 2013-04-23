# t.string    :name
# t.string    :remote_file_url
# t.datetime  :launched_at        => addedDate: 1358981190
# t.datetime  :finished_at
# t.integer   :transmission_id    => id: 16
# t.integer   :status             =>  isFinished: false
# t.integer   :rating_download    =>  rateDownload: 0
# t.integer   :rating_upload      =>  rateUpload: 0
# t.integer   :size_done          =>  files.sum(&:bytesCompleted: 0)
# t.integer   :percant_done       =>  percentDone: 0
# t.integer   :size_total         =>  totalSize: 367528356
# 
# t.integer   :user_id
# t.string    :file
# t.text      :description
# t.integer   :category_id
# t.integer   :views
# t.integer   :times_completed
# t.integer   :leechers
# t.integer   :seeders
class Torrent
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  
  field :transmission_id, type: String
  field :hash_string, type: String
  field :name, type: String
  field :is_finished, type: Integer
  field :rate_download, type: Integer
  field :rate_upload, type:  Integer
  field :percent_done, type: Float
  field :total_size, type: Integer
  belongs_to   :user

  UPDATE_KEYS = [:percent_done, :total_size, :rate_upload, :rate_download, :is_finished]

  validates :file, presence: true
  
  mount_uploader :file, TorrentFileUploader
  
  # attr_accessible :name, :remote_file_url, :launched_at, :finished_at,
#     :transmission_id, :status, :rating_download, :rating_upload, :size_done,
#     :percant_done, :size_total, :user_id, :file, :description, :category_id,
#     :views, :times_completed, :leechers, :seeders, :assets_attributes

  belongs_to :user  # This is only set for the first few days, so the administrator can police new uploads
  belongs_to :category

  def get_transmission_infos
    file_path = "http://127.0.0.1:3000" + self.file_url
    result = TransmissionApi::Torrent.create(file_path)

    proper_params = {transmission_id: result['id'], hash_string: result['hashString'] }
    self.update_attributes(proper_params)
    self.update_infos(result['hashString'])
  end
  
  def update_infos(force_id = nil)
    id = force_id ? force_id : self.hash_string
    datas = TransmissionApi::Torrent.find(id)
    elements =  datas.reject { |k, v| !UPDATE_KEYS.include? k }
    self.update_attributes(elements)
  end
end
