class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :nickname
      t.string :city
      t.string :street_address
      t.string :state
      t.string :zipcode
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
