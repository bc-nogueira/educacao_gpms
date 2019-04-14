class HomeController < ApplicationController
  def index
    @courses = Course.all
    @teachers = Teacher.all
  end
end
