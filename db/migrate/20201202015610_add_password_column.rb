class AddPasswordColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :judges, :password_digest, :string
    add_column :players, :password_digest, :string
  end
end
