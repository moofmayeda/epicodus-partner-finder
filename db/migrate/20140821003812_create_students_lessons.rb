class CreateStudentsLessons < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.timestamps
    end

    create_table :completed_lessons do |t|
      t.belongs_to :student
      t.belongs_to :lesson
      t.date :date
      t.timestamps
    end

    create_table :lessons do |t|
      t.string :name
      t.integer :number
    end
  end
end
