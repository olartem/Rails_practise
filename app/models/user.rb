class User < ApplicationRecord
    has_many :microposts
    validates :name, :email, presence: true, uniqueness: true
    validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/} 
end
