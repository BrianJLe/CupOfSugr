  class Restaurant < ActiveRecord::Base
    validates_presence_of :name, :description, :phone, :address, :city, :state
    geocoded_by :address

    after_validation :geocode 

  end