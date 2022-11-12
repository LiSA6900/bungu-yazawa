class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :inquiries, dependent: :destroy
  # active_notifications：自分からの通知。ユーザーを削除したとき、同時に通知も削除したいので、 dependent: :destroyを追加。
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  
  
  validates :last_name, presence: true
  validates :first_name, presence: true
  katakana = /\A[ァ-ヶー－]+\z/ # 全角カタカナ
  validates :last_name_kana, presence: true, format: { with: katakana }
  validates :first_name_kana, presence: true, format: { with: katakana }
  postal_code = /\A\d{7}\z/ # 郵便番号（半角、ハイフンなし7桁）
  validates :postal_code, presence: true, format: { with: postal_code }
  validates :address, presence: true
  telephone_number = /\A\d{10,11}\z/ # 電話番号(ハイフンなし10桁or11桁)
  validates :telephone_number, presence: true, format: { with: telephone_number }

  
  #ゲストログインをするための新規登録のデータ登録
  def self.guest
    find_or_create_by!(email: 'guest@test.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      # customer.customer_id = 1
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
