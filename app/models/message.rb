class Message
  include Mongoid::Document
  include Mongoid::Timestamps
  field :content, type: String
  validates_presence_of :content
  default_scope desc(:created_at)
  belongs_to :user
end
