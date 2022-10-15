class Inquiry < ApplicationRecord
    belongs_to :user
    has_many :notifications, dependent: :destroy
    has_many :schedules, dependent: :destroy
    
    has_many_attached :images
    
    enum order_status: { unconfirmed: 0, not_received: 1, order_received: 2, done: 3 }
    
end
