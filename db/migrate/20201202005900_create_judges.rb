class CreateJudges < ActiveRecord::Migration[6.0]
  def change
    create_table :judges do |t|
      t.string :first_name
      t.string :last_name
      t.string :organization
      t.string :email
      t.string :judge_number
      t.timestamps
    end
  end
end
