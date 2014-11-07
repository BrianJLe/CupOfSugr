class Reservation < ActiveRecord::Base
	validates_presence_of :email, :message, :reserve_time, :reserve_date
	#before_action :authenticate_user!

	belongs_to :user
	belongs_to :restaurant
end
