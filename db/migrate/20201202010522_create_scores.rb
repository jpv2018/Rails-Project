class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.string :player_id
      t.string :judge_id
      t.string :amount

      t.timestamps
    end
  end
end
