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
    updated = self.completions.order(:created_at).last.created_at
    if (updated < (Time.new - 2*24*60*60)) || (updated > (Time.new - 24*60*60))
      ordered_lessons[Lesson.all.order(:number).find_index(last_lesson) + 1]
    else
      ordered_lessons[Lesson.all.order(:number).find_index(last_lesson) + 2]
    end
  end

  def pairs
    potentials = []
    Student.all.each do |student|
      potentials << student if student.next == self.next unless student == self
    end
    potentials
  end
end
