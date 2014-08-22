class Student < ActiveRecord::Base
  has_many :completions
  has_many :lessons, through: :completions

  validates :name, presence: true, uniqueness: true

  default_scope { order(:name) }

  def not_done
    Lesson.all - self.lessons
  end
end
