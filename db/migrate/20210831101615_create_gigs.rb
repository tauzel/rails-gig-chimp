class CreateGigs < ActiveRecord::Migration[6.0]
  def change
    create_table :gigs do |t|
      t.string :name
      t.date :start
      t.date :end
      t.string :description
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
