class Agent < ApplicationRecord
  has_many :posts
  belongs_to :user
end
