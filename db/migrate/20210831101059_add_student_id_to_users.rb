class AddStudentIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :student, foreign_key: true
  end
end
