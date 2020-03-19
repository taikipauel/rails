class User < ApplicationRecord
  before_save { self.email.downcase! } #保存される前にemail属性を小文字に変換
  validates(:name, presence: true, length: { maximum: 50 }) #最後のは、オプションハッシュ。最後の引数だから、波かっこをつけなくてよい！
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
                
has_secure_password
validates :password, presence: true, length: { minimum: 6 }
end

