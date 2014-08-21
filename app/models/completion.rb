class Completion < ActiveRecord::Base
  validates :date, :presence => true
  belongs_to :student
  belongs_to :lesson
end
