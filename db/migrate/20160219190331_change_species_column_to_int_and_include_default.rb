class ChangeSpeciesColumnToIntAndIncludeDefault < ActiveRecord::Migration
  def change
    remove_column :pets, :species, :integer
    add_column :pets, :species, :integer, default: 0
  end
end
