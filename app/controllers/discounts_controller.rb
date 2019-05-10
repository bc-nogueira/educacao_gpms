class DiscountsController < ApplicationController
  # load_and_authorize_resource

  def index
    @discounts = Discount.all
  end

  def new
    @discount = Discount.new
  end

  def create
    @discount = Discount.new(discount_params)
    render :new and return unless @discount.save
    flash[:notice] = 'Desconto criado com sucesso.'
    redirect_to discounts_path
  end

  def destroy
    Discount.find(params[:id]).destroy
    flash[:notice] = 'Desconto excluído com sucesso.'
    redirect_to discounts_path
  end

  private

  def discount_params
    params.require(:discount).permit(:title, :discount, :start_date, :end_date)
  end
end
