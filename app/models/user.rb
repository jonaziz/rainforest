class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation

  has_secure_password

  validates :name, :email, :presence => true
  validates :email, :uniqueness => true
end