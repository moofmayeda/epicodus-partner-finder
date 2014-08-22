class Completion < ActiveRecord::Base
  validates :date, :presence => true
  validates :lesson_id, :presence => true
  belongs_to :student
  belongs_to :lesson
end
