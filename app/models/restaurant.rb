class Restaurant < ActiveRecord::Base
    validates_presence_of :name, :description, :phone, :address, :city, :state
    acts_as_gmappable
    belongs_to :user
    has_many :reservations
    has_and_belongs_to_many :categories
    has_many :stars
    has_many :starred_by, through: :stars, source: :user
    mount_uploader :image, ImageUploader

    validates :phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }
    validates_format_of :name, :with => /\A[a-zA-Z0-9 \-']+\Z/,
    :message => "can only contain letters and numbers.", :maximum => '30'
    
    def gmaps4rails_address
        "#{address}, #{city}, #{state}"
    end
end