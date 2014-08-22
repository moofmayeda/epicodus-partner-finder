class StudentsController < ApplicationController
  def index
    @students = Student.all
    @student = Student.new
    render('students/index.html.erb')
  end
end
