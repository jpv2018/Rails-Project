class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.belongs_to :player
      t.belongs_to :judge
      t.string :amount

      t.timestamps
    end
  end
end
