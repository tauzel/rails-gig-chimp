class AddLocationToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :location, :string
  end
end
