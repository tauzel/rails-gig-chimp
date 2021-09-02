class Gig < ApplicationRecord
  belongs_to :user
  has_many :gig_students, dependent: :destroy
  has_many :students, through: :gig_students
  has_one :review

  validates :name, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validates :description, presence: true
end
