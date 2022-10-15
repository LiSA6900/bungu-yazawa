class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :inquiries, dependent: :destroy
  has_many :notifications, dependent: :destroy
  
  #ゲストログインをするための新規登録のデータ登録
  def self.guest
    find_or_create_by!(email: 'guest@test.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.customer_id = '1'
      customer.last_name = 'ゲスト'
      customer.first_name = 'さん'
      customer.last_name_kana = 'ゲスト'
      customer.first_name_kana = 'サン'
      customer.postal_code = '000-0000'
      customer.address = 'サンプル0-0'
      customer.telephone_number = '000-0000-0000'
    end
  end
  
end
