class User < ApplicationRecord
    validates :name, :email, presence: true, uniqueness: true
    validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/} 
end
