require 'rails_helper'

describe Student do
  it {should validate_presence_of :name}
  it {should have_many :completions}
  it {should have_many :lessons}
end
