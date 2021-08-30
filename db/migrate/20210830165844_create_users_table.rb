class CreateUsersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :users_tables do |t|
      t.string :email, null: false, unique: true
      t.string :password, null: false
      t.string :name

      t.timestamps
    end
  end
end
