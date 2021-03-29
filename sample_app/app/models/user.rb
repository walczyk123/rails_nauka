class User < ApplicationRecord
  before_save { email.downcase! }
  attr_accessor :remember_token

  validates(:name, presence: true, length: {maximum:50})
  #validation of email, it has to be input, with max length 255, fulfill regex format, be unique and no case sEnSiTiVe
  # since we added callback before_save, which put all letters downcase, we also use uniqueness:true again
  VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates(:email, presence: true, length: {maximum:255, format: {with: /VALID_EMAIL_REGEX/}}, uniqueness: true )
  has_secure_password
  validates :password,  presence: true, length: { minimum: 6}

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
end
