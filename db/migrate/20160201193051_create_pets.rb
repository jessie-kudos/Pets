class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :species
      t.string :name
      t.string :sex
      t.string :colour
      t.string :identification
      t.string :location
      t.attachment :photos
      t.text :description
      t.string :status
      t.timestamps null: false
    end
  end
end
