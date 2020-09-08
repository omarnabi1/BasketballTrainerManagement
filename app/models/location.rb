class Location < ApplicationRecord
belongs_to :user
has_many :appointments, dependent: :destroy
has_many :clients, through: :appointments
end
