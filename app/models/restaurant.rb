  class Restaurant < ActiveRecord::Base
    validates_presence_of :name, :description, :phone, :address, :city, :state
    geocoded_by :address

    after_validation :geocode 
    belongs_to :user
    has_many :reservations
    has_and_belongs_to_many :categories
    has_many :stars
    has_many :starred_by, through: :stars, source: :user
    mount_uploader :image, ImageUploader

  end