class AddConfirmableToDevise < ActiveRecord::Migration
  def up
    add_index :users, :confirmation_token, unique: true
  end
 def down
  remove_columns :users, :confirmation_token, :confirmed_at, :confirmation_sent_at
 end
end
