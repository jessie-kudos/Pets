class AddPetReferenceToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :pet_id, :integer
    add_index :photos, :pet_id
  end
end
