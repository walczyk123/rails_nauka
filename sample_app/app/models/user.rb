class User < ApplicationRecord
  validates(:name, presence: true, length: {maximum:50})
  #VER VALID_EMAIL_REGEX
  VER=/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  #validation of email, it has to be input, with max length 255, fulfill regex format, be unique and no case sEnSiTiVe
  validates(:email, presence: true, length: {maximum:255, format: {with: /VER/}}, uniqueness: {  case_sensitive: false })
end
