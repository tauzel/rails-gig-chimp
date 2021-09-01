class Student < ApplicationRecord
  has_many :gigs
  has_many :student_skills, dependent: :destroy
  has_many :skills, through: :student_skills

  validates :username, presence: true, uniqueness: true
  validates :opt_in, presence: true
  validates :batch, numericality: {only_integer: true}
end
