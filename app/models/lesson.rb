class Lesson < ActiveRecord::Base
  validates :name, presence: true
  validates :number, numericality: { only_integer: true }
  has_many :completions
  has_many :students, through: :completions
end
