class AddCoordinatesToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :latitude, :float
    add_column :students, :longitude, :float
  end
end
