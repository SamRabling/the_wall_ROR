class Message < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :message, presence: true, length: {minimum: 20}
end
