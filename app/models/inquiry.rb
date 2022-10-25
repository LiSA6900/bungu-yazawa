class Inquiry < ApplicationRecord
    belongs_to :customer
    has_many :notifications, dependent: :destroy
    has_many :schedules, dependent: :destroy
    
    validates :title, presence: true
    validates :body, presence: true
    
    #ファイルを複数選択できるようにしてるから複数形（コマンドを押しながら複数選択できる）
    has_many_attached :images
    
    # Inquiry.order_statuses, Inquiry.uncofirmed, Inquiry.last.unconfirmed?, Inquiry.last.unconfirmed!
    enum order_status: { unconfirmed: 0, not_received: 1, order_received: 2, done: 3 }
    
    #検索窓の実装
    def self.search(search)
      if search
        Inquiry.where(['title LIKE ? or body LIKE ?', "%#{search}%", "%#{search}%"])
      else
        Inquiry.all
      end
    end
    
end



