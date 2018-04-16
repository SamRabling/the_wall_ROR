class User < ActiveRecord::Base
    has_many :comments
    has_many :messages
    validates :username, presence: true, length: {minimum: 6}, uniqueness: true
end
