class Location < ApplicationRecord
belongs_to :user
has_many :appointments, dependent: :destroy
has_many :clients, through: :appointments
validates_presence_of :nickname
validates_presence_of :city
validates_presence_of :street_address
validates_presence_of :state
validates_presence_of :zipcode
end


