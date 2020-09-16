class User < ApplicationRecord
has_many :clients  
has_many :appointments 
has_many :locations
has_secure_password
end




#'/users'

#'/users/:id/appointments'
#'/users/:id/clients'
#'/users/:id/locations'


#'/appointments'

#'/appointments/:id/clients'
#'/appointments/:id/locations'