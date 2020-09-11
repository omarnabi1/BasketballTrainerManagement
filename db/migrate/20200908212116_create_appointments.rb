class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.datetime :appointment_time
      t.integer :duration
      t.float :price
      t.string :client_id
      t.string :location_id
      t.integer :user_id

     

      t.timestamps
    end
  end
end
