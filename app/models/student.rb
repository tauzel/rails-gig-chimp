class Student < ApplicationRecord
  has_many :gig_students, dependent: :destroy
  has_many :gigs, through: :gig_students
  has_many :student_skills, dependent: :destroy
  has_many :skills, through: :student_skills

  validates :username, presence: true, uniqueness: true
  validates :opt_in, presence: true
  validates :batch, numericality: {only_integer: true}

  # scope :available, -> { where(...) }

  def self.available(start_date=nil, end_date=nil)
    if start_date.nil? && end_date.nil?
      Student.all
    else
      conflict_gigs = Gig.where("ends_at > ? AND starts_at < ?", start_date, end_date)
      busy_students = conflict_gigs.flat_map(&:student_ids)
      where.not(id: busy_students)
    end
  end
end
