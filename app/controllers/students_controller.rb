class StudentsController < ApplicationController
  def index
    @students = Student.all
    @student = Student.new
    render('students/index.html.erb')
  end

  def create
    @students = Student.all
    @student = Student.new(params[:student])
    if @student.save
      flash[:notice] = "Student added!"
      redirect_to("/")
    else
      render('students/index.html.erb')
    end
  end

  def show
    @student = Student.find_by name: params[:name]
    @completion = Completion.new
    if Lesson.all.empty?
      flash[:alert] = "No lessons. Create a lesson to get started."
      redirect_to lessons_path
    else
      @lessons = Lesson.all
      @lessons_dates = @lessons.map do |lesson|
        if @student.lessons.include?(lesson)
          lesson.date(@student)
        else
          ""
        end
      end
      @selected = @student.not_done.map do |lesson|
        if lesson == @student.next
          "selected"
        else
          ""
        end
      end
      render('students/show.html.erb')
    end
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(params[:student])
      flash[:notice] = "Student updated!"
      redirect_to("/#{@student.name}")
    else
      render('students/show.html.erb')
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.completions.destroy_all
    @student.destroy
    redirect_to("/")
  end
end
