class User < ApplicationRecord
has_many :clients, dependent: :destroy  
has_many :appointments, dependent: :destroy  
has_many :locations, dependent: :destroy  
has_secure_password
end



#'/users'

#'/users/:id/appointments'
#'/users/:id/clients'
#'/users/:id/locations'


#'/appointments'

#'/appointments/:id/clients'
#'/appointments/:id/locations'