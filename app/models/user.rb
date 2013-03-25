class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation

  has_secure_password
  # validates_confirmation_of :password
  # validates_presence_of :password, :on => :create
  # attr_reader :password
  # include ActiveModel::SecurePassword::InstanceMethodsOnActivation


  validates :name, :email, :presence => true
  validates :email, :uniqueness => true
end
