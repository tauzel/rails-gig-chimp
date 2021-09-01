class Skill < ApplicationRecord
  has_many :student_skills, dependent: :destroy
  has_many :students, through: :student_skills
end
