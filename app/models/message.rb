class Message < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :user, :message, presence: true
  validates :message, presence: true, length: {minimum: 111}
end
