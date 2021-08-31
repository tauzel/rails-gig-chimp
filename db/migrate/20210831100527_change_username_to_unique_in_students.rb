class ChangeUsernameToUniqueInStudents < ActiveRecord::Migration[6.0]
  def change
    add_index :students, :username, unique: true
  end
end
