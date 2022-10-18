class Inquiry < ApplicationRecord
    belongs_to :customer
    has_many :notifications, dependent: :destroy
    has_many :schedules, dependent: :destroy
    
    validates :title, presence: true
    validates :body, presence: true
    
    has_many_attached :images
    
    enum order_status: { unconfirmed: 0, not_received: 1, order_received: 2, done: 3 }
    
    def get_profile_image(width, height)
      profile_image.variant(resize_to_limit: [width, height]).processed
    end
    
end
