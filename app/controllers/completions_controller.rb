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
end
