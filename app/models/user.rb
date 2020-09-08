class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :birthday

    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,100}+\z/i.freeze
    validates :password,format: {with: PASSWORD_REGEX}
    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
    validates_format_of :email, with: EMAIL_REGEX, uniqueness: true
  end
end
