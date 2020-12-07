class AddTotalToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :total, :integer
  end
end
