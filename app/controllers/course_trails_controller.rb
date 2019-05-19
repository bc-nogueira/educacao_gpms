class CourseTrailsController < ApplicationController
  load_and_authorize_resource
  before_action :check_course_present, only: :create


  def new
    @course_trail = CourseTrail.new(trail_id: params[:trail_id])
  end

  def create
    @course_trail = CourseTrail.new(course_trail_params)
    @course_trail.position = @course_trail.trail.courses.size + 1
    render :new and return unless @course_trail.save
    flash[:notice] = 'Curso adicionado à trilha com sucesso.'
    redirect_to @course_trail.trail
  end

  def destroy
    course_trail = CourseTrail.find(params[:id])
    trail = course_trail.trail
    course_trail.destroy
    flash[:notice] = 'Curso removido da trilha com sucesso.'
    redirect_to trail_path(trail)
  end

  private

  def course_trail_params
    params.require(:course_trail).permit(:trail_id, :course_id)
  end

  def check_course_present
    course_id = params[:course_trail][:course_id]
    trail_id = params[:course_trail][:trail_id]
    return if CourseTrail.by_course(course_id).by_trail(trail_id).empty?
    flash[:error] = 'Esse curso já está presente na trilha.'
    render :new
  end
end
