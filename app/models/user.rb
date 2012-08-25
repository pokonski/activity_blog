class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :nickname, :avatar_url, :password, :password_confirmation, :remember_me
  has_many :posts

  def to_param
    nickname
  end
end
