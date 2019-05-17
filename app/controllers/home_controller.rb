class HomeController < ApplicationController
  def index
    @courses = Course.all
    @well_evaluated = @courses.select { |course| course.average_rate >= 4 }[0..4]
    @well_evaluated.sort_by{ |course| [course.average_rate]}.reverse!
    @teachers = Teacher.all
  end
end
