class Agent < ApplicationRecord
  mount_uploader :image, PhotoUploader
  
  has_many :posts,dependent: :destroy
  belongs_to :user
  
end
