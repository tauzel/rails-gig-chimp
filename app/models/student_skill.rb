class StudentSkill < ApplicationRecord
  belongs_to :student
  belongs_to :skill
end
