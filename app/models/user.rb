class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :kana_first, presence: true
  validates :kana_last, presence: true
  validates :birth_id, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶー-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :first_name, :last_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: '全角(カタカナ)を使用してください' } do
    validates :kana_first, :kana_last
  end
  validates :password, format: { with: /\A[a-zA-z0-9]+\z/, message: 'は半角英数字のみで入力してください' }
end
