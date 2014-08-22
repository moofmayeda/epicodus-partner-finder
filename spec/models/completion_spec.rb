require 'rails_helper'

describe Completion do
  it {should validate_presence_of :date}
  it {should validate_presence_of :lesson_id}
  it {should belong_to :student}
  it {should belong_to :lesson}
end
