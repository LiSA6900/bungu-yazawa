class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :inquiries, dependent: :destroy
  
  password = /\A(?=.*[A-Z])[a-zA-Z0-9]+\z/ # 半角英数字（大文字・小文字・数字）&少なくとも大文字が一つ含まれる
  validates :password, presence:true, format: { with: password }, on: :create
  validates :last_name, presence: true
  validates :first_name, presence: true
  katakana = /\A[ァ-ヶー－]+\z/ # 全角カタカナ
  validates :last_name_kana, presence: true, format: { with: katakana }
  validates :first_name_kana, presence: true, format: { with: katakana }
  postal_code = /\A\d{7}\z/ # 半角、ハイフンなし7桁
  validates :postal_code, presence: true, format: { with: postal_code }
  validates :address, presence: true
  telephone_number = /\A\d{10,11}\z/ # 半角、ハイフンなし10桁or11桁
  validates :telephone_number, presence: true, format: { with: telephone_number }

  
  #ゲストログインをするための新規登録のデータ登録
  def self.guest
    find_or_create_by!(email: 'guest@test.com') do |customer|
      customer.password = [
      # SecureRandom.urlsafe_base64
        [*0..9].sample(2),
        [*'a'..'z'].sample(2),
        [*'A'..'Z'].sample(2),
      ].sum([]).shuffle.join
      
      customer.last_name = 'ゲスト'
      customer.first_name = 'さん'
      customer.last_name_kana = 'ゲスト'
      customer.first_name_kana = 'サン'
      customer.postal_code = '0000000'
      customer.address = 'サンプル0-0'
      customer.telephone_number = '00000000000'
    end
  end
  
  # is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super &&  (is_deleted == false)

  end
end
