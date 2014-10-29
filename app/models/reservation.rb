class Reservation < ActiveRecord::Base
    validates_presence_of :email, :restaurant_id, :reserve_time, :reserve_date

end
