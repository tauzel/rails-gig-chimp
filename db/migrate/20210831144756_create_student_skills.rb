class CreateStudentSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :student_skills do |t|
      t.references :student, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true
    end
  end
end
