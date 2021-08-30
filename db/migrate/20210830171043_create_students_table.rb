class CreateStudentsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :students_tables do |t|
      t.string :username, null: false, unique: true
      t.string :name, null: false
      t.string :picture_url
      t.boolean :opt_in, null: false, default: true
      t.text :description
      t.integer :batch

      t.timestamps
    end
  end
end
