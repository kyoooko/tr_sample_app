class User < ApplicationRecord

  # validates :name, presence: true
  # validates :email, presence: true
  # validates :name,  presence: true, length: { maximum: 50 }
  # validates :email, presence: true, length: { maximum: 255 }


  before_save { self.email = email.downcase }
  # 演習：左辺はどうなったか？
  # before_save { email.downcase! }

  # １０章
  attr_accessor :remember_token
  # 上記は右辺self略
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence:   true, length: { maximum: 255 },
                    format:     { with: VALID_EMAIL_REGEX }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
                    
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

   # ９章ランダムなトークンを返す(self.new_tokenにも書き換えられる)
   def User.new_token
    SecureRandom.urlsafe_base64
   end

   # 10章永続セッションのためにユーザーをデータベースに記憶する
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # 渡されたトークンがダイジェストと一致したらtrueを返す
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # ユーザーのログイン情報を破棄する
  def forget
    update_attribute(:remember_digest, nil)
  end

  # これはなんで消したかわからない
  # log_out if logged_in?

end
