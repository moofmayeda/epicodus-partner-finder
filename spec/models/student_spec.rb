require 'rails_helper'

describe Student do
  it {should validate_presence_of :name}
  it {should validate_uniqueness_of :name}
  it {should have_many :completions}
  it {should have_many :lessons}

  describe "not_done" do
    it "returns all lessons not done by the student" do
      new_student = Student.create(name: "moof")
      lesson1 = Lesson.create(name: "one", number: 1)
      lesson2 = Lesson.create(name: "two", number: 2)
      lesson3 = Lesson.create(name: "three", number: 3)
      lesson4 = Lesson.create(name: "four", number: 4)
      lesson5 = Lesson.create(name: "five", number: 5)
      new_student.completions.create(lesson_id: lesson1.id, date: "2014-08-21")
      new_student.completions.create(lesson_id: lesson3.id, date: "2014-08-22")
      expect(new_student.not_done).to eq [lesson2, lesson4, lesson5]
    end
  end

  describe "next" do
    it "returns a student's next lesson, allowing skipping" do
      new_student = Student.create(name: "moof")
      lesson1 = Lesson.create(name: "one", number: 1)
      lesson2 = Lesson.create(name: "two", number: 2)
      lesson3 = Lesson.create(name: "three", number: 3)
      lesson4 = Lesson.create(name: "four", number: 4)
      lesson5 = Lesson.create(name: "five", number: 5)
      new_student.completions.create(lesson_id: lesson1.id, date: "2014-08-21")
      new_student.completions.create(lesson_id: lesson3.id, date: "2014-08-22")
      expect(new_student.next).to eq lesson4
    end
  end

  describe "pairs" do
    it "returns students who have the same next lesson" do
      new_student1 = Student.create(name: "moof")
      new_student2 = Student.create(name: "blnkt")
      lesson1 = Lesson.create(name: "one", number: 1)
      lesson2 = Lesson.create(name: "two", number: 2)
      lesson3 = Lesson.create(name: "three", number: 3)
      lesson4 = Lesson.create(name: "four", number: 4)
      lesson5 = Lesson.create(name: "five", number: 5)
      new_student1.completions.create(lesson_id: lesson1.id, date: "2014-08-21")
      new_student2.completions.create(lesson_id: lesson1.id, date: "2014-08-22")
      expect(new_student1.pairs).to eq [new_student2]
    end
  end
end
