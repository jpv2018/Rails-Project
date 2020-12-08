class AddUidToJudges < ActiveRecord::Migration[6.0]
  def change
    add_column :judges, :uid, :string
  end
end
