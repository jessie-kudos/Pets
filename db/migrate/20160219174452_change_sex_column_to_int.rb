class ChangeSexColumnToInt < ActiveRecord::Migration
  def change
    remove_column :pets, :sex, :string
    add_column :pets, :sex, :integer
  end
end
