class User < ApplicationRecord
  before_save { email.downcase! }
  validates(:name, presence: true, length: {maximum:50})
  #validation of email, it has to be input, with max length 255, fulfill regex format, be unique and no case sEnSiTiVe
  # since we added callback before_save, which put all letters downcase, we also use uniqueness:true again
  validates(:email, presence: true, length: {maximum:255, format: {with: /VALID_EMAIL_REGEX/}}, uniqueness: true )
  has_secure_password
  validates :password,  presence: true, length: { minimum: 6}

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
