class User < ApplicationRecord
  before_save { email.downcase! }
  validates(:name, presence: true, length: {maximum:50})
  #VER VALID_EMAIL_REGEX
  VER=/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  #validation of email, it has to be input, with max length 255, fulfill regex format, be unique and no case sEnSiTiVe
  # since we added callback before_save, which put all letters downcase, we also use uniqueness:true again
  validates(:email, presence: true, length: {maximum:255, format: {with: /VER/}}, uniqueness: true )
  has_secure_password
  validates :password,  presence: true, length: { minimum: 6}
end
