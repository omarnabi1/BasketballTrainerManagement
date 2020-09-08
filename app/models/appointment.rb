class Appointment < ApplicationRecord
belongs_to :location
belongs_to :user
belongs_to :client
  
accepts_nested_attributes_for :client
accepts_nested_attributes_for :location
end
