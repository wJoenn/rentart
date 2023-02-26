class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.art = Art.find(params[:art_id])

    if @review.save
      redirect_to art_path(@review.art, reviewed: "true")
    else
      redirect_to art_path(@review.art, reviewed: "false")
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
