class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation

  has_secure_password

  validates :password, :presence => true, :on => :create 
  validates :name, :email, :presence => true
  validates :email, :uniqueness => true

  has_many :reviews

end
