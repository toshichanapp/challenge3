class CreateHouses < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |t|
      t.references :city, foreing_key: true
      t.string :firstname
      t.string :lastname
      t.integer :num_of_people
      t.boolean :has_child, default: false, null: false
      t.timestamps
    end
  end
end
