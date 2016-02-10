class RemovePhotosFromPets < ActiveRecord::Migration
  def change
    remove_column :pets, :photos_file_name, :string
    remove_column :pets, :photos_content_type, :string
    remove_column :pets, :photos_file_size, :integer
    remove_column :pets, :photos_updated_at, :datetime
  end
end
