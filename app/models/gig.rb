class Gig < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :start, presence: true
  validates :end, presence: true
  validates :description, presence: true
  validates_type :start, :date
  validates_type :end, :date

end
