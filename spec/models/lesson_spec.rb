require 'rails_helper'

describe Lesson do
  it {should validate_presence_of :name}
  it {should validate_numericality_of :number}
  it {should have_many :completions}
  it {should have_many :students}
end
