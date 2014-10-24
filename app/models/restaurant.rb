  class Restaurant < ActiveRecord::Base
    validates_presence_of :name, :description, :phone, :address

  end