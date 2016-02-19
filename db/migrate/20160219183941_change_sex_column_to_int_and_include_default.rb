class ChangeSexColumnToIntAndIncludeDefault < ActiveRecord::Migration
  def change
    remove_column :pets, :sex, :integer
    add_column :pets, :sex, :integer, default: 0
  end
end
