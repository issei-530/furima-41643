class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  validates :nickname, presence: true
  validates :name, presence: true
  validates :kana_name, presence: true
  validates :birth_id, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶー-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: '全角(カタカナ)を使用してください' } do
    validates :kana_name
  end
end
