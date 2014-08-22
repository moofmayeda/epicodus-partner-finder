class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
    @lesson = Lesson.new
    render('lessons/index.html.erb')
  end

  def create
    @lessons = Lesson.all
    @lesson = Lesson.new(params[:lesson])
    if @lesson.save
      flash[:notice] = "Lesson created!"
      redirect_to("/lessons")
    else
      render('lessons/index.html.erb')
    end
  end
end
