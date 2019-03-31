class User < ApplicationRecord

  before_save { email.downcase! }
  before_create :check_max_value

  def check_max_value
    if User.last != nil
      self.id = User.last.id + 1
    else
      self.id = 0

    end
  end

  validates :full_name, presence: true, length: {maximum: 50}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 100},
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: {case_sensitive: false}


  has_secure_password

  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true




  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
               BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end


end
