class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # passive_notifications：相手からの通知。ユーザーを削除したとき、同時に通知も削除したいので、 dependent: :destroyを追加。
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
 
  has_many :notifications, dependent: :destroy
  has_many :schedules, dependent: :destroy
  
end
