class ChangeStatusColumnToIntAndIncludeDefault < ActiveRecord::Migration
  def change
    remove_column :pets, :status, :string
    add_column :pets, :status, :integer, default: 0
  end
end
