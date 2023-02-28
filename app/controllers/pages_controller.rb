class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]

  def home
    @categories = Category.order(:name)
  end
end
