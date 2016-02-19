class ChangeLocationColumnToIntAndIncludeDefault < ActiveRecord::Migration
  def change
    remove_column :pets, :location, :string
    add_column :pets, :location, :integer, default: 0
  end
end
