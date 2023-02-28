class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @categories = Category.order(:name)
    @category = Category.find(params[:id])
  end
end
