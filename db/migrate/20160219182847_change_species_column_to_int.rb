class ChangeSpeciesColumnToInt < ActiveRecord::Migration
  def change
    remove_column :pets, :species, :string
    add_column :pets, :species, :integer
  end
end
