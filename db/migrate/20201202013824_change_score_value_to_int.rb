class ChangeScoreValueToInt < ActiveRecord::Migration[6.0]
  def change
    change_column :scores, :amount, :integer
    change_column_default :scores, :amount, 0
  end
end
