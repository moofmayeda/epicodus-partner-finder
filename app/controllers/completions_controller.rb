class CompletionsController < ApplicationController
  def create
    @students = Student.all
    @student = Student.find(params[:id])
    @completion = @student.completions.new(params[:completion])
    if @completion.save
      flash[:notice] = "Lesson marked as complete."
      stop
      redirect_to("/")
    else
      render('students/index.html.erb')
    end
  end
end
