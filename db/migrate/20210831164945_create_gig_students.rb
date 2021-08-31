class CreateGigStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :gig_students do |t|
      t.references :gig, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
    end
  end
end
