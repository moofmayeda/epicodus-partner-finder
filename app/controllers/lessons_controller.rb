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

  def show
    @students = Student.all
    @lesson = Lesson.find(params[:id])
    render('lessons/show.html.erb')
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update(params[:lesson])
      flash[:notice] = "lesson updated!"
      redirect_to("/lessons/#{@lesson.id}")
    else
      render('lessons/show.html.erb')
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.completions.destroy_all
    @lesson.destroy
    redirect_to("/lessons")
  end
end
