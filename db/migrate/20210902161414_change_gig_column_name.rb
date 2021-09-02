class ChangeGigColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :gigs, :start, :starts_at
    rename_column :gigs, :end, :ends_at
  end
end
