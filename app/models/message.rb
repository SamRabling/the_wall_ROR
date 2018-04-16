class Message < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates presence: true, length: {minimum: 20}
end
