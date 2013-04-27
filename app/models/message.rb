class Message
  include Mongoid::Document
  include Mongoid::Timestamps
  field :content, type: String
  validates_presence_of :content 
  belongs_to :user
end
