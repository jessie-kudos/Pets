class ChangeColourColumnToAnInt < ActiveRecord::Migration
  def change
    remove_column :pets, :colour, :string
    add_column :pets, :colour, :int
  end
end
