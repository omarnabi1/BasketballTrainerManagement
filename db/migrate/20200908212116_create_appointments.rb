class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.datetime :appointment_time
      t.integer :duration
      t.float :price
      t.belongs_to :location, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.belongs_to :client, foreign_key: true


      t.timestamps
    end
  end
end
