require 'rails_helper'

describe Lesson do
  it {should validate_presence_of :name}
  it {should validate_numericality_of :number}
  it {should have_many :completions}
  it {should have_many :students}

  describe "date" do
    it "returns the date when the given student completed the lesson" do
      new_student = Student.create(name: "moof")
      lesson1 = Lesson.create(name: "one", number: 1)
      lesson3 = Lesson.create(name: "three", number: 3)
      new_student.completions.create(lesson_id: lesson1.id, date: "2014-08-21")
      new_student.completions.create(lesson_id: lesson3.id, date: "2014-08-22")
      expect(lesson3.date(new_student)).to eq Date.parse("Fri, 22 Aug 2014")
    end
  end
end
