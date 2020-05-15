class User < ApplicationRecord

  # validates :name, presence: true
  # validates :email, presence: true
  # validates :name,  presence: true, length: { maximum: 50 }
  # validates :email, presence: true, length: { maximum: 255 }


  before_save { self.email = email.downcase }
  # 演習：左辺はどうなったか？
  # before_save { email.downcase! }

  # 上記は右辺self略
  
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence:   true, length: { maximum: 255 },
                    format:     { with: VALID_EMAIL_REGEX }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
 
has_secure_password

end
