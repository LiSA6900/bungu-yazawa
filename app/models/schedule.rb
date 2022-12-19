class Schedule < ApplicationRecord
  belongs_to :admin
    
  validates :title, presence: true
  validates :start_time, presence: true
    
end
