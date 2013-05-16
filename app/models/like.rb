class Like
  include Mongoid::Document

  field :vote, type: Boolean

  scope :positives, where(vote: true)
  scope :negatives, where(vote: false)

  belongs_to :user
  belongs_to :torrent
end
