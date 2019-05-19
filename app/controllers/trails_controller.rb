class TrailsController < ApplicationController
  load_and_authorize_resource
  before_action :find_trail, only: [:show, :edit, :update]

  def index
    @trails = Trail.all
  end

  def show; end

  def new
    @trail = Trail.new
  end

  def create
    @trail = Trail.new(trail_params)
    render :new and return unless @trail.save
    flash[:notice] = 'Trilha criada com sucesso.'
    redirect_to @trail
  end

  def edit; end

  def update
    render :edit and return unless @trail.update(trail_params)
    flash[:notice] = 'Trilha atualizada com sucesso!'
    redirect_to @trail
  end

  def destroy
    @trail.destroy
    flash[:notice] = 'Trilha excluída com sucesso.'
    redirect_to trails_path
  end

  private

  def trail_params
    params.require(:trail).permit(:title, :description, :image)
  end

  def find_trail
    @trail = Trail.find(params[:id])
  end
end
