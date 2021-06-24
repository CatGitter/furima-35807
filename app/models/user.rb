class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
        validates :password,        format: { with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
        validates :nickname
        validates :last_name,       format: { with:/\A[ぁ-んァ-ン一-龥々]/ }
        validates :first_name,      format: { with:/\A[ぁ-んァ-ン一-龥々]/ }
        validates :kana_last_name,  format: { with:/\A[ァ-ヶー－]+\z/ }
        validates :kana_first_name, format: { with:/\A[ァ-ヶー－]+\z/ }
        validates :birthday
  end
end
