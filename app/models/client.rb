class Client < ApplicationRecord
    belongs_to :user
    has_many :appointments, dependent: :destroy
    has_many :locations, through: :appointments
    validates_presence_of :name
    validates_presence_of :phone_number
    validates_presence_of :email
    end

    