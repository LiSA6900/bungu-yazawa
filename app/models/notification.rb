class Notification < ApplicationRecord
    belongs_to :user
    belongs_to :inquiry
    belongs_to :admin
end
