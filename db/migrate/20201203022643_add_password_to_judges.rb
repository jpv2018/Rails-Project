class AddPasswordToJudges < ActiveRecord::Migration[6.0]
  def change
    add_column :judges, :password, :string
  end
end
