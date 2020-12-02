class RemovePasswordFromPlayers < ActiveRecord::Migration[6.0]
  def change
    remove_column :players, :password_digest
  end
end
