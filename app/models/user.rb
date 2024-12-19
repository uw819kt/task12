class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  
  with_options presence: true do
  validates :name, presence: { message: 'を入力してください' }
  validates :name,length: { maximum: 30 }
  validates :email, presence: { message: 'を入力してください' }
  validates :email, length: { maximum: 255 }
  validates :email, uniqueness: { message: 'は既に使用されています' }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence: { message: 'を入力してください' }
  validates :password, length: { minimum: 6,
             too_short: "パスワードは6文字以上で入力してください",            
            }

end
