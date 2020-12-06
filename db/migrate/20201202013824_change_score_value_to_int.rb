class ChangeScoreValueToInt < ActiveRecord::Migration[6.0]
  def change
    change_column :scores, :amount, :integer
  end
end
