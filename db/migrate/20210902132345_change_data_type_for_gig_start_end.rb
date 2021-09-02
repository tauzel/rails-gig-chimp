class ChangeDataTypeForGigStartEnd < ActiveRecord::Migration[6.0]
  def change
    change_column :gigs, :start, :datetime
    change_column :gigs, :end, :datetime
  end
end
