class Lesson < ActiveRecord::Base
  validates :name, presence: true
  validates :number, numericality: { only_integer: true }
  has_many :completions
  has_many :students, through: :completions

  default_scope { order(:number) }

  def date(student)
    student.completions.where(lesson_id: self.id).first.date
  end

  def pairs
    potential = []
    Student.all.each do |student|
      potential << student if student.next == self
    end
    potential
  end

  def incomplete_students
    Student.all - self.students
  end
end
