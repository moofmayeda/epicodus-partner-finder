class Student < ActiveRecord::Base
  validates :name, presence: true
  has_many :completions
  has_many :lessons, through: :completions
end
