class User < ApplicationRecord
  has_many :offers, dependent: :destroy

  before_save { email.downcase! }

  validates :name, presence: true, length: {maximum: 50}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
            format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}

  has_secure_password

  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  
  def self.search(name, admin, email)

    if admin
      User.where("name like ? and email like ? and admin = ?", "%#{name}%", "%#{email}%", true)
    else
      User.where("name like ? and email like ?", "%#{name}%", "%#{email}%")
    end
  end


end
