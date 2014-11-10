class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :restaurants
  has_many :reservations
  has_many :stars

  def owner?
  	isOwner = false
  	if self.role == "owner"
  		isOwner = true
  	end
  end

  def self.patron?
  	isPatron = false
  	if self.role == "patron"
  		isPatron = true
  	end
  end
end
