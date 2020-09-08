class Client < ApplicationRecord
belongs_to :user
has_many :appointments, dependent: :destroy
has_many :locations, through: :appointments
end
