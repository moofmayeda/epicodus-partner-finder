class Student < ActiveRecord::Base
  has_many :completions
  has_many :lessons, through: :completions

  validates :name, presence: true, uniqueness: true

  default_scope { order(:name) }

  def not_done
    Lesson.all - self.lessons
  end

  def next
    last_lesson = self.lessons.order(:number).last
    ordered_lessons = Lesson.all.order(:number)
    ordered_lessons[Lesson.all.order(:number).find_index(last_lesson) + 1]
  end

  def pairs
    potentials = []
    Student.all.each do |student|
      potentials << student if student.next == self.next unless student == self
    end
    potentials
  end
end
