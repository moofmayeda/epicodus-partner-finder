class CompletionsController < ApplicationController
  def create
    @student = Student.find(params[:id])
    @completion = @student.completions.new(params[:completion])
    if @completion.save
      flash[:notice] = "Lesson marked as complete."
      redirect_to("/#{@student.name}")
    else
      render('students/show.html.erb')
    end
  end

  def destroy
    @completion = Completion.find(params[:id])
    @student = Student.find(@completion.student_id)
    @completion.destroy
    redirect_to("/#{@student.name}")
  end
end
