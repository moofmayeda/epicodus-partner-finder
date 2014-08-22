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

  describe "pairs" do
    it "returns the students whose next lesson is that one" do
      new_student1 = Student.create(name: "moof")
      new_student2 = Student.create(name: "mark")
      new_student3 = Student.create(name: "blnkt")
      lesson1 = Lesson.create(name: "one", number: 1)
      lesson2 = Lesson.create(name: "two", number: 2)
      lesson3 = Lesson.create(name: "three", number: 3)
      new_student1.completions.create(lesson_id: lesson1.id, date: "2014-08-21")
      new_student2.completions.create(lesson_id: lesson1.id, date: "2014-08-22")
      new_student3.completions.create(lesson_id: lesson1.id, date: "2014-08-22")
      new_student3.completions.create(lesson_id: lesson2.id, date: "2014-08-22")
      expect(lesson2.pairs).to eq [new_student2, new_student1]
    end
  end
end
