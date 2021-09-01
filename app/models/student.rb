class Student < ApplicationRecord
  has_many :gig_students, dependent: :destroy
  has_many :gigs, through: :gig_students
  has_many :student_skills, dependent: :destroy
  has_many :skills, through: :student_skills

  validates :username, presence: true, uniqueness: true
  validates :opt_in, presence: true
  validates :batch, numericality: {only_integer: true}
end
