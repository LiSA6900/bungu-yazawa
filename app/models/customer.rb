class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :inquiries, dependent: :destroy
  has_many :notifications, dependent: :destroy
  
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true

  
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
  
  # is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super &&  (is_deleted == false)
  end
end
